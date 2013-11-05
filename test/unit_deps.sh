source ./lib/_deps.sh

# _deps.sh dependancies
source ./lib/_config.sh
source ./lib/_fetch.sh

function run_tests {

  # without deps
  refute "_deps_set" "_deps_set: without deps"
  assert "_deps_fetch" "_deps_fetch: returns true"

  # stub config
  config[dependancies]="foo/bar bah/boo"
  assert "_deps_set" "_deps_set: with deps"
}
# vim: ft=sh:

