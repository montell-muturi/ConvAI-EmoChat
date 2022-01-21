import os
import numpy as np
import tensorflow_text
import tensorflow as tf
import tensorflow_hub as hub

from time import time
from flask import Flask, request
from transformers import AutoTokenizer, TFAutoModelForSeq2SeqLM, AdamWeightDecay

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

app = Flask(__name__)

classifier = tf.keras.models.load_model(
    './classifier.h5',
    custom_objects={
        'KerasLayer': hub.KerasLayer,
        'AdamWeightDecay': AdamWeightDecay
    }
)

tokenizer = AutoTokenizer.from_pretrained("facebook/blenderbot-400M-distill")
model = TFAutoModelForSeq2SeqLM.from_pretrained("facebook/blenderbot-400M-distill")


@app.route('/', methods=['GET'])
def index():
    return '<center>The chatbot only works with POST /send</center>'


@app.route('/send', methods=['POST'])
def run_models():
    req = request.get_json()
    if 'message' in req.keys():
        if req['history'] == []:
            req['history'] = [[]]
        inf = handle_inference(req)
        resp = generate_response(req)
        res = {
            "inference": inf,
            "response": resp
        }
        return res, 200
    else:
        return {"error": "error"}, 400


def handle_inference(req):

    emotions = ["sadness", "joy", "love", "anger", "fear", "surprise"]
    preds = classifier.predict([req['message']])
    pred_class = max(preds[0])
    preds = dict(zip([val.item() for val in preds[0]], emotions))

    res = {
        "prediction": preds[pred_class],
        "predictions": preds
    }
    return res


def generate_response(req):

    start = time()
    new_user_input_ids = tokenizer.encode(
        req["message"] + tokenizer.eos_token, return_tensors='tf'
    )

    bot_input_ids = tf.concat(
        [
            tf.convert_to_tensor(req["history"], dtype=tf.int32),
            tf.cast(new_user_input_ids, dtype=tf.int32)
        ],
        axis=-1
    )

    bot_output_ids = model.generate(
        bot_input_ids,
        min_length=10,
        max_length=100,
        pad_token_id=tokenizer.eos_token_id,
        num_beams=10,
        length_penalty=3,
        repetition_penalty=1.2,
        no_repeat_ngram_size=1,
        temperature=0.5,
        top_k=70,
        top_p=0.6
    )

    bot_output = tokenizer.decode(
        bot_output_ids[:, bot_input_ids.shape[-1]:][0], skip_special_tokens=True
    )
    stop = time()

    bot_res = {
        "history": np.array(bot_output_ids).tolist(),
        "reply": bot_output,
        "seconds": stop-start
    }

    return bot_res


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=1960)
