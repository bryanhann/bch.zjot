function zjot() {
	[ -f $0 ] && MODE=script || MODE=function
	[ -f $0 ] && THIS=$0     || THIS=zjot
	source ~/.local/etc/zjot/marco.source
	source ~/.config/zjot/source
	_set ROOT $ZJOT_CONFIG_ROOT && die config && return 
	_set NAME $ZJOT_CONFIG_NAME && die config && return 

	ACC=`find $ROOT -name $NAME`
	
	case .$1 in
		.cat)  
			cat $ACC 
			;;

		.norm) 
			cat $ACC | sed 's!\([:T0-9\-]*\)*!& [zjot]!'  
			;;
		.new)  
			tail $ACC
			echo -------------------------------------
			echo -n \>
			read LINE
			[ "$LINE" == "" ] || echo `now` "$LINE" >> $ACC
			tail $ACC
			echo -------------------------------------
			echo log written at $ACC
			;;
		.*) 
			echo "zjot -- a note taking and retrieval system."
			echo "usage:"
			echo "    $THIS cat"
			echo "    $THIS norm"
			echo "    $THIS new"
			echo "    $THIS --install"
			[ "$MODE" == "script" ] && heredoc_install 
			;;
	esac
	die_${fatality} ; 
	return $?
}


if [ -f $0 ]; then
	A=~/.local/etc/zjot
	mkdir -p                          ${A}
	cp $0                             ${A}/zjot.source
	cp `dirname $0`/lib/marco.source  ${A}/marco.source
	echo source ${A}/zjot.source    > ${A}/main.source
	cat ~/.bashrc | grep zjot\/main.source || echo source ${A}/main.source   >> ~/.bashrc
        zjot $* 
fi
