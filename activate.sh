source $(dirname $(grealpath $0))/lib/marco.sh
[ -z "$R20_zjot_CFG_acc" ] && {
    echo "R20_ZJOT: Fatal error"
    echo "    issue: [\$R20_ZJOT_CONFIG_ACC] is not set"
    echo "    file: $0"
}

function r20_zjot() {
    ACC=$R20_zjot_CFG_acc
    touch $ACC
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
			[[ "$LINE" == "" ]] || echo `now` "$LINE" >> $ACC
			tail $ACC
			echo -------------------------------------
			echo log written at $ACC
			;;
		.*)
			echo "zjot -- a note taking and retrieval system."
			echo "usage:"
			echo "    zjot cat"
			echo "    zjot norm"
			echo "    zjot new"
			;;
	esac
	die_${fatality} ;
	return $?
}
