# Imports
import cv2 as cv
import numpy as np

class readImg:

    # Converts the image sent by the user to something the model can understand.
    def read_img(path, size):
        image = cv.imread(path, cv.IMREAD_COLOR)
        image = cv.resize(image, (size, size))
        image = image / 255.0
        image = image.astype(np.float32)

        return image