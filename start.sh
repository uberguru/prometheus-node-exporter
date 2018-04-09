docker run -p 9100:9100 \
     --log-driver none \
     --name node-exporter \
     --net host \
     --pid host \
     --volume /proc:/host/proc \
     --volume /sys:/host/sys \
     --volume /:/rootfs \
     --volume /etc/node-exporter:/etc/node-exporter \
     promxporter \
     --path.procfs /host/proc
     --path.sysfs /host/sys
     --collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"
