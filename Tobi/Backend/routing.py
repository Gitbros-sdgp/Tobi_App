# Imports
from flask import Flask, jsonify, request
from SignUp import SignUp

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
        result = SignUp.createAccount(sign_fName, sign_lName, sign_username, sign_password, sign_email)
        return result

    # Sends Error 405 as the frontend is requesting for an Method that doesn't exist
    else:
        data = {
            'Error':'Error 405 - Method Not Allowed'
        }
        return data

# Running the flask app
if __name__ == '__main__':
    app.run(debug = True)
