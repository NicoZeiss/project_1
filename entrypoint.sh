#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z db_1 5432; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

python manage.py collectstatic

exec "$@"