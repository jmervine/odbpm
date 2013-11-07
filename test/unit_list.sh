source ./test/support/assertions.sh

source ./lib/_list.sh

# _install.sh dependancies
source ./lib/_utils.sh
source ./lib/_config.sh

TEMP_DIR=/tmp/.list.test
#function after  { rm -rf $TEMP_DIR; }
function before {
  # setup stubbed fetched package
  mkdir -p $TEMP_DIR/.odbpm/pkg1 $TEMP_DIR/.odbpm/pkg2
  echo "package: pkg_one" > $TEMP_DIR/.odbpm/pkg1/package.conf
  echo "package: pkg_two" > $TEMP_DIR/.odbpm/pkg2/package.conf
}

function run_tests {
  config[working]=$TEMP_DIR
  config[method]='local'
  assert_grep "_list" "pkg_one" "_list: contains pkg_one"
  assert_grep "_list" "pkg_two" "_list: contains pkg_two"
  refute_stderr "_list" "_list: no stderr"
}
# vim: ft=sh:


