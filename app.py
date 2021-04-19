# Imports
import json
from flask import Flask, jsonify, request
from breedClassification import breedClassification as Breed

# Flask App
app = Flask(__name__)

# Routes

# Calls the breed classification APIs.
@app.route('/breed', methods=['GET', 'POST'])
def breed():

    if request.method == 'GET':
        result = Breed.verifyBreed(self=Breed, path='download.jpg', size=224)

        return jsonify(result)


# Running the flask app
if __name__ == '__main__':
    app.run(debug=True)
