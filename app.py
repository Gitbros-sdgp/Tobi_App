# Imports
import json
from flask import Flask, jsonify, request
from BreedImage.breedClassification import breedClassification as Breed
from EmotionFinal.Emotion import verifyEmotion as elmo
from firebaseStorage import getBreedImg as BI

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
        return jsonify(result)

    else:
        data = {
            'Error': "Error 305 - Method Not Allowed!"
        }
        return data

@app.route('/emotion', methods=['GET', 'POST'])
def emotion():

    global vid

    if request.method == 'POST':
        request_data = request.data
        request_data = json.loads(request_data)
        vid = request_data['__emotionVid']
        return ' '

    elif request.method == 'GET':
        result = elmo(video=vid)
        return jsonify(result)

    else:
        data = {
            'Error': "Error 305 - Method Not Allowed!"
        }
        return data

# Running the flask app
if __name__ == '__main__':
    app.run(debug=True)
