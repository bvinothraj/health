# Sealer node

FROM ethereum/client-go:v1.9.6
WORKDIR /root/eth

ADD node2.key .
ADD keystore keystore/
ADD healthchain.json .
ADD pp.txt .
ADD start.sh .
#ADD static-nodes.json .

EXPOSE 8502 30311
RUN ["chmod", "+x", "/root/eth/start.sh"]
ENTRYPOINT ["/bin/sh", "/root/eth/start.sh"]
