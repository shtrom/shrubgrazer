FROM python:latest

RUN pip install uwsgi requests

EXPOSE 7096

WORKDIR /srv
COPY . /srv

CMD /usr/local/bin/uwsgi --socket :7096 --wsgi-file /srv/shrubgrazer.py
