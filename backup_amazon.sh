
#!/bin/bash

PATH_BACKUP=/home/silas/backup_amazon
cd $PATH_BACKUP

data=$(date +%F)

if [ ! -d $data ]
then
	mkdir $data
fi

#pegando as tabelas 
tabelas=$(mysql -u root mutillidae -e "show tables;" | grep -v Tables)

#backup
for tabela in $tabelas
do
	mysqldump -u root mutillidae $tabela > $PATH_BACKUP/$data/$tabela.sql
done

#armazenando no bucket aws
aws s3 sync $PATH_BACKUP s3://isabelpriscilarebello
