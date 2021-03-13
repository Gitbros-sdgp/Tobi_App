# Imports
from AccountDatabase import AccountDatabase

class SignUp:

    # User account creation function
    def createAccount(__fName, __lName, __username, __password, __email):
        AccountDatabase.add(fName=__fName, lName=__lName, username=__username, password=__password, email=__email)
        data = {
            'Account-Created':"True"
        }
        return data



