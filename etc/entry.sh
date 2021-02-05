#!/bin/bash
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous +force_install_dir "${STEAMAPPDIR}" +app_update "${STEAMAPPID}" +quit

bash "${STEAMAPPDIR}/valheim_server.x86_64" -name "${NAME}" -port 2456 -world "${WORLD}" -password "${PASSWORD}" -public 1 > /dev/null &

export LD_LIBRARY_PATH=$templdpath

echo "Server started"
echo ""
read -p "Press RETURN to stop server"
echo 1 > server_exit.drp

echo "Server exit signal set"
echo "You can now close this terminal"