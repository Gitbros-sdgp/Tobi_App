# Imports
import numpy as np
import pandas as pd
from BreedImage.readImg import readImg
import tensorflow as tf
import glob
import os

class breedClassification:

    # Gets the usable image from readImg class and passes it to the model, which in turn sends the classified breed.
    def verifyBreed(self, path, size):
        labels_dir = 'labels/Labels.csv'

        labels_read = pd.read_csv(labels_dir)
        breeds = labels_read['breed'].unique()

        id2breeds = {i: name for i, name in enumerate(breeds)}
        model = tf.keras.models.load_model('models/Breed_Model.h5')

        image = readImg.read_img(self=readImg, path=path, size=size)
        image = np.expand_dims(image, axis=0)
        pred = model.predict(image)[0]
        label_idx = np.argmax(pred)
        breed_names = id2breeds[label_idx]

        data = {
            "BreedName": breed_names
        }

        for filename in glob.glob('Test1/*.jpg'):
            os.remove(filename)

        return data