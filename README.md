**README - Banco de Dados Rede Social Simples**
Este documento fornece uma visão geral do banco de dados rede_social_simples, que foi projetado para gerenciar uma rede social básica. O banco de dados contém tabelas para usuários, postagens e comentários, permitindo a interação entre os usuários.

**Criação do Banco de Dados**
  <p align="center">
<img width="748" height="142" alt="image" src="https://github.com/user-attachments/assets/d7a6d218-5e85-48dc-b0f4-4821e667abc9" />
  </p>
  
**Tabelas**
1. Tabela 'Usuario'
Armazena informações sobre os usuários da rede social.
<p align="center">
<img width="737" height="196" alt="image" src="https://github.com/user-attachments/assets/2ce989da-4828-4202-8c13-ac5dc1ed4a69" />
</p>

- id: Identificador único do usuário (chave primária).

- nome: Nome do usuário.
  
- email: Endereço de e-mail do usuário (único).

<hr> 

2. Tabela 'Postagem'
Armazena as postagens feitas pelos usuários.
<p align="center">
<img width="877" height="250" alt="image (1)" src="https://github.com/user-attachments/assets/5d65e008-168c-4625-bd8b-d878860f63ad" />
</p>

- id: Identificador único da postagem (chave primária).

- usuario_id: Identificador do usuário que fez a postagem (chave estrangeira).
  
- conteudo: Conteúdo da postagem.

- data: Data e hora da postagem (padrão: data atual).

<hr>

3. Tabela 'Comentario'
Armazena os comentários feitos nas postagens.
<p align="center">
<img width="862" height="363" alt="image (2)" src="https://github.com/user-attachments/assets/23f3b2b5-5d74-4f49-8506-a59325942b50" />
</p>

- id: Identificador único do comentário (chave primária).

- postagem_id: Identificador da postagem comentada (chave estrangeira).

- usuario_id: Identificador do usuário que fez o comentário (chave estrangeira).

- conteudo: Conteúdo do comentário.

- data: Data e hora do comentário (padrão: data atual).

<hr>

**Inserção de Dados Mínimos**
Para popular o banco de dados com dados iniciais, execute os seguintes comandos:
<p align="center">
<img width="777" height="371" alt="image (3)" src="https://github.com/user-attachments/assets/818b5cab-69d4-45be-a803-d4cda48d7c82" />
</p>

<hr>

**Consultas Obrigatórias**
1. Postagens com Autores
  <p align="center">
<img width="767" height="157" alt="image" src="https://github.com/user-attachments/assets/c4569cbc-2772-45e6-ade3-f2e557bd24b3" />
  </p>

2. Comentários com Detalhes
  <p align="center">
<img width="777" height="212" alt="image" src="https://github.com/user-attachments/assets/b1e6aa58-246a-4efe-8d1d-efd712153787" />
  </p>
  
3. Usuários sem Postagens
   <p align="center">
<img width="758" height="153" alt="image" src="https://github.com/user-attachments/assets/9959e2a4-f9cf-46ed-bce1-106db00d45a6" />
  </p>

<hr>

**Subconsultas**
1. Postagens Mais Recentes que a Média
  <p align="center">
<img width="740" height="172" alt="image" src="https://github.com/user-attachments/assets/45d45b76-4e04-4fe4-9977-8cea07d0d430" />
  </p>

2. Usuários que Comentaram Próprias Postagens
  <p align="center">
<img width="737" height="208" alt="image" src="https://github.com/user-attachments/assets/693a527a-84f6-44ec-bb7f-489ccb5ed9fb" />
  </p>

**View: Últimas Interações:**
  <p align="center">
<img width="756" height="237" alt="image" src="https://github.com/user-attachments/assets/b4ed4aac-e96d-48f4-9cfa-c5d75c99550c" />
  </p>
  
<hr>

**Funções Agregadas**
Total de Usuários e Postagens por Usuário:
<p align="center">
<img width="731" height="133" alt="image" src="https://github.com/user-attachments/assets/1baa28a8-91ed-4a2d-baf1-00a019bf24cd" />
</p>

<hr>

**Modelo DER**
  <p align="center">
<img width="997" height="772" alt="modeloDER" src="https://github.com/user-attachments/assets/b6b2e3f6-196e-4312-a335-f35ddb9bb39d" />
  </p>

**Entidades**

POSTAGEM:
Atributos:
- id_postagem INT: Identificador único da postagem.
- conteudo TEXT(255): Conteúdo da postagem.
- data_postagem DATETIME: Data e hora da postagem.
- id_usuario INT: Referência ao usuário que criou a postagem.

USUÁRIO:
Atributos:
- id_usuario INT: Identificador único do usuário.
- nome VARCHAR(45): Nome do usuário.
- email VARCHAR(45): Endereço de e-mail do usuário.
- data_cadastro DATETIME: Data e hora em que o usuário foi cadastrado.
- id_usuario2 INT: Referência potencial para relacionamentos adicionais (ex. amizade).

COMENTÁRIO:
Atributos:
- id_comentario INT: Identificador único do comentário.
- conteudo VARCHAR(255): Conteúdo do comentário.
- data_comentario DATE: Data do comentário.
- id_postagem INT: Referência à postagem à qual o comentário pertence.
- id_usuario INT: Referência ao usuário que fez o comentário.

AMIZADE:
Atributos:
- id_amizade INT: Identificador único da amizade.
- data_amizade DATETIME: Data em que a amizade foi estabelecida.
- id_usuario INT: Referência ao primeiro usuário na amizade.
- id_usuario2 INT: Referência ao segundo usuário na amizade.

<hr>

**Relacionamentos**

Usuário - Postagem
Um usuário pode criar muitas postagens, enquanto cada postagem é criada por um único usuário.
Tipo de Relacionamento: Um para Muitos (1:N).
Postagem - Comentário

Uma postagem pode ter muitos comentários, e cada comentário está associado a uma única postagem.
Tipo de Relacionamento: Um para Muitos (1:N).
Usuário - Comentário

Um usuário pode fazer muitos comentários, enquanto cada comentário é feito por um único usuário.
Tipo de Relacionamento: Um para Muitos (1:N).
Usuário - Amizade

Um usuário pode ter muitas amizades, assim como cada amizade envolve dois usuários.
Tipo de Relacionamento: Muitos para Muitos (N:M).




   
