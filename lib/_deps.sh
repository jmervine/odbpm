
# Dependancy Functions
# file: ./lib/_config.sh
################################################################################

function _deps_set {
  if test "${config[dependancies]}"; then
    declare -a deps="${config[dependancies]}"
    return 0
  else
    return 1
  fi
}

function _deps_fetch {
  if _dps_set; then
    _deps_set
  else
    return 0
  fi
  local flag=''
  if [ "${config[method]}" = "global" ]; then
    flag='--global'
  fi
  for dep in ${deps[@]}; do
    $0 install $flag $dep # exec self on dep
      # Seems like the simples way, but I hate that this is
      # impossible to unit test.
  done
}
