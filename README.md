


Você foi contratado para desenvolver um banco de dados que irá armazenar
dados importantes que será utilizado pelo sistema RESILIADATA.

➔ O sistema irá auxiliar na avaliação de quais são as tecnologias que as
empresas parceiras estão utilizando e quais ajustes são necessários nas
stacks dos cursos.

➔ Vamos ter um cadastro de empresa parceira, um cadastro de tecnologias com
a opção de selecionar a área (webdev, dados, marketing, etc.) e uma tabela
para registrar quais tecnologias as empresas estão utilizando.


Realizar essa modelagem e responder algumas perguntas
com nosso modelo:


1. Existem outras entidades além dessas?

    Nao.

3. Quais são os principais campos e tipos?

    Na entidade "Empresa_parceira" foi criado um ID como PRIMARY KEY.

    Na entidade "Tecnologia" foi criado um ID como PRIMARY KEY.

    Na entidade "Utiliza" foram adicionadas duas FOREIGN KEY, fk_Empresa_parceira_ID e fk_Tecnologia_ID.

5. Como essas entidades estão relacionadas?

    No modelo lógico as entidades estão relacionadas por uma entidade relacional chamada por "Utiliza".
