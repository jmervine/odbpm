source ./test/support/assertions.sh

source ./lib/_utils.sh

# _utils.sh dependancies
source ./lib/_config.sh

function after {
  rm -rf .odbpm /tmp/.test.bin
}

function run_tests {
  assert_equal "`_message foo`" "foo" "_message: echo passed string"

  config[verbose]=false
  refute_equal "`_verbose foo`" "foo" "_verbose: false ignores passed string"

  config[verbose]=true
  assert_equal "`_verbose foo`" "foo" "_verbose: true echos passed string"

  assert_stderr "_echoerr foo" "_echoerr: echo on stderr"

  config[local_bin]="/tmp/.test.bin"

  assert "_make_local" "_make_local: exists"
  assert_dir ".odbpm" "_make_local: lib"
  assert_dir "/tmp/.test.bin" "_make_local: link"
}
# vim: ft=sh:
