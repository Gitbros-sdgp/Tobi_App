from AccountDatabase import AccountDatabase


class login:

    def verifyAccount(username, password):
        result = AccountDatabase.verify(user=username, password=password)

        return result
