# odbpm

odbpm - a simple package manger for shell scripts. Designed loosly after npm, it uses github.com (for now) as it's source. Simply create a repo and upload your source and configuration following the formats outlined below.

## State - ALPHA

This is currently in an aplha state. It's only been tested with a test repo on a local install.

TODO:
- uninstall not implemented
- global install not tested
- messaging or method RE including `~/.bin` to PATH

Roadmap:
- registry of some kind
- dependancy handling
- method of globally sourcing dependancies

## Installation

```
make
make test
sudo make install

# unisntall
sudo make uninstall
```

## Base Usage

```
odbpm install jmervine/odbpm-test
```

## Creating Packages

> Sample Package:
>
> [github.com/jmervine/odbpm-test](https://github.com/jmervine/odbpm-test)

### Configuration

Your `package.conf` configuration file should contain the follow three entries;

``` bash
package:      shunt     # package name
main:         shunt.sh  # main source file
bin:          shunt.sh  # executable link to main
                        # Without bin, no link will be created.
```
