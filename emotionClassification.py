# Imports
import numpy as np
import pandas as pd
from BreedImage.readImg import readImg
import tensorflow as tf

class emotionClassification:

    # Gets the usable image from readImg class and passes it to the model, which in turn sends the classified emotion.
    def verifyEmotion(self, path, size):
        labels_dir = 'labels/emotionLabels.csv'

        labels_read = pd.read_csv(labels_dir)
        emotions = labels_read['Emotion'].unique()

        id2emotion = {i: name for i, name in enumerate(emotions)}
        model = tf.keras.models.load_model('models/Emotion_Model.h5')

        image = readImg.read_img(self=readImg, path=path, size=size)
        image = np.expand_dims(image, axis=0)
        pred = model.predict(image)[0]
        label_idx = np.argmax(pred)
        emotion_names = id2emotion[label_idx]

        return emotion_names