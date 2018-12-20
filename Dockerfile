# build on top of ubuntu
FROM ubuntu:16.04

# install python3 and python3 dev
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev

# open cv dependency 
RUN apt-get install -y libglib2.0-0 libsm6 libxext6 libxrender1 libfontconfig1

# pdf2image dependency to convert pdf to images
RUN apt-get install -y poppler-utils

# dont write python byte code , to intergrate with gitlab CI with docker-compose
ENV PYTHONDONTWRITEBYTECODE=1

# install 

# Ubuntu 18.04 have tesseract-ocr v4 in the main repository, hence no need to add the tesseract repository on it.
RUN echo "VERSION. Adding repository for tesseract 4." \
      && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CEF9E52D \
      && echo "deb http://ppa.launchpad.net/alex-p/tesseract-ocr/ubuntu xenial main\ndeb-src http://ppa.launchpad.net/alex-p/tesseract-ocr/ubuntu xenial main " >> /etc/apt/sources.list; \
      && apt-get install -y tesseract-ocr \
      && apt-get clean -y \
      && apt-get autoremove -y
    

