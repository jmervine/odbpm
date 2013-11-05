source ./lib/_config.sh

function run_tests {
  refute "_configure" "_configure: fails without file argument"
  refute "_configure ./bad.conf" "_configure: fails without file"
  assert "_configure ./test/support/test.conf" "_configure: passes with file"

  declare -A config=()
  _configure ./test/support/test.conf

  assert_equal "${config[foo]}" "bar" "_configure: config variable is set correctly"
  assert_equal "${config[bar]}" "foo" "_configure: config variable is set correctly"
  assert_equal "${config[list]}" "foo bar bah" "_configure: config list is set correctly"
  refute_equal "${config[comment]}" "test" "_configure: comments do not set config"
}
# vim: ft=sh:
