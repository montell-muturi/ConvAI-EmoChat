import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import tensorflow as tf
import tensorflow_hub as hub
import tensorflow_text as text
from sklearn.model_selection import train_test_split
from tensorflow.keras.utils import to_categorical

df = pd.read_csv('train.csv')

df['sentiment'] = df['sentiment'].map(
    {"sadness": 0, "joy": 1, "love": 2, "anger": 3, "fear": 4, "surprise": 5})

features = ['content']
labels = ['sentiment']

x = df[features].values
y = df[labels].values
y = to_categorical(y)

train_data, test_data, train_label, test_label = train_test_split(
    x, y, test_size=0.2)

tfhub_handle_encoder = 'https://tfhub.dev/tensorflow/small_bert/bert_en_uncased_L-4_H-512_A-8/1'
tfhub_handle_preprocess = 'https://tfhub.dev/tensorflow/bert_en_uncased_preprocess/3'

bert_preprocess_model = hub.KerasLayer(tfhub_handle_preprocess)


def build_model():
    text_input = tf.keras.layers.Input(shape=(), dtype=tf.string, name='Text')
    preprocessing = hub.KerasLayer(
        tfhub_handle_preprocess, name='Preprocessing')
    encoder_inputs = preprocessing(text_input)
    encoder = hub.KerasLayer(tfhub_handle_encoder,
                             trainable=True, name='SmallBERT')
    outputs = encoder(encoder_inputs)
    dropout = tf.keras.layers.Dropout(0.1)(outputs['pooled_output'])
    classifier = tf.keras.layers.Dense(
        6, activation='softmax', name='Classifier')(dropout)
    return tf.keras.Model(text_input, classifier, name='Sentiment-Classifier-Model')


classifier_model = build_model()

loss = tf.keras.losses.CategoricalCrossentropy()
optimizer = tf.keras.optimizers.Adam(learning_rate=5e-5)

classifier_model.compile(
    optimizer=optimizer,
    loss=loss,
    metrics=['accuracy'])

classifier_model.summary()

history = classifier_model.fit(
    x=train_data,
    y=train_label,
    validation_split=0.2,
    batch_size=16,
    epochs=1)

classifier_model.save('classifier')
