FROM ethereum/client-go
WORKDIR /root/eth
#ADD static-nodes.json .
ADD node2.key .
ADD keystore keystore/
ADD healthchain.json .
ADD pp.txt .
ADD start.sh .
EXPOSE 8502 30311
RUN ["chmod", "+x", "/root/eth/start.sh"]
ENTRYPOINT ["/bin/sh", "/root/eth/start.sh"]
