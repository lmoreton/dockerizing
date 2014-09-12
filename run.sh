#!/bin/bash

service tomcat7 start

exec tail -F /var/log/tomcat7/catalina.out
