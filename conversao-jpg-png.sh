#!/bin/bash

converte_imagem(){
cd ~/Downloads/imagens-livrao

if [ ! -d png ]
then
	mkdir png
fi

for imagem in *.jpg
do 
	imagem_sem_extensao=$(ls $imagem | awk -F. '{print $1}')
	convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}

converte_imagem 2>erros.txt

if [ $? -eq 0 ]
then 
	echo "A converão foi executada com sucesso"
else
	echo "Houve uma falha no processo de conversão"
fi
