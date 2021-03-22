import os
import numpy as np
import pandas as pd
import cv2 as cv

import tensorflow as tf

class breedClassification:
    def read_img(path, size):
        image = cv.imread(path, cv.IMREAD_COLOR)
        image = cv.resize(image, (size, size))
        image = image / 255.0
        image = image.astype(np.float32)

        return image

    def verifyBreed(path):
        labels_dir =  'Labels.csv'

        labels_read = pd.read_csv(labels_dir)
        breeds = labels_read['breed'].unique()

        id2breeds = {i: name for i, name in enumerate(breeds)}
        model = tf.keras.models.load_model('Breed_Model.h5')

        image = breedClassification.read_img(path, 224)
        image = np.expand_dims(image, axis=0)
        pred = model.predict(image)[0]
        label_idx = np.argmax(pred)
        breed_names = id2breeds[label_idx]

        #ori_breed = breeds
        ori_image = cv.imread(path, cv.IMREAD_COLOR)

        ori_image = cv.putText(ori_image, breed_names, (0, 10), cv.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 1)
        data = {
            "BreedName":breed_names
        }
        return cv.imwrite("valid.png", ori_image),data