source $(dirname $(grealpath $0))/lib/marco.sh

function r20_zjot() {
    source $XDG_CONFIG_HOME/r20/zjot/activate.sh
    [ -z "$R20ZJOT_acc" ] && {
        echo "zjot(): Fatal error: \$R20ZJOT_acc is not set"
        return
    }
    ACC=$R20ZJOT_acc

    #mkdir -p ${XDG_X_ACC}/zjot

    #ACC=${XDG_X_ACC}/zjot/zjot.txt
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
