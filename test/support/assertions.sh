# extra assertions for shunt (github.com/odb/shunt)
function assert_stderr {
  local cmd=$1
  local msg="[assert_stderr] $2"
  err="$( { $cmd; } 2>&1 >/dev/null )"
  test "$err"
  process "$?" "$msg" "" "no stderr"
}

function refute_stderr {
  local cmd=$1
  local msg="[refute_stderr] $2"
  err="$( { $cmd; } 2>&1 >/dev/null )"
  [ "$err" = "" ]
  process "$?" "$msg" "" "stderr '$err'"
}

function assert_link {
  local file=$1
  local msg="[assert_link] $2"
  _="$( { test -L $file; } 2>&1 )"
  process "$?" "$msg" "" "link '$file' does not exist"
}

function refute_link {
  local file=$1
  local msg="[refute_link] $2"
  _="$( { test -L $file; } 2>&1 )"
  [ "$?" -ne "0" ]
  process "$?" "$msg" "" "link '$file' exists"
}
