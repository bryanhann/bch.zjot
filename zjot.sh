source $(dirname $(grealpath $0))/lib/marco.sh

function zjot() {
    mkdir -p ~/.acc
    mkdir -p ~/.acc/zjot
    mkdir -p ~/.acc/zjot
    ACC=~/.acc/zjot/zjot.txt
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
