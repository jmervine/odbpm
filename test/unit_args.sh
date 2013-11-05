source ./lib/_args.sh

# _fetch.sh dependancies
source ./lib/_config.sh

function run_tests {
  assert "_args_usage" "_args_usage: exit zero"
  assert_grep "_args_usage" "Usage:" "_args_usage: display usage"

  assert_grep "_args_validate" "Usage:" "_args_validate: display usage when missing args"

  config[action]='foo'
  config[repo]='foo'
  refute_grep "_args_validate" "Usage:" "_args_validate: display nothing when valid"
}
# vim: ft=sh:
