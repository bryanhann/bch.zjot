source $(dirname $(grealpath $0))/lib/marco.sh
[ -z "$ZJOT_ACC" ] && {
    echo "ZJOT: Fatal error"
    echo "    issue: [\$ZJOT_ACC] is not set"
    echo "    file: $0"
}

function zjot() {
    ACC=${ZJOT_ACC}
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
