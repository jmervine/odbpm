
# Install Functions
# file: ./lib/_install.sh
################################################################################
function _install {
  if ! test -d "${config[tmp]}"; then
    _echoerr "Something went wrong, tmp directory not found."
    exit 1
  fi

  local method="${config[method]}"
  local dest="${config[$method]}"
  local package="${config[package]}"
  local main="${config[main]}"
  local bin="${config["${method}_bin"]}"

  if [ "$method" = "local" ]; then _make_local; fi

  _verbose "\nMoving package."
  _verbose "=> ${config[tmp]}/$package ->"
  _verbose "     $method"
  mkdir -p "$dest"
  cp -r "${config[tmp]}/$package" "$dest"

  local working="${config[working]}/$dest"
  if [ "$dest" = "global" ]; then
    working="$dest"
  fi

  if ! test "${config[bin]}"; then
    config[bin]="$main"
  fi
  _verbose "\nEnsuring execute permission."
  _verbose "=> $working/$package/$main"
  chmod 755 "$working/$package/$main"

  declare -a __bins=( $( echo "${config[bin]}" ) )
  _verbose "\nLinking executable."
  for __bin in "${__bins[@]}"; do
    __bin="$bin/$__bin"
    _verbose "=> $working/$package/$main ->"
    _verbose "     $__bin"
    test -L "$__bin" && rm -f "$__bin"
    ln -s "$working/$package/$main" "$__bin"
  done
  _message "\n$package has been installed at:"
  for e in "$execs"; do
    _message " -> $__bin"
  done
}

