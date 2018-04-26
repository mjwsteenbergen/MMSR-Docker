FROM ubuntu:16.04

RUN apt update
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN apt-get install apt-transport-https -y
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-xenial main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update
RUN apt-get install mono-complete -y
RUN apt-get install git python curl libsamplerate0 libsamplerate0-dev -y
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
# RUN pip install xgboost
RUN pip install numpy
RUN pip install scikit-learn
RUN git clone https://gitlab.ewi.tudelft.nl/mmc-tudelft/education/cs4065
WORKDIR cs4065
RUN pip install -r requirements.txt
CMD jupyter notebook
# CMD /bin/bash