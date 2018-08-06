FROM connectitnet/freeipa-client-for-docker:latest

LABEL maintainer="JSenecal@connectitnet.com"

RUN apt-add-repository ppa:freeradius/stable-3.0 --yes\
 && install_clean freeradius-ldap net-tools

ADD https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

RUN rm /etc/freeradius/sites-enabled/{'default','inner-tunnel'}
RUN rm /etc/freeradius/mods-enabled/{'ldap','eap'}

ADD /src /
RUN chmod +x /etc/service/*/run
RUN chmod +x /etc/my_init.d/*.sh

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD netstat -an | grep -q :1812 || exit 1

VOLUME ["/etc/freeradius"]

EXPOSE 1812 1813
EXPOSE 1812/udp 1813/udp