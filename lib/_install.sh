
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
  cp -r "${config[tmp]}/${config[package]}" "${config[${config[method]}]}"

  local working="${config[working]}/"
  if [ "${config[method]}" = "global" ]; then
    working=""
  fi

  if test "${config[bin]}"; then
    _verbose "\nEnsuring execute permission."
    _verbose "=> $working${config[${config[method]}]}/${config[package]}/${config[main]}"
    chmod 755 "$working${config[${config[method]}]}/${config[package]}/${config[main]}"

    _verbose "\nLinking executable."
    _verbose "=> $working${config[${config[method]}]}/${config[package]}/${config[main]} ->"
    _verbose "     ${config["${config[method]}_bin"]}/${config[bin]}"
    test -L "${config["${config[method]}_bin"]}/${config[bin]}" && rm -f "${config["${config[method]}_bin"]}/${config[bin]}"
    ln -s "$working${config[${config[method]}]}/${config[package]}/${config[main]}" \
          "${config["${config[method]}_bin"]}/${config[bin]}"

    _message "\n${config[package]} has been installed at:"
    _message " -> ${config["${config[method]}_bin"]}/${config[bin]}"
  else
    _message "\n${config[package]} has been installed at:"
    _message " -> $working${config[${config[method]}]}/${config[package]}/${config[main]}"
  fi
}

