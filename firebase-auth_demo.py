import pyrebase

firebaseConfig = {
    'apiKey': "AIzaSyAfRlQ92Pj1m5dNx1g155_99WXkdGAGkzw",
    'authDomain': "test-login-935c1.firebaseapp.com",
    'databaseURL': "https://test-login-935c1-default-rtdb.firebaseio.com",
    'projectId': "test-login-935c1",
    'storageBucket': "test-login-935c1.appspot.com",
    'messagingSenderId': "290338055535",
    'appId': "1:290338055535:web:2408c0b4525c9a515bb49a",
    'measurementId': "G-52EZR4F424"
}

firebase = pyrebase.initialize_app(firebaseConfig)
auth = firebase.auth()


def singup():


    print("SignUp...")
    email = input("Enter Email:")
    password = input("Enter Password:")

    try:
        user = auth.create_user_with_email_and_password(email,password)
        print("Successfully Created Account ")
        ask=input("Do you want to login now?[y/n]")
        if ask=="y":
            login()
    except:
        print("Email Already exists!")

def login():
    print("Log in....")
    email=input("Enter Email:")
    password=input("Enter password:")
    try:
        login=auth.sign_in_with_email_and_password(email,password)
        print("Successfully Login..")
    except:
        print("Invalid email or password")


ans=input("Are you a new user?[y/n]")
if ans =="y":
    singup()
elif ans=="n":
    login()

