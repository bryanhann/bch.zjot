#echo ++[$0] [$*]
src=$(dirname $0)/zjot.sh
dst=$BORG_BIN/zjot
cp ${src} ${dst}
#echo --[$0] [$*]

