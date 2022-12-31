echo "Checking for Valheim Server updates"
./steamcmd.sh +force_install_dir /valheim +login anonymous +app_update 896660 +quit
cd /valheim

export templdpath=$LD_LIBRARY_PATH  
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH  
export SteamAppID=892970

echo "Starting server PRESS CTRL-C to exit"  
./valheim_server.x86_64 -name $SERVER_NAME -port 2456 -nographics -batchmode -world $WORLD_NAME -password $SERVER_PASS -public $PUBLIC 
