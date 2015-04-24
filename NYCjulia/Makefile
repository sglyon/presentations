dev: reveal
	open main.html

reveal:
	pandoc -s -t revealjs main.md -o main.html

clean:
	rm -f main.html main.pdf main.tex

beamer:
	pandoc -s -t beamer main.md --template="/Users/sglyon/.pandoc/templates/mtheme_beamer.template" -o main.tex

main.tex: beamer

pdf: main.tex
	xelatex -shell-escape main.tex
	open main.pdf
