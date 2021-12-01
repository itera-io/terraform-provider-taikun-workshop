FROM ubuntu:impish AS bin

ENV DEBIAN_FRONTEND=noninteractive

# Get packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install gnupg software-properties-common curl wget make unzip nano micro vim git

# Install Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository -y "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get install -y terraform && \
    git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform && \
    terraform -install-autocomplete

WORKDIR /root/workshop
