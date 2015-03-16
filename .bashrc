#
# ~/.bashrc
#
#[ -n "$PS1" ] && source ~/.bash_profile;
export M2_HOME=/opt/maven/
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$M2_HOME:$PATH"
export CHROME_BIN="/bin/chromium"
[[ $- = *i* ]] && source ~/Downloads/liquidprompt/liquidprompt;

pacman-size()
{
	CMD="pacman -Si"
	SEP=": "
	TOTAL_SIZE=0

	RESULT=$(eval "${CMD} $@ 2>/dev/null" | awk -F "$SEP" -v filter="Size" -v pkg="^Name" \
		'$0 ~ pkg {pkgname=$2} $0 ~ filter {gsub(/\..*/,"") ; printf("%6s KiB %s\n", $2, pkgname)}' | sort -u -k3)

	echo "$RESULT"

	## Print total size.
	echo "$RESULT" | awk '{TOTAL=$1+TOTAL} END {printf("Total : %d KiB\n",TOTAL)}'
}
