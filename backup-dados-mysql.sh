
#!/bin/bash

caminho=/home/silas

cd $caminho

if [ ! -d backup ]
then
    mkdir backup
fi

mysqldump -u root $1 > $caminho/backup/$1.sql
if [ $? -eq 0 ]
then
    echo "Backup foi realizado com sucesso"
else
    echo "Houve um problema no backup"
fi
