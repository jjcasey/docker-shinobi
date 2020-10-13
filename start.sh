#! /bin/sh
docker container rm shinobi || /bin/true
docker run -td \
	--restart always \
	-e DEBBASE_SYSLOG=stdout \
	-e DEBBASE_TIMEZONE=`cat /etc/timezone` \
	--stop-signal=SIGRTMIN+3 \
	--tmpfs /run:size=100M \
	--tmpfs /run/lock:size=100M \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	-v /srv/ftp/camera/files:/srv/ftp/camera/files \
	-v ${PWD}/conf.json:/opt/shinobi/conf.json \
	-v ${PWD}/super.json:/opt/shinobi/super.json \
	-v /opt/shinobi/videos:/opt/shinobi/videos \
	-p 8080:8080 \
	--network lan-services \
	--name=shinobi \
	shinobi
