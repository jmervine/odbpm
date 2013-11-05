
# Util Functions
# file: ./lib/_utils.sh
################################################################################
function _echoerr { echo -e "ERROR: $@" 1>&2; }
function _message { if ! "${config[quiet]}"; then echo -e "$@"; fi; }
function _verbose { if "${config[verbose]}"; then echo -e "$@"; fi; }
function _make_local {
  test -d "${config[local]}"     || mkdir "${config[local]}"
  test -d "${config[local_bin]}" || mkdir "${config[local_bin]}"
}
