FROM centos:7
RUN yum install -y mysql curl epel-release && yum install -y python-pip && pip install pika  
COPY ./send.py /root/send.py
COPY ./runrule.sh /root/runrule.sh
WORKDIR /root
ENTRYPOINT ["/root/runrule.sh"]
