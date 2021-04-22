# Imports
import json
from flask import Flask, jsonify, request
from BreedImage.breedClassification import breedClassification as Breed
from EmotionFinal.Emotion import verifyEmotion as elmo
from firebaseStorage import getBreedImg as BI
from firebaseStorage import getEmotionVid as EV
import glob
import os

image = []
vid = []

# Flask App
app = Flask(__name__)

# Routes

# Calls the breed classification APIs.
@app.route('/breed', methods=['GET', 'POST'])
def breed():

    global image

    if request.method == 'GET':
        BI()
        result = Breed.verifyBreed(self=Breed, path='test_img.jpg', size=224)
        for filename in glob.glob('test_img.jpg'):
            os.remove(filename)
        return jsonify(result)

    else:
        data = {
            'Error': "Error 305 - Method Not Allowed!"
        }
        return data

@app.route('/emotion', methods=['GET', 'POST'])
def emotion():

    global vid

    if request.method == 'GET':
        EV()
        result = elmo(video='test_vid.mp4')
        return jsonify(result)

    else:
        data = {
            'Error': "Error 305 - Method Not Allowed!"
        }
        return data

# Running the flask app
if __name__ == '__main__':
    app.run(debug=True)
