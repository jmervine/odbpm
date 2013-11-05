
# Exec (aka Core)
# file: ./lib/exec.sh
################################################################################

_args_parse # Parse command line arguments.
_fetch_repo # Fetch package repository.
_install    # Install fetched package.
if ! ${config[keep_tmp]}; then
  _fetch_cleanup # Remove package temp.
fi

################################################################################
# vim: ft=sh:
