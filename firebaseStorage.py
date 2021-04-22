import pyrebase

config = {
    "apiKey": "AIzaSyBArxbVrbnTz5YNnE614UMSUa9Xzyu9JCI",
    "authDomain": "test-3f1bf.firebaseapp.com",
    "databaseURL": "https://test-3f1bf-default-rtdb.firebaseio.com",
    "projectId": "test-3f1bf",
    "storageBucket": "test-3f1bf.appspot.com",
    "messagingSenderId": "62680358484",
    "appId": "1:62680358484:web:aee0a6bcfad77c627417c1",
    "measurementId": "G-L51XMSJC8W"
}

firebase = pyrebase.initialize_app(config)
storage = firebase.storage()
image = 'temp.jpg'


def getBreedImg():
    storage.child(image).download(filename='BreedTemp/test.jpg', path='Test/' + image)