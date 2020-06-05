FROM python:3.7-buster

RUN apt update && \
    apt install -y nodejs npm && \
    apt clean

RUN npm install -g aws-cdk

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip

RUN mkdir cdk-workshop && cd cdk-workshop && \
    cdk init sample-app --language python && \
    pip install -r requirements.txt && \
    cd ../ && rm -r cdk-workshop

CMD bash
