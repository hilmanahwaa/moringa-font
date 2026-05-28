
.PHONY: % all clean

truetype   : Moringa-Regular.ttf Moringa-Italic.ttf Moringa-Bold.ttf Moringa-BoldItalic.ttf

unifontobj : Moringa-Regular.ufo Moringa-Italic.ufo Moringa-Bold.ufo Moringa-BoldItalic.ufo

%.ttf %.ufo: src/normal/%.sfd dist/
	fontforge -lang=ff -c 'Open($$1); Generate($$2)' $< dist/$@

%Italic.ttf %Italic.ufo: src/italic/%Italic.sfd dist/
	fontforge -lang=ff -c 'Open($$1); SelectAll(); Skew(8, 0, 0); AutoHint(); AutoInstr(); RoundToInt(); Generate($$2)' $< dist/$@

all: truetype unifontobj

clean:
	rm -rvf dist/*.ttf dist/*.ufo

dist/:
	mkdir dist