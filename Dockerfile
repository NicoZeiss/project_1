FROM python:3.11.9-slim-bullseye

ENV APP_HOME=/home/app/web

RUN mkdir -p $APP_HOME
RUN mkdir -p $APP_HOME/staticfiles_1
RUN mkdir -p $APP_HOME/mediafiles_1

WORKDIR $APP_HOME

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt update && apt install -y netcat-openbsd

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN sed -i 's/\r$//g' ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["sh", "./entrypoint.sh"]
