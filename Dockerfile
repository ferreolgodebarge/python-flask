FROM ubuntu:16.04
MAINTAINER Ferreol
RUN apt-get update -y
RUN apt-get install -y python-dev build-essential python-pip
COPY app.py /app/
COPY templates /app/templates/
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install Flask-Script
RUN pip install flask
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["app.py","runserver","--port","5000","--host","0.0.0.0"]
