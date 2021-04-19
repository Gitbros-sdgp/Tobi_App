# Imports
import numpy as np
import pandas as pd
import cv2 as cv
from readImg import readImg
import tensorflow as tf


class breedClassification:

    # Gets the usable image from readImg class and passes it to the model, which in turn sends the classified breed.
    def verifyBreed():
        labels_dir =  'Labels.csv'

        labels_read = pd.read_csv(labels_dir)
        breeds = labels_read['breed'].unique()

        id2breeds = {i: name for i, name in enumerate(breeds)}
        model = tf.keras.models.load_model('Breed_Model.h5')

        # image = readImg.read_img(path=path, size=size)
        image = np.expand_dims(image, axis=0)
        pred = model.predict(image)[0]
        label_idx = np.argmax(pred)
        breed_names = id2breeds[label_idx]

        # ori_breed = breeds
        # ori_image = cv.imread(path, cv.IMREAD_COLOR)

        # ori_image = cv.putText(ori_image, breed_names, (0, 10), cv.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 1)
        data = {
            "BreedName":'Penis'
        }
        return data