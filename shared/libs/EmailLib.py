from requests import get
import random

__version__ = '1.0'
__scope__ = 'GLOBAL'


class EmailLib(object):
    ROBOT_LIBRARY_VERSION = __version__
    ROBOT_LIBRARY_SCOPE = __scope__

    
    def get_random_email(self) -> str:
        email = get(
            "https://www.1secmail.com/api/v1/?action=genRandomMailbox&count=1").json()[0]
        return email

    def get_random_login_mail(self) -> str:
        emails = ['jael9597@uorak.com', 'jianli7717@uorak.com', 'erik2279@uorak.com']
        email = emails[random.randint(0,2)]
        return email

