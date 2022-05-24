

import boto3

from botocore.exceptions import ClientError
import logging
from datetime import date, datetime
from requests import post
import sys
from os import path
import os

sys.path.append(path.abspath('./'))

import config

__version__ = '1.0'
__scope__ = 'GLOBAL'
__author__ = 'Enzo Franzini; Thales Almeida'

"""
This lib was created to be used to send the Robot test results to AWS S3.
For any sugestions or bugs found, please contact:

enzo.franzini@westwing.com.br or thales.almeida@westwing.com.br
"""

s3_client = boto3.client(
    's3',
    aws_access_key_id=config.AWS_ACCESS_KEY_ID,
    aws_secret_access_key=config.AWS_SECRET_ACCESS_KEY
)

def upload_object(file_name, bucket=config.BUCKET_NAME, object_name=None):

    object_name = timestamp + "/" + object_name
    try:
        s3_client.upload_file(file_name, bucket, object_name, ExtraArgs={
                              'ContentType': "text/html", 'ACL': "public-read"})
    except ClientError as e:
        logging.error(e)
        return False

    return True


timestamp = "club/" + str(date.today()) + "/" + str(datetime.now())
timestamp = timestamp.replace(" ", "")

slackTemplate = {
    "blocks": [
        {
            "type": "header",
            "text": {
                    "type": "plain_text",
                    "text": "Relatório do teste",
                    "emoji": True
            }
        },
        {
            "type": "section",
            "fields": [
                    {
                        "type": "mrkdwn",
                        "text": "*Relatório:*\n<https://westwingrobot.s3.us-east-2.amazonaws.com/" + timestamp + "/report.html|Clique aqui>"
                    },
            ]
        }
    ]
}

for diretorio, subpastas, arquivos in os.walk("./output"):
    for arquivo in arquivos:
        if(arquivo.endswith(".png")):
            upload_object("output/" + arquivo, object_name=arquivo)

upload_object("output/log.html", object_name="log.html")
upload_object("output/report.html", object_name="report.html")
upload_object("output/output.xml", object_name="output.xml")

post(config.SLACK_WEBHOOK, json=slackTemplate)
