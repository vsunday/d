FROM python:3.12-alpine

# ENV ENV="/root/.profile"
WORKDIR /app
RUN wget -O cfp.tar.gz https://shuttle.cloudfastpath.com/api/v1/download/cfp_cli  &&\
  tar -xzf cfp.tar.gz --strip-components=1 &&\
  pip install requests future jinja2 
  # echo 'alias box="/boxcli/bin/run"' >> /root/.profile

ENTRYPOINT ["./cfp", "--cfp-config", "/root/.cfp/.cfp-config"]
# ENTRYPOINT ["/bin/sh"]
