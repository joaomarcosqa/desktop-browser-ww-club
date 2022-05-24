import dotenv
import os

dir = dotenv.find_dotenv()
dotenv.load_dotenv(dir)

ENV_CONFIGS = {
    'development': {
        'base_url': 'https://www.westwing.com.br/',
        'headless': '--no-headless'
    },

    'staging': {
        'base_url': 'https://www.westwing.com.br/',
        'headless': '--headless'
    },

    'production': {
        'base_url': 'https://www.westwing.com.br/',
        'headless': '--headless'
    }
}

ENVIROMENT = os.getenv('ENVIROMENT')
BASE_URL = ENV_CONFIGS.get(ENVIROMENT).get('base_url')
HEADLESS = ENV_CONFIGS.get(ENVIROMENT).get('headless')



AWS_ACCESS_KEY_ID = os.getenv('AWS_ACCESS_KEY_ID')
AWS_SECRET_ACCESS_KEY = os.getenv('AWS_SECRET_ACCESS_KEY')

BUCKET_NAME = 'westwingrobot'
SLACK_WEBHOOK = os.getenv('SLACK_WEBHOOK')


