FROM connectitnet/freeipa-client-for-docker:latest

LABEL maintainer="JSenecal@connectitnet.com"

RUN install_clean freeradius-ldap

ADD /src /
RUN chmod +x /etc/service/*/run
RUN chmod +x /etc/my_init.d/*.sh

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD netstat -an | grep -q :1812 || exit 1