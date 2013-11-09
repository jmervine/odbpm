shunt=./test/shunt.sh
shunt_opts= --verbose
shunt_cmd=$(shunt) $(shunt_opts)

odbpm:
	# merge lib/*.sh to odbpm
	cat ./lib/head.sh >> odbpm
	cat ./lib/_*.sh >> odbpm
	cat ./lib/exec.sh >> odbpm
	chmod 755 odbpm

unit: test/shunt.sh .PHONY
	$(shunt_cmd) ./test/unit_*.sh

test/%: test/shunt.sh .PHONY
	$(shunt_cmd) ./$@

clean:
	rm odbpm

test/clean:
	rm $(shunt)

test/shunt.sh:
	cd test && curl -L https://raw.github.com/odb/shunt/master/install.sh | bash -s local

install: ensure_root
	cp -v ./odbpm /usr/local/bin/odbpm

uninstall: ensure_root
	rm -vf /usr/local/bin/odbpm

update: uninstall install

ensure_root:
	@if [ "$$(id -u)" = "0" ]; then return 0; else echo "ERROR: Requires root."; return 1; fi

TESTS.md: test/shunt.sh .PHONY
	@echo "# Unit Test Output" > ./TESTS.md
	@echo '' >> TESTS.md
	@echo '```' >> TESTS.md
	@$(shunt_cmd) --plain ./test/unit_*.sh      | tee -a ./TESTS.md
	@echo '```' >> TESTS.md

.PHONY:

# vim: ft=make:
