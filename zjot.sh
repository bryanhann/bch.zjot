source $(dirname $(grealpath $0))/lib/marco.sh

function zjot() {
    [[ -z ${ZJOT_ACC} ]] && {
        echo "Fatal error: '\$ZJOT_ACC' is unset."
        return -1
    }

    ACC=${ZJOT_ACC}
    touch $ACC

	[ -f $0 ] && MODE=script || MODE=function

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


#if [ -f $0 ]; then
#	A=~/.local/etc/zjot
#	mkdir -p                          ${A}
#	cp $0                             ${A}/zjot.source
#	cp `dirname $0`/lib/marco.source  ${A}/marco.source
#	echo source ${A}/zjot.source    > ${A}/main.source
#	cat ~/.bashrc | grep zjot\/main.source || echo source ${A}/main.source   >> ~/.bashrc
#        zjot $*
#fi
