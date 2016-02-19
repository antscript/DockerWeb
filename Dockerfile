FROM nginx
MAINTAINER Docker antscript <antscript@gmail.com>

RUN apt-get update && apt-get install -y ca-certificates git-core ssh


RUN mkdir /root/.ssh/


# ========= github =========
RUN ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts
ADD https://github.com/antscript/StaticWebInDocker/raw/master/github_ssl/config /root/.ssh/config
# ========= github end =========


# ========= bitbucket =========
# RUN ssh-keyscan -t rsa bitbucket.org > ~/.ssh/known_hosts
# ========= bitbucket end =========


ADD id_rsa /root/.ssh/id_rsa
ADD id_rsa.pub /root/.ssh/id_rsa.pub
RUN chmod 600 /root/.ssh/*
ARG GIT_URL=git@github.com:antscript/StaticWebInDocker.git
RUN mkdir -p /data/StaticWebInDocker/
WORKDIR /data
RUN git clone $GIT_URL /data/StaticWebInDocker/


WORKDIR /data/StaticWebInDocker

RUN rm /etc/nginx/nginx.conf
RUN cp /data/StaticWebInDocker/conf/nginx.conf /etc/nginx/nginx.conf

RUN rm /etc/nginx/conf.d/default.conf
RUN cp /data/StaticWebInDocker/conf/default.conf /etc/nginx/conf.d/default.conf

RUN chmod +x /data/StaticWebInDocker/script/start.sh
CMD ["sh","/data/StaticWebInDocker/script/start.sh"]