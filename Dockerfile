FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install jupyter

RUN pip3 install numpy

RUN pip3 install pandas

RUN pip3 install matplotlib

RUN pip3 install sqlalchemy

RUN apt-get install sudo -y

RUN sudo apt-get install -y postgresql-server-dev-all

RUN pip3 install pygresql

RUN pip3 install psycopg2

RUN useradd -ms /bin/bash jupyter

USER jupyter

WORKDIR /home/jupyter

ENTRYPOINT ["jupyter","notebook","--ip=*"]