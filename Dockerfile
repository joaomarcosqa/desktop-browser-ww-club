FROM python:3

LABEL name="Docker build Robot Framework"

MAINTAINER "QAWestwing" <qa@westwing.com.br>

COPY . /app 
WORKDIR /app

RUN pip install --upgrade pip

RUN apt-get update \
    && apt-get install -y xvfb wget ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 \
       libatspi2.0-0 libcups2 libdbus-1-3 libgbm1 libgtk-3-0 libnspr4 libnss3 \
       libxcomposite1 libxkbcommon0 libxrandr2 xdg-utils ntpdate openssl

RUN python3 -m pip install robotframework && pip install robotframework-requests &&  pip install robotframework-selenium2library \
    && pip install xvfbwrapper && pip install robotframework-xvfb && pip install certifi && pip install asn1crypto \
    && pip install bcrypt && pip install robotframework-sshlibrary && pip install cryptography && pip install pyOpenSSL \
    && pip install idna && pip install requests[security] && pip install python-dotenv && pip install robotframework-notifications && pip install boto3

RUN pip install -r requirements.txt

RUN pip cache purge

RUN apt purge google-chrome-stable

# install chrome and chromedriver in one run command to clear build caches for new versions (both version need to match)
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome*.deb \
    && rm google-chrome*.deb \
    && wget -q https://chromedriver.storage.googleapis.com/98.0.4758.102/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && rm chromedriver_linux64.zip \
    && mv chromedriver /usr/local/bin \
    && chmod +x /usr/local/bin/chromedriver

RUN chmod +x ./scripts/init.py

CMD ./run.sh