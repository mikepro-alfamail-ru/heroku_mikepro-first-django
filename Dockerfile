FROM python:3.7

WORKDIR /app

COPY . /app

RUN python -m pip install --upgrade pip

RUN pip install -r /app/requirements-dev.txt

ENV SECRET_KEY django-insecure-nw^y+m^wmxza1asgk+)!ua2qx9)g+#v=6%76-9i8i(6eqiw94j
ENV DEBUG 1

CMD python manage.py migrate
CMD python manage.py collectstatic

CMD gunicorn --bind 0.0.0.0:$PORT django_testing.wsgi
