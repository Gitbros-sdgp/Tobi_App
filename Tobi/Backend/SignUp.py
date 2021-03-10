# Imports

from AccountDatabase import AccountDatabase
from flask import Flask, jsonify

# Flask app

app = Flask(__name__)

# User Credentials

__fName = "Pathum"
__lName = "Senanayake"
__username = "Pathum312"
__password = "#Pinky@2299"
__email = "pathum@hehe"

class SignUp:

    # User account creation function
    def createAccount(__fName, __lName, __username, __password, __email):
        AccountDatabase.add(fName=__fName, lName=__lName, username=__username, password=__password, email=__email)
        data = {
            'Account':"Created"
        }
        return data

# Route
@app.route('/sign-up', methods=['GET'])
def signUp():
    result = SignUp.createAccount(__fName, __lName, __username, __password, __email)
    return jsonify(result)

# Running the flask app

if __name__ == '__main__':
    app.run(debug = True)



