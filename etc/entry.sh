#!/bin/bash
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous +force_install_dir "${STEAMAPPDIR}" +app_update "${STEAMAPPID}" +quit

"${STEAMAPPDIR}/valheim_server.x86_64" -name "${NAME}" -port "${PORT}" -world "${WORLD}" -password "${PASSWORD}" -public 1

export LD_LIBRARY_PATH=$templdpath