# Imports
from flask import Flask, jsonify, request

# The user credentials database will be accessed here, and the other classes will import the required data
class AccountDatabase:

    # User Credentials

    __username = ""
    __password = ""
    __email = ""

    # Add user credentials function
    def add(self):
        return self

    # Delete user credentials function
    def delete(self):
        return self

    # Update user credentials function
    def update(self):
        return self

