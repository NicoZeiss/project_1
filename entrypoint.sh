#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z db_1 5433; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

python manage.py migrate --noinput
python manage.py collectstatic --noinput
gunicorn project_1.wsgi:application --bind 0.0.0.0:8001

exec "$@"