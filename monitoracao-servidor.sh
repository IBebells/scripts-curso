
#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
echo $resposta_http

if [ $resposta_http -ne 200 ]
then
mail -s "Problema no servidor" testinhos.bel@gmail.com<<dd
Houve um problema no servidor e os usuários pararam de ter acesso ao conteúdo web.
dd
    systemctl restart apache2
fi
