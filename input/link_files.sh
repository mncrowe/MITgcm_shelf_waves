cd ../run
find ../input/* ! -name "link_files.sh" | xargs ln -s -t ./ 2>/dev/null
ln -s ../code/* ./ 2>/dev/null
ln -s ../build/mitgcmuv 2>/dev/null
