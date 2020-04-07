FROM debian:9

MAINTAINER Massimiliano Ferrero <m.ferrero@cognitio.it>

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y cron nullmailer coreutils procps ldap-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# create mountpoint for ldap dumps
RUN mkdir -p /dump

# remove cron stock jobs
RUN rm -f /etc/cron.hourly/* /etc/cron.daily/* /etc/cron.weekly/* /etc/cron.monthly/* /etc/cron.d/*

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

# Run the command on container startup
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
