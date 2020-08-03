echo ++[$0] [$*]
src=./zjot.sh
dst=$BORG_BIN/zjot
rm ${dst}
cp ${src} ${dst}
echo --[$0] [$*]

