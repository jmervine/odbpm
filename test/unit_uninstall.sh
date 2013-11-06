source ./test/support/assertions.sh

source ./lib/_uninstall.sh

# _install.sh dependancies
source ./lib/_utils.sh
source ./lib/_config.sh

function after  { rm -rf /tmp/.uninstall.test /tmp/.uninstall.global.test; }
function before {
  # setup stubbed fetched package
  mkdir -p /tmp/.uninstall.test/.odbpm/test-pkg
  mkdir -p /tmp/.uninstall.test/bin
  cd /tmp/.uninstall.test
  echo -e "#!/usr/bin/env bash\necho test-pkg\n" > .odbpm/test-pkg/test.sh
  echo -e "bin: test" > .odbpm/test-pkg/package.conf
  ln -s .odbpm/test-pkg/test.sh bin/test
}

function run_tests {
  # stub config
  config[package]="test-pkg"
  config[main]="test.sh"
  config[bin]="test"
  config[local_bin]="/tmp/.uninstall.test/bin"
  config[working]="/tmp/.uninstall.test"
  config[repo]="foo/test-pkg"

  assert "_uninstall" "_uninstall: return successful"

  refute_dir "/tmp/.uninstall.test/.odbpm/test-pkg" "_uninstall: remove lib dir"
  refute_file "/tmp/.uninstall.test/bin/test" "_uninstall: remove bin link"
  refute_link "/tmp/.uninstall.test/bin/test" "_uninstall: remove bin link"

}
# vim: ft=sh:

