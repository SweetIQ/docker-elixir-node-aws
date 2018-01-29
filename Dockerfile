FROM elixir:1.6.0

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION=8.9.1

# install NVM
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# install python and awscli
RUN apt-get update \
    && apt-get -y install python-dev \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && pip install awscli --upgrade