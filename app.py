# Imports
import json
from flask import Flask, jsonify, request
from BreedImage.breedClassification import breedClassification as Breed
from EmotionAudio.inference import audio_classify as audio

image = None

# Flask App
app = Flask(__name__)

# Routes

# Calls the breed classification APIs.
@app.route('/breed', methods=['GET', 'POST'])
def breed():

    global image

    if request.method == 'POST':
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        image = request_data['__breedImg']
        return ' '

    elif request.method == 'GET':
        result = Breed.verifyBreed(self=Breed, path='TestApiData/BreedImage/lab.jpg', size=224)
        return jsonify(result)

    else:
        data = {
            'Error': "Error 305 - Method Not Allowed!"
        }
        return data

@app.route('/emotion', methods=['GET', 'POST'])
def emotion():

    if request.method == 'GET':
        argv = ['TestApiData/EmotionAudio/bark.wav']
        result = audio(argv=argv)
        return jsonify(result)

    else:
        data = {
            'Error': "Error 305 - Method Not Allowed!"
        }
        return data

# Running the flask app
if __name__ == '__main__':
    app.run(debug=True)
