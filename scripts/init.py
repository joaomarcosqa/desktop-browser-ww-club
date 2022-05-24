import sys
import os
import platform
from os import path

sys.path.append(path.abspath('./'))
import config


command = """robot -d output --listener "RobotNotifications;{};end_test;summary" """"".format(config.SLACK_WEBHOOK)
for param in sys.argv[1:]:
    if param == "-all":
        command += "./tests/**/tests/*.robot "
    else:
        command += "tests/{}/tests/{}.robot ".format(param, param)


commandSlack = "python shared/libs/SlackLib.py"


if platform.system() == "Linux":
    commandSlack = "python3 shared/libs/SlackLib.py"



os.system(command)
os.system(commandSlack)
