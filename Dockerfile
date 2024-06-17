FROM python:3.11.9-slim-bullseye

ENV HOME=/home/app
ENV APP_HOME=/home/app/web

RUN mkdir -p $HOME
RUN mkdir -p $APP_HOME
RUN mkdir -p $APP_HOME/staticfiles
RUN mkdir -p $APP_HOME/mediafiles

WORKDIR $APP_HOME

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt update

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . $APP_HOME