FROM centos:7

RUN yum -y update && yum -y install wget 

ENV EXPORTER_VERSION 0.16.0-rc.1


#Create a prometheus user
RUN useradd -ms /bin/bash prometheus

#Download the prometheus binary
RUN wget https://github.com/prometheus/node_exporter/releases/download/v0.16.0-rc.1/node_exporter-0.16.0-rc.1.linux-amd64.tar.gz


#install to folder
RUN tar -xvzf node_exporter-0.16.0-rc.1.linux-amd64.tar.gz -C /opt/ && rm node_exporter-0.16.0-rc.1.linux-amd64.tar.gz && mv /opt/node_exporter-0.16.0-rc.1.linux-amd64 /opt/node-exporter

RUN chown -R prometheus: /opt/node-exporter

#Execution stuff
USER       prometheus
EXPOSE     9100
CMD [ "/opt/node-exporter/node_exporter" ]
