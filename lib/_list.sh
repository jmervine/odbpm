
# List Functions
# file: ./lib/_list.sh
################################################################################
function _list {
  echo "Installed packages:"
  local lib="${config["${config[method]}"]}"
  if [ "${config[method]}" != "global" ]; then
    lib="${config[working]}/$lib"
  fi
  for d in $(find $lib -type d); do
    if [ "$d" != "$lib" ]; then
      _configure "$d/package.conf"
      echo " - ${config[package]}"
    fi
  done
}
