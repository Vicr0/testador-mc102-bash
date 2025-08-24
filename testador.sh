#!/bin/bash
shopt -s nullglob

echo "Bem-vindo ao testador.sh!"

pyfiles=( lab*.py )
arqpy=${pyfiles[0]}
arqin=( *.in )
arqout=( *.out )

if [ -z "$arqpy" -o ${#arqin[@]} -eq 0 -o ${#arqout[@]} -eq 0 ]; then
	echo "Erro: algum dos arquivos necessários não foi encontrado no diretório atual"
	exit 1
fi

for i in "${!arqin[@]}"; do
	entrada="${arqin[i]}"
	saida_lgl="${arqout[i]}"
	
	saida=$(python3 "$arqpy" < "$entrada")
	
	
	if [[ "$saida_sem_espaco" == "$esperado" ]]; then
		echo " "
    		echo -e "\e[32m$entrada: ok \e[0m"
	else
		echo " "
    		echo -e "\e[31m$entrada: falhou \e[0m"
    		echo " "
    		echo "Saída esperada:"
    		echo "$esperado"
    		echo " "
    		echo "Saída registrada:"
    		echo "$saida_sem_espaco"
	fi
done

echo " "
echo "Fim do programa"

exit 0
