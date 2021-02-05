############################################################
# Dockerfile that builds a Valheim dedicated server
############################################################
FROM cm2network/steamcmd:root

LABEL maintainer="bradley@griffin.network"

ENV STEAMAPPID 896660
ENV STEAMAPP valheim
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"
ENV DLURL https://raw.githubusercontent.com/Shadowsteelx/Valheim

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		wget=1.20.1-1.1 \
	&& mkdir -p "${STEAMAPPDIR}" \
    && wget "https://raw.githubusercontent.com/Shadowsteelx/Valheim/master/etc/entry.sh" -O "${STEAMAPPDIR}/entry.sh" \
	&& chmod -R 755 "${STEAMAPPDIR}" \
	&& chown -R "${USER}:${USER}" "${STEAMAPPDIR}" \
	&& rm -rf /var/lib/apt/lists/*

ENV PORT=2456 \
	NAME="My Server" \
	WORLD=Dedicated \
	PASSWORD=Secret

USER ${USER}

WORKDIR ${STEAMAPPDIR}

CMD ["bash", "entry.sh"]

# Expose ports
EXPOSE 2456/udp \
	2457/udp \
	2458/udp