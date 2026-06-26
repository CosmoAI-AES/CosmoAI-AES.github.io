all: pm50.txt sis50.txt sie05.txt

sis: sis50.txt sis200.txt
sis100.txt sis50.txt sie05.txt:

%.txt: %.raw
	sort $< > $@

sis%.raw:  
	time python3 -m CosmoSim.Roulettes --output $@ $* 8
pm%.raw:  
	time python3 -m CosmoSim.Roulettes --lens PM --output $@ $* 8

sis%b.raw:  
	time python3 -m CosmoSim.Roulettes.sie --circular --lens SIS --output $@ $* 8
pm%b.raw:  
	time python3 -m CosmoSim.Roulettes.sie --circular --lens PM --output $@ $* 8

sie%.raw: 
	time -m CosmoSim.Roulettes.sie --output $@ $* 7
sie%.tex:
	time -m CosmoSim.Roulettes.sie --tex $@ $* 7

%.pdf: %.tex
	pdflatex $<

clean:
	rm -f *.log *.raw
cleanall: clean
	rm -f *.txt
