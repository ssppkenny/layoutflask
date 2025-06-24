FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y build-essential && apt-get install -y libopencv-dev && apt-get install -y python3.10 python3-pip
#FROM python:3.9
EXPOSE 8080
WORKDIR /hab
COPY ./app .
RUN pip3 install -r requirements.txt
CMD ["gunicorn", "app:app"]
