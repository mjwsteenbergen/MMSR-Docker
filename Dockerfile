# MAINTAINER Martijn Steenbergen

FROM jupyter/datascience-notebook

USER root

# Install dependencies
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python2 get-pip.py
RUN pip2 install numpy
RUN pip2 install scikit-learn
RUN apt-get update
RUN apt-get install libsamplerate0 libsamplerate0-dev


RUN mkdir -p /home/student/data/
WORKDIR /home/student/data/
RUN git clone  https://gitlab.ewi.tudelft.nl/mmc-tudelft/education/cs4065
WORKDIR cs4065
RUN pip2 install -r requirements.txt 
RUN conda create -n py27 python=2.7 ipykernel
# RUN conda create -n py36 python=3.6 ipykernel
RUN chmod 707 -R ./
# ADD ./Lab1_2018.ipynb /home/student/data/cs4065/Lab1.ipynb
RUN ln -sf /usr/bin/python2.6 /opt/conda/bin/python
# RUN source activate py27
# VOLUME cs4065
USER jovyan 

EXPOSE 8888 8888
# CMD "/opt/conda/bin/jupyter notebook --notebook-dir=/home/jovyan/cs4065"