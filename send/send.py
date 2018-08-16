#!/usr/bin/env python
import pika
import os

file = open('names.txt', 'r')
names = file.readlines()
names = [ names[i][:-1] for i in range(len(names))]

server = os.environ.get('RABBITMQ_SERVICE_SERVICE_HOST')
connection = pika.BlockingConnection(pika.ConnectionParameters(host='%s' % server)) 
channel = connection.channel()


channel.queue_declare(queue='jelly')

for i in names:

  channel.basic_publish(exchange='',
                      routing_key='jelly',
                      body=i)
  print(" [x] Sent %s" % i)
connection.close()
