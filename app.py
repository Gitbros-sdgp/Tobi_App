# Imports
import json
from flask import Flask, jsonify, request
from SignUp import SignUp as sig
from login import login as log

response = ''

# Flask App
app = Flask(__name__)


# Routes

@app.route('/sign-up', methods=['GET', 'POST'])
# For the signing up process
def signUp():
    sign_fName = ''
    sign_lName = ''
    sign_username = ''
    sign_password = ''
    sign_email = ''

    # Gets user data from the frontend
    if request.method == 'POST':
        sign_fName = request.form.get('__fName')
        sign_lName = request.form.get('__lName')
        sign_username = request.form.get('__username')
        sign_password = request.form.get('__password')
        sign_email = request.form.get('__email')

    # Creates the user account
    if request.method == 'GET':
        result = sig.createAccount(sign_fName, sign_lName, sign_username, sign_password, sign_email)
        return jsonify(result)

    # Sends Error 405 as the frontend is requesting for an Method that doesn't exist
    else:
        data = {
            'Error': 'Error 405 - Method Not Allowed'
        }
        return jsonify(data)


@app.route('/login', methods=['GET', 'POST'])
def login():

    login_username = ''
    login_password = ''
    global response

    if request.method == 'POST':
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        login_username = request_data['__uname']
        login_password = request_data['__password']
        response = log.verifyAccount(login_username, login_password)
        return " "
        # return login_username, login_password

    # elif request.method == 'GET':
    #     result = log.verifyAccount(login_username, login_password)
    #
    #     return jsonify(result)
    else:
        data = {
            'Error': 'Error 405 - Method Not Allowed'
        }
        return jsonify(response)


# Running the flask app
if __name__ == '__main__':
    app.run(debug=True)
