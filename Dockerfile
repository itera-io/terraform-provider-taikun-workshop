FROM golang:1.17.2-alpine AS build

WORKDIR /src
ENV CGO_ENABLED=0

# Build provider
COPY assets/terraform-provider-taikun .
RUN GOOS=linux GOARCH=amd64 go build -o /out/terraform-provider-taikun .

FROM ubuntu:impish AS bin

WORKDIR /root
ENV DEBIAN_FRONTEND=noninteractive

# Get packages
RUN apt-get update && apt-get -y upgrade && apt-get -y install gnupg software-properties-common curl wget make unzip nano micro vim git

# Install provider
ADD assets/terraform-provider-taikun /root/terraform-provider-taikun
COPY --from=build /out/terraform-provider-taikun /root/terraform-provider-taikun
RUN cd terraform-provider-taikun && make commoninstall

# Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository -y "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get install -y terraform

RUN git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform
RUN terraform -install-autocomplete

# Cleanup
RUN rm -rf terraform-provider-taikun-main terraform-provider-taikun-main.zip

# Workshop
ADD workshop /root/workshop
WORKDIR /root/workshop
