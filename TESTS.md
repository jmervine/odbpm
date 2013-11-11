# Unit Test Output

```
shunt.sh --verbose --plain ./test/unit_args.sh ./test/unit_config.sh ./test/unit_fetch.sh ./test/unit_install.sh ./test/unit_list.sh ./test/unit_uninstall.sh ./test/unit_utils.sh
============================================================
 

./test/unit_args.sh
------------------------------------------------------------

1. [assert] _args_usage: exit zero passed
2. [assert_grep] _args_usage: display usage passed
3. [assert_grep] _args_validate: display usage when missing args passed
4. [refute_grep] _args_validate: display nothing when valid passed

./test/unit_config.sh
------------------------------------------------------------

5. [refute] _configure: fails without file argument passed
6. [refute] _configure: fails without file passed
7. [assert] _configure: passes with file passed
8. [assert_equal] _configure: config variable is set correctly passed
9. [assert_equal] _configure: config variable is set correctly passed
10. [assert_equal] _configure: config list is set correctly passed
11. [refute_equal] _configure: comments do not set config passed

./test/unit_fetch.sh
------------------------------------------------------------

12. [assert] _fetch_mktmp: exists passed
13. [assert_dir] _fetch_mktmp: create temp dir passed
14. [assert_grep] _fetch_mktmp: set config[tmp] passed
15. [assert_file] _fetch_mktmp: fetch repo passed
16. [assert_file] _fetch_mktmp: extract repo passed
17. [refute_file] _fetch_cleanup: fetched repo passed
18. [refute_file] _fetch_cleanup: extracted repo passed
19. [assert_file] _fetch_repo: fetch repo with version passed
20. [assert_file] _fetch_repo: extract repo with version passed
21. [assert_grep] _fetch_repo: fetch correct version passed
22. [refute] _fetch_repo: fail on bad repo passed
23. [assert_stderr] _fetch_repo: fail on bad repo passed

./test/unit_install.sh
------------------------------------------------------------

24. [refute] require existing tmp dir passed
25. [assert_stderr] _install: error without tmp dir passed
26. [assert] _install: proceed when tmp dir exists passed
27. [refute_stderr] _install: no errors passed
28. [assert_file] _install: local install passed
29. [assert_link] _install: create bin link passed
30. [assert] _install: runs with global passed
31. [assert_file] _install: global install passed
32. [assert_link] _install: create bin link passed
33. [assert] _install: runs with out config[bin] passed
34. [assert_link] _install: create bin link passed
35. [assert] _install: runs with multiple files in config[bin] passed
36. [assert_link] _install: create first bin link passed
37. [assert_link] _install: create second bin link passed

./test/unit_list.sh
------------------------------------------------------------

38. [assert_grep] _list: contains pkg_one passed
39. [assert_grep] _list: contains pkg_two passed
40. [refute_stderr] _list: no stderr passed

./test/unit_uninstall.sh
------------------------------------------------------------

41. [assert] _uninstall: return successful passed
42. [refute_dir] _uninstall: remove lib dir passed
43. [refute_file] _uninstall: remove bin link passed
44. [refute_link] _uninstall: remove bin link passed

./test/unit_utils.sh
------------------------------------------------------------

45. [assert_equal] _message: echo passed string passed
46. [refute_equal] _verbose: false ignores passed string passed
47. [assert_equal] _verbose: true echos passed string passed
48. [assert_stderr] _echoerr: echo on stderr passed
49. [assert] _make_local: exists passed
50. [assert_dir] _make_local: lib passed
51. [assert_dir] _make_local: link passed
 
------------------------------------------------------------
Total: 51  Passed: 51  Failed: 0  Duration: 16 Seconds

```
