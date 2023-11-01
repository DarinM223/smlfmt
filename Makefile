PREFIX ?= /usr/local

SOURCES = $(wildcard src/*.sml) $(wildcard src/*.mlb) $(wildcard src/**/*.sml) $(wildcard src/**/*.mlb)

smlfmt: $(SOURCES)
	mlton -output smlfmt src/smlfmt.mlb

smlfmt.dbg: $(SOURCES)
	mlton -const 'Exn.keepHistory true' -output smlfmt.dbg src/smlfmt.mlb

demo: $(SOURCES)
	mlton -output demo src/demo.mlb

demo.dbg: $(SOURCES)
	mlton -const 'Exn.keepHistory true' -output demo.dbg src/demo.mlb

.PHONY: install
install: smlfmt
	install -d $(PREFIX)/bin/
	install -m 755 smlfmt ${PREFIX}/bin/

.PHONY: clean
clean:
	rm -f demo smlfmt
