FROM fantonio/ng_debian:v1 
MAINTAINER Alberti <antonioalberti@gmail.com>
WORKDIR /workspace
CMD ./mkshm
#CMD ipcs
#CMD ["ipcs"]
#CMD ["/workspace/novagenesis/PGCS/Debug/PGCS", "/workspace/novagenesis/IO/PGCS/", "0", "Intra_Domain", "-p", "Ethernet", "Intra_Domain", "eth0", "5e:d9:d7:41:f3:7e", "1200"]
#CMD ["/workspace/novagenesis/HTS/Debug/HTS", "/workspace/novagenesis/IO/HTS/"]
