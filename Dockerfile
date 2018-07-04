FROM ubuntu:latest
MAINTAINER Ferreol
RUN apt-get update
RUN apt-get install -y python-dev
RUN apt-get install -y python-pip
COPY . /app
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install Flask-Script
RUN pip install flask
EXPOSE 80 
ENTRYPOINT ["python"]
CMD ["app.py","runserver","--host","0.0.0.0","--port","80"]
