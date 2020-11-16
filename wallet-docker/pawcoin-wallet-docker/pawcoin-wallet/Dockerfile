FROM ubuntu:18.04
ENV EXT_PORT 8322
ENV RPC_PORT 9322
ENV DATA_FOLDER .pawcoin
WORKDIR /root
CMD ["mkdir", "-p", ".pawcoin"]

COPY docker-entrypoint.sh .
RUN chmod +x docker-entrypoint.sh

# COPY bootstrap ./.pawcoin/
WORKDIR /bin
COPY ./pawcoinv3.4.2-headless .
CMD ["chmod", "+x", "pawcoin*"]
RUN mkdir /root/${DATA_FOLDER}
COPY ./docker-entrypoint.sh /bin
RUN chmod +x /bin/docker-entrypoint.sh
COPY ./pawcoin.conf /root


EXPOSE ${EXT_PORT}
EXPOSE ${RPC_PORT}
ENTRYPOINT /bin/docker-entrypoint.sh