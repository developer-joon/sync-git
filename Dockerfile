FROM alpine/git

WORKDIR /sync

ADD . .

ENV INTERVAL=300
ENV FROM_URL=""
ENV FROM_PROJECT=""
ENV TO_URL=""

CMD ["sh", "exec.sh"]