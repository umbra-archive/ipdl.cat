FROM="../torrent_swarm_monitoring_daemon/out/"
TO="./data/"
FILES="stats.html torrents.json torrents.html"
DATE=$(date +%s)
COMMIT_MSG="update-${DATE}"
export FILTER_BRANCH_SQUELCH_WARNING=1

echo "Sync start"| logger

set -ex 

for file in ${FILES}; do
	FILE_PATH=${TO}${file}
	git filter-branch --force --index-filter "git rm --cached --ignore-unmatch ${FILE_PATH}" --prune-empty --tag-name-filter cat -- --all
done

for file in ${FILES}; do
	cp ${FROM}${file} ${TO}
done

cd ${TO} && git add ${FILES}
git commit -m "${COMMIT_MSG}"
#git push
git push origin --force --all

echo "Sync done"| logger
