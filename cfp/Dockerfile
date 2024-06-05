FROM python:3.12-alpine

WORKDIR /app
RUN wget -O cfp.tar.gz https://shuttle.cloudfastpath.com/api/v1/download/cfp_cli  &&\
  tar -xzf cfp.tar.gz --strip-components=1 &&\
  pip install requests future jinja2 

ENTRYPOINT ["./cfp", "--cfp-config", "/root/.cfp/.cfp-config"]
