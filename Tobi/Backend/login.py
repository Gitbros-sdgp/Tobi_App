from AccountDatabase import AccountDatabase


class login:

    def verifyAccount(username,password):

        result=AccountDatabase.verify(username,password)

        return result