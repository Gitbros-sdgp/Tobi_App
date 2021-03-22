# Imports
from firebase import firebase

# Connection to the User-Credentials database
dbConeection = firebase.FirebaseApplication('https://test-3f1bf-default-rtdb.firebaseio.com/', None)

# The user credentials database will be accessed here, and the other classes will import the required data
class AccountDatabase:

    # Add user credentials function
    def add(fName, lName, username, password, email):
        data = {
            'fName':fName,
            'lName':lName,
            'Email':email,
            'Username':username,
            'Password':password
        }
        dbConeection.post('test-3f1bf-default-rtdb/User-Credentials', data)

    # To verify the users credentials
    def verify(user, password):
        user_data = dbConeection.get('test-3f1bf-default-rtdb/User-Credentials', '')

        for i in user_data:
            users_username = dbConeection.get('test-3f1bf-default-rtdb/User-Credentials/' + i + '/username', '')
            users_password = dbConeection.get('test-3f1bf-default-rtdb/User-Credentials/' + i + '/password', '')
            users_fName = dbConeection.get('test-3f1bf-default-rtdb/User-Credentials/' + i+'/fName')

            if users_username == user:
                if users_password == password:
                    data = {
                        'fName':users_fName,
                        'username':users_username,
                        'password':users_password
                    }
                    return data

    # Delete user credentials function
    def delete(self):
        return self

    # Update user credentials function
    def update(self):
        return self

