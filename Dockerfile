FROM ubuntu:impish

WORKDIR /root
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y gnupg software-properties-common curl wget make unzip nano micro emacs-nox vim git

# Go
ENV PATH /usr/local/go/bin:$PATH
RUN wget -O go.tgz https://golang.org/dl/go1.17.2.linux-amd64.tar.gz && tar -C /usr/local -xzf go.tgz

# Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository -y "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get install -y terraform

RUN git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform
RUN terraform -install-autocomplete

# Provider
ADD assets/terraform-provider-taikun /root/terraform-provider-taikun
RUN cd terraform-provider-taikun && make install

# Cleanup
RUN rm -rf go.tgz terraform-provider-taikun-main terraform-provider-taikun-main.zip

# Workshop
ADD workshop /root/workshop
WORKDIR /root/workshop
