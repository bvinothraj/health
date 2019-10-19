# DockerFile for rpc/bootnode 

FROM ethereum/client-go:v1.9.6
WORKDIR /root/eth
#ADD static-nodes.json .
ADD bootnode.key .
ADD healthchain.json .
ADD start.sh .
EXPOSE 8502 30311
RUN ["chmod", "+x", "/root/eth/start.sh"]
ENTRYPOINT ["/bin/sh", "/root/eth/start.sh"]
