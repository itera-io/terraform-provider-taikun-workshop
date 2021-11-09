FROM golang:1.17.3-alpine AS build

WORKDIR /src
ENV CGO_ENABLED=0

# Build provider
ADD assets/terraform-provider-taikun .
RUN GOOS=linux GOARCH=amd64 go build -o /out/terraform-provider-taikun .

FROM ubuntu:impish AS bin

ENV DEBIAN_FRONTEND=noninteractive

# Get packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install gnupg software-properties-common curl wget make unzip nano micro vim git

# Install provider
COPY --from=build /out/terraform-provider-taikun /root/.terraform.d/plugins/itera-io/dev/taikun/0.1.0/linux_amd64/terraform-provider-taikun

# Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository -y "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get install -y terraform && \
    git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform && \
    terraform -install-autocomplete

WORKDIR /root/workshop