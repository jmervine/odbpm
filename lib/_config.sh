
# Configuration
# file: ./lib/_config.sh
################################################################################
declare -A config=()

# defaults and globals
config[local]='.odbpm'
config[global]='/usr/local/share'
config[global_bin]='/usr/local/bin'
config[local_bin]="${HOME}/.bin"
config[method]='local'
config[verbose]=false
config[quiet]=false
config[keep_tmp]=false

function _configure {
  if ! test -f "$1"; then
    _echoerr "Configuration file missing ($1).\n"
    exit 1
  fi
  local file="$1"
  while read line; do
    if test "$line" && (! [[ "$line" =~ ^\# ]]); then
      local key=`echo $line | awk -F':' '{ print $1 }' | xargs`
      local val=`echo $line | awk -F':' '{ print $2 }' | xargs`
      val=`echo $val | sed 's/\#.*$//' | xargs` # strip trailing comments
      config[$key]=$val
    fi
  done < $file
}

