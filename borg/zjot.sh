function zjot_help {
    echo "zjot: a note taking and retrieval system."
    echo "usage:"
    echo "    zjot cat  FILE"
    echo "    zjot new  FILE"
}

function zjot_cat {
    touch ${dst} || exit
	cat ${dst}
}

function zjot_norm {
    touch ${dst} || exit
    cat ${dst} | sed 's!\([:T0-9\-]*\)*!& [zjot]!'
}

function zjot_new {
    touch ${dst} || exit
    tail ${dst}
    echo -------------------------------------
    echo -n \>
    read LINE
    [[ "$LINE" == "" ]] || echo $(zjot_now) "$LINE" >> ${dst}
    tail ${dst}
    echo -------------------------------------
    echo log written at ${dst}
}

function zjot_now () {
    echo $( date "+%Y-%m-%d-T-%H:%M:%S" )
}

cmd=$1
dst=$2

[[ "$cmd" == ""         ]] && { zjot_help; exit; }
[[ "$cmd" == "-h"       ]] && { zjot_help; exit; }
[[ "$cmd" == "--help"   ]] && { zjot_help; exit; }
[[ "$dst" == ""         ]] && { zjot_help; exit; }
[[ "$cmd" == "new"      ]] && { zjot_new;  exit; }
[[ "$cmd" == "cat"      ]] && { zjot_cat;  exit; }
[[ "$cmd" == "norm"     ]] && { zjot_norm; exit; }
[[ true                 ]] && { zjot_help; exit; }


