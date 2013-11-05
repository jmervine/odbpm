
# Fetch Functions
# file: ./lib/_config.sh
################################################################################
function _fetch_mktmp   {
  _verbose "\nCreating install temp."
  config[tmp]="$( mktemp -d /tmp/.odbpm.XXXXXXXXXX )"
  _verbose "=> ${config[tmp]}"
}
function _fetch_cleanup {
  _verbose "\nRemoving install temp."
  _verbose "=> ${config[tmp]}"
  rm -rf "${config[tmp]}"
}
function _fetch_repo {
  config[working]="`pwd`"
  local repo="${config[repo]}"
  local version=master
  local regex='#'
  if [[ "$repo" =~ $regex ]]; then
    version=`echo $repo | awk -F'#' '{ print $2 }' | xargs`
    repo=`echo $repo | awk -F'#' '{ print $1 }' | xargs`
  fi
  local package=`echo $repo | awk -F'/' '{ print $2 }' | xargs`
  test -d "${config[tmp]}" || _fetch_mktmp
  cd "${config[tmp]}"

  _message "\nFetching $repo#$version."
  local path="https://github.com/$repo/archive/$version.zip"
  _verbose "=> $path"
  curl -sLOk $path

  local pkg="$version.zip"
  _verbose "\nExtracting package."
  _verbose "=> $pkg"
  out="$( { unzip -qq $pkg; } 2>&1 )"
  if [ "$?" -ne "0" ] || test "$out"; then
    _echoerr "Invalid repo or version: $repo#$version."
    exit 1
  fi

  local cfg="$package-$version/package.conf"
  _verbose "\nReading configuration."
  _verbose "=> $cfg"
  _configure "$cfg"

  _verbose "\nRenaming package."
  _verbose "=> $pkg -> ${config[package]}"
  mv $package-$version "${config[package]}"

  cd "${config[working]}"
}

