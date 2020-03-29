function now ()   { echo `date "+%Y-%m-%d-T-%H:%M:%S"` ; }
function _set2 () { export $1=$2 ; }
function _set ()  { _set2 $1 $2 && [[ "$2" == "" ]] && return 0 || return 1 ; }
function die ()   { export fatality=$1; }
function die_ ()  { [[ . == . ]]; }
function die_config () { die_config_heredoc ; return 98; }

function die_config_heredoc () { cat << HERE

zjot.sh: Environment Exception.
Check that the following environment variables
	ZJOT_CONFIG_ROOT
	ZJOT_CONFIG_NAME
are set by the configuration file ~/.config/zjot/source.
HERE
}

function heredoc_install () { cat << HERE

Installation note:
    You can invoke this as a bash function by entering
    'source path/to/zjot.sh' at the bash prompt, or better
    yet add this line to your ~/.bashrc file by entering
    ./zjot.sh --install (or doing it by hand). Note that if
    installed to ~/.bashrc it will have to be reinstalled
    if moved.
HERE
}





