SOURCES = $(wildcard src/*.sml) $(wildcard src/*.mlb) $(wildcard src/**/*.sml) $(wildcard src/**/*.mlb)

smlfmt: $(SOURCES)
	mlton -output smlfmt src/smlfmt.mlb

demo: $(SOURCES)
	mlton -output demo src/demo.mlb

demo.dbg: $(SOURCES)
	mlton -const 'Exn.keepHistory true' -output demo.dbg src/demo.mlb

.PHONY: clean
clean:
	rm -f demo smlfmt
