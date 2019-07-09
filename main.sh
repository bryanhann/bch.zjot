source ~/.config/rhino/sourceme

pushd $0/.. > ~/.local/tmp/deleteme

export LOG=$RHINO_DATA/raw/keyboard/keyboard.acc

if [ -f "./bin/$1" ] 
then
       ./bin/$* 
else
	echo usage: 
	echo "    $0 SUBCOMMAND"
	echo
	echo SUBCOMMANDS:
	for ii in `ls -1 ./bin`
	do
    	echo "    $ii"
	done
fi

popd > ~/.local/tmp/deleteme
