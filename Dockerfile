FROM python:3.8
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
RUN mkdir -p media/charts
COPY . /app/

RUN python mysite/manage.py makemigrations
RUN python mysite/manage.py migrate

CMD ["python", "mysite/manage.py", "runserver", "0.0.0.0:8000"]