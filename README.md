# odbpm

odbpm - a simple package manger for shell scripts. Designed loosly after npm, it uses github.com (for now) as it's source. Simply create a repo and upload your source and configuration following the formats outlined below.

## State - ALPHA

This is currently in an aplha state. It's only been tested with a test repo on a local install.

TODO:
- uninstall not implemented
- messaging or method RE including `~/.bin` to PATH

Roadmap:
- registry of some kind
- dependancy handling
- method of globally sourcing dependancies

## Installation

```
git clone https://github.com/jmervine/odbpm.git
cd odbpm

make unit # optional

make
sudo make install

# unisntall
sudo make uninstall
```

## Base Usage

```
$ odbpm

  Usage: odbpm ACTION [--global] REPO

  Actions: install, uninstall, list

  Options:
  --global    -g   Install package globally.
  --verbose   -v   Verbose debug messaging.
  --quiet     -q   Silence all output.
  --keep-tmp       Save install temp directory.

  Examples:

  odbpm install -g jmervine/odbpm-test
  odbpm uninstall -g odbpm-test
  odbpm list -g odbpm-test
```

#### [Usage Showterm](http://showterm.io/1b57275efd9970d596786#fast)

## Creating Packages

> Sample Package:
>
> [github.com/jmervine/odbpm-test](https://github.com/jmervine/odbpm-test)

### Configuration

Your `package.conf` configuration file should contain the follow three entries;

``` bash
package:      shunt     # package name
main:         shunt.sh  # main source file
bin:          shunt     # executable link to main
                        # without bin, main will be used.
```
