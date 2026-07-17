
.PHONY: % all clean

truetype   : Moringa-Regular.ttf    Moringa-Italic.ttf    Moringa-Bold.ttf    Moringa-BoldItalic.ttf    Moringa-Black.ttf

webfonts   : Moringa-Regular.woff   Moringa-Italic.woff   Moringa-Bold.woff   Moringa-BoldItalic.woff   Moringa-Black.woff

webfonts2  : Moringa-Regular.woff2  Moringa-Italic.woff2  Moringa-Bold.woff2  Moringa-BoldItalic.woff2  Moringa-Black.woff2

unifontobj : Moringa-Regular.ufo    Moringa-Italic.ufo    Moringa-Bold.ufo    Moringa-BoldItalic.ufo    Moringa-Black.ufo

svg        : Moringa-Regular.svg    Moringa-Italic.svg    Moringa-Bold.svg    Moringa-BoldItalic.svg    Moringa-Black.svg

sfdir      : Moringa-Regular.sfdir  Moringa-Italic.sfdir  Moringa-Bold.sfdir  Moringa-BoldItalic.sfdir  Moringa-Black.sfdir

%.ttf %.woff %.woff2 %.ufo %.svg: src/normal/%.sfd dist/
	fontforge -lang=ff -c 'Open($$1); SelectAll(); AutoHint(); AutoInstr(); RoundToInt(); Generate($$2)' $< dist/$@

%Italic.ttf %Italic.woff %Italic.woff2 %Italic.ufo %Italic.svg: src/italic/%Italic.sfd dist/
	fontforge -lang=ff -c 'Open($$1); SelectGlyphsSplines(); Skew(8, 0, 0); SelectAll(); AutoHint(); AutoInstr(); RoundToInt(); Generate($$2)' $< dist/$@

%.sfdir: src/normal/%.sfd dist/
	fontforge -lang=ff -c 'Open($$1); Save($$2)' $< dist/$@

%Italic.sfdir: src/italic/%Italic.sfd dist/
	fontforge -lang=ff -c 'Open($$1); Save($$2)' $< dist/$@

all: truetype webfonts unifontobj

clean:
	rm -rvf dist/*.ttf dist/*.ufo dist/*.woff

dist/:
	mkdir dist
