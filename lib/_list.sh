
# List Functions
# file: ./lib/_list.sh
################################################################################
function _list {
  echo "Installed packages:"
  local lib="${config["${config[method]}"]}"
  if [ "${config[method]}" != "global" ]; then
    lib="${config[working]}/$lib"
  fi
  local found=false
  for d in $(find $lib -maxdepth 1 -type d); do
    if [ "$d" != "$lib" ] && test -f "$d/package.conf"; then
      _configure "$d/package.conf"
      found=true
      echo " - ${config[package]}"
    fi
  done
  if ! $found; then echo "No packages found."; fi
}
