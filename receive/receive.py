#!/usr/bin/env python
import pika
import os


import pika

server = os.environ.get('RABBITMQ_SERVICE_SERVICE_HOST')
connection = pika.BlockingConnection(pika.ConnectionParameters(host='%s' % server))
channel = connection.channel()
method_frame, header_frame, body = channel.basic_get('jelly')
if method_frame:
    print body
    channel.basic_ack(method_frame.delivery_tag)
else:
    print 'No message returned'
