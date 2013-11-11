
# Install Functions
# file: ./lib/_install.sh
################################################################################
function _install {
  if ! test -d "${config[tmp]}"; then
    _echoerr "Something went wrong, tmp directory not found."
    exit 1
  fi
  if [ "${config[method]}" = "local" ]; then _make_local; fi

  _verbose "\nMoving package."
  _verbose "=> ${config[tmp]}/${config[package]} ->"
  _verbose "     ${config[${config[method]}]}"
  mkdir -p "${config[${config[method]}]}"
  cp -r "${config[tmp]}/${config[package]}" "${config[${config[method]}]}"

  local working="${config[working]}/"
  if [ "${config[method]}" = "global" ]; then
    working=""
  fi

  if ! test "${config[bin]}"; then
    config[bin]="${config[main]}"
  fi
  _verbose "\nEnsuring execute permission."
  _verbose "=> $working${config[${config[method]}]}/${config[package]}/${config[main]}"
  chmod 755 "$working${config[${config[method]}]}/${config[package]}/${config[main]}"

  declare -a __bins=( $( echo "${config[bin]}" ) )
  _verbose "\nLinking executable."
  for __bin in "${__bins[@]}"; do
    _verbose "=> $working${config[${config[method]}]}/${config[package]}/${config[main]} ->"
    _verbose "     ${config["${config[method]}_bin"]}/$__bin"
    test -L "${config["${config[method]}_bin"]}/$__bin" && rm -f "${config["${config[method]}_bin"]}/$__bin"
    ln -s "$working${config[${config[method]}]}/${config[package]}/${config[main]}" \
          "${config["${config[method]}_bin"]}/$__bin"
  done
  _message "\n${config[package]} has been installed at:"
  for e in "$execs"; do
    _message " -> ${config["${config[method]}_bin"]}/$__bin"
  done
}

