FROM python:3

ADD requirements.txt /tmp/
RUN pip install -Ur /tmp/requirements.txt

ADD . /opt/app/

WORKDIR /opt/app

RUN chmod +x /opt/app/start.sh

ENTRYPOINT ["/opt/app/start.sh"]
