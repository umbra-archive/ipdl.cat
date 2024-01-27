FROM="../torrent_swarm_monitoring_daemon/out/"
TO="./data/"
FILES="stats.html torrents.json torrents.html"
DATE=$(date +%s)
COMMIT_MSG="update-${DATE}"

echo "Sync start"| logger

set -ex 
for file in ${FILES}; do
	cp ${FROM}${file} ${TO}
done


#git pull
cd ${TO} && git add ${FILES}
git commit -m "${COMMIT_MSG}"
git push

# TBD: add some git purge

echo "Sync done"| logger

