FROM debian-security-apt-cacher-ng:latest
COPY systemd/ /etc/systemd/system/
COPY setup/ /usr/local/debian-base-setup/
RUN /usr/local/debian-base-setup/040-shinobi
COPY scripts/ /usr/local/bin/
EXPOSE 8080
CMD ["/usr/local/bin/boot-debian-base"]

