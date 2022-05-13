#
# ~/.bash_profile
#

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 2 ]; then
	exec startx
fi




[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"
