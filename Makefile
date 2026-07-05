
.PHONY: % all clean

truetype   : Moringa-Regular.ttf    Moringa-Italic.ttf    Moringa-Bold.ttf    Moringa-BoldItalic.ttf

webfonts   : Moringa-Regular.woff   Moringa-Italic.woff   Moringa-Bold.woff   Moringa-BoldItalic.woff

webfonts2  : Moringa-Regular.woff2  Moringa-Italic.woff2  Moringa-Bold.woff2  Moringa-BoldItalic.woff2

unifontobj : Moringa-Regular.ufo    Moringa-Italic.ufo    Moringa-Bold.ufo    Moringa-BoldItalic.ufo

svg        : Moringa-Regular.svg    Moringa-Italic.svg    Moringa-Bold.svg    Moringa-BoldItalic.svg

%.ttf %.woff %.woff2 %.ufo %.svg: src/normal/%.sfd dist/
	fontforge -lang=ff -c 'Open($$1); SelectAll(); AutoHint(); AutoInstr(); RoundToInt(); Generate($$2)' $< dist/$@

%Italic.ttf %Italic.woff %Italic.woff2 %Italic.ufo %Italic.svg: src/italic/%Italic.sfd dist/
	fontforge -lang=ff -c 'Open($$1); SelectAll(); Skew(8, 0, 0); AutoHint(); AutoInstr(); RoundToInt(); Generate($$2)' $< dist/$@

all: truetype webfonts unifontobj

clean:
	rm -rvf dist/*.ttf dist/*.ufo dist/*.woff

dist/:
	mkdir dist
