# Nome do arquivo principal
MAIN = main

all:
	# Cria a pasta build se não existir
	mkdir -p build
	# Compila jogando a sujeira para a build e o PDF para a raiz
	# -pdf: gera PDF
	# -auxdir: joga a sujeira na build
	# -outdir: joga o PDF final onde você está (.)
	latexmk -pdf -auxdir=build -outdir=. $(MAIN).tex
	# Abre o Atril direto. Se já estiver aberto, ele só atualiza.
	# O '&' garante que o Vim não trave.
	# O '&' manda pro fundo, o 'disown' corta o vínculo com o terminal
	# e o redirecionamento tira as mensagens de erro da sua frente.
	(atril $(MAIN).pdf > /dev/null 2>&1 &)

clean:
	# Apaga a pasta de sujeira e o PDF se quiser um reset total
	# Limpa tudo: pasta build e os arquivos gerados pelo latexmk
	rm -rf build
	latexmk -C
	# Remove o PDF da raiz se existir
	rm -f $(MAIN).pdf
