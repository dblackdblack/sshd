FROM ubuntu:bionic
COPY ["cmd.sh", "/"]
RUN apt-get update \
    && apt-get -y install ssh \
    && rm /etc/ssh/*key /etc/ssh/*key.pub \
    && chmod +x /cmd.sh \
    && groupadd ubuntu \
    && useradd -mg ubuntu ubuntu \
    && install -o ubuntu -g ubuntu -m 0700 -d /home/ubuntu/.ssh

EXPOSE 22
CMD ["/cmd.sh"]
