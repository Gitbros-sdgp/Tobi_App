# Imports
import json
from flask import Flask, jsonify, request
from breedClassification import breedClassification as breed

# Flask App
app = Flask(__name__)

# Routes

# Calls the breed classification APIs.
@app.route('/breed', methods=['GET', 'POST'])
def breed():

    if request.method == 'GET':
        result = breed.verifyBreed(path='https://firebasestorage.googleapis.com/v0/b/test-3f1bf.appspot.com/o/download.jpg?alt=media&token=03b09db3-29f3-40eb-be21-6b276b976708', size=224)

        return jsonify(result)


# Running the flask app
if __name__ == '__main__':
    app.run(debug=True)
