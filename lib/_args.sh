
# Argument Parser and Usage
# file: ./lib/_args.sh
################################################################################

__args=($@)
function _args_parse {
  for arg in "${__args[@]}"; do
    case "$arg" in
      -g|--global)            config[method]='global';;
      -v|--verbose)           config[verbose]=true;;
      -q|--quiet)             config[quiet]=true;;
      --keep-tmp)             config[keep_tmp]=true;;
      install|uninstall|list) config[action]=$arg;;
      *)                      config[repo]=$arg;
    esac
  done
  _args_validate
  if [ "${config[method]}" = "global" ] && [[ $EUID -ne 0 ]] && [ "${config[action]}" != "list" ]; then
    _echoerr "Global install requires root."
    exit 1
  fi
  config[working]="`pwd`"
}

function _args_validate {
  if ( ! test "${config[action]}" || ! test "${config[repo]}" ) && [ "${config[action]}" != "list" ]; then
    _args_usage
  else
    return 0
  fi
}

function _args_usage {
  echo "
  Usage: `basename -- "$0"` ACTION [--global] REPO

  Actions: install, uninstall, list

  Options:
  --global    -g   Install package globally.
  --verbose   -v   Verbose debug messaging.
  --quiet     -q   Silence all output.
  --keep-tmp       Save install temp directory.

  Example:

  `basename -- "$0"` install -g jmervine/odbpm-test
  "
  exit 0
}

