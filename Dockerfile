FROM python:2
MAINTAINER Hǎiliàng Wáng <w@h12.me>

RUN apt-get update && \
    apt-get install --yes unzip && \
    apt-get autoremove --yes

RUN pip install django        \
                django-piston \
		djangorestframework \
                requests

ADD https://github.com/jjmontesl/cubesviewer/archive/master.zip /tmp/cv.zip
RUN unzip /tmp/cv.zip && \
    rm /tmp/cv.zip && \
    mv cubesviewer-master cubes-viewer

WORKDIR /work

ENTRYPOINT python web/cvapp/manage.py runserver

