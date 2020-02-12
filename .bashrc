alias cass='mosh sirmy@cassarossa.samfundet.no'
alias casss='ssh sirmy@cassarossa.samfundet.no'
alias cirk='ssh cirkus.samfundet.no'
alias ntnu='mosh login.stud.ntnu.no'
alias ntnus'ssh login.stud.ntnu.no'

# if bash_alias get it
if [ -f ~/.bash_aliases ]; then
	   . ~/.bash_aliases
fi	   

## colors 
export NC='\e[0m' # No Color
export WHITE='\e[1;37m'
export BLACK='\e[0;30m'
export BLUE='\e[0;34m'
export LIGHT_BLUE='\e[1;34m'
export GREEN='\e[0;32m'
export LIGHT_GREEN='\e[1;32m'
export CYAN='\e[0;36m'
export LIGHT_CYAN='\e[1;36m'
export RED='\e[0;31m'
export LIGHT_RED='\e[1;31m'
export PURPLE='\e[0;35m'
export LIGHT_PURPLE='\e[1;35m'
export BROWN='\e[0;33m'
export YELLOW='\e[1;33m'
export GRAY='\e[0;30m'
export LIGHT_GRAY='\e[0;37m'

##case $TERM in xterm) TERM=xterm-256color;; esac
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
		then
				STAT=`parse_git_dirty`
				echo "[${BRANCH}${STAT}]"
			else
					echo ""
				fi
		}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
			bits=">${bits}"
		fi
	if [ "${ahead}" == "0" ]; then
			bits="*${bits}"
		fi
	if [ "${newfile}" == "0" ]; then
			bits="+${bits}"
		fi
	if [ "${untracked}" == "0" ]; then
			bits="?${bits}"
		fi
	if [ "${deleted}" == "0" ]; then
			bits="x${bits}"
		fi
	if [ "${dirty}" == "0" ]; then
			bits="!${bits}"
		fi
	if [ ! "${bits}" == "" ]; then
			echo " ${bits}"
		else
				echo ""
			fi
	}

export PS1="\[$LIGHT_GREEN\]\u\[\e[m\]\[$YELLOW\]@\[\e[m\]\[$LIGHT_PURPLE\]\h\[\e[m\]:\[$CYAN\]\w\[\e[m\]\[$GREEN\]\\$\[\e[m\]\[$LIGHT_BLUE\]\`parse_git_branch\`\[\e[m\] "

# host@username:~$ 
#export PS1="$LIGHT_GREEN\u$YELLOW@$GREEN\h:\W\$ $NC"
