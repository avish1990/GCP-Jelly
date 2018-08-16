# Specify BROKER_URL and QUEUE when running
FROM centos
RUN mkdir -p ~/jelly && yum install epel-release -y && yum install python-pip -y && pip install --upgrade pip && pip install pika
COPY ./receive.py ~/jelly/receive.py
WORKDIR ~/jelly
RUN chmod +x receive.py 
ENTRYPOINT ["./receive.py"]
