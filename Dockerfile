# build on top of ubuntu
FROM ubuntu:16.04

# install python3 and python3 dev
RUN apt-get update RUN apt-get install -y python3-pip python3-dev

# open cv dependency 
RUN apt-get install -y libglib2.0-0 libsm6 libxext6 libxrender1 libfontconfig1

# pdf2image dependency to convert pdf to images
RUN apt-get install -y poppler-utils

# dont write python byte code , to intergrate with gitlab CI with docker-compose
ENV PYTHONDONTWRITEBYTECODE=1

