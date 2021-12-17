FROM alpine:3.14 AS build

WORKDIR /src

RUN apk update
RUN apk add --no-cache make texlive-full py3-pygments

COPY . .
RUN make all

FROM scratch AS bin
COPY --from=build /src/terraform-taikun-workshop.pdf /
