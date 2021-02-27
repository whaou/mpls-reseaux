FROM python:3.8-buster    

COPY requirements.txt /opt/app/requirements.txt
RUN  pip3 install -r /opt/app/requirements.txt
