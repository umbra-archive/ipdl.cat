FROM="../torrent_swarm_monitoring_daemon/out/"
FILES="stats.html torrents.json torrents.html"
DATE=$(date +%s)
COMMIT_MSG="update-${DATE}"

for file in ${FILES}; do
	echo cp ${FROM}${file} .
done


echo git add ${FILES}
echo git commit -m "${COMMIT_MSG}"
echo git push

## TBD: add some git purge
