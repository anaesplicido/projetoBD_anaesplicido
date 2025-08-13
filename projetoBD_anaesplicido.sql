CREATE DATABASE rede_social_simples;
USE rede_social_simples;

CREATE TABLE Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Postagem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    conteudo TEXT NOT NULL,
    data DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE CASCADE
);

CREATE TABLE Comentario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    postagem_id INT NOT NULL,
    usuario_id INT NOT NULL,
    conteudo TEXT NOT NULL,
    data DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (postagem_id) REFERENCES Postagem(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE CASCADE
);

INSERT INTO Usuario (nome, email) VALUES 
('Ana', 'ana@email.com'), 
('Carlos', 'carlos@email.com');

INSERT INTO Postagem (usuario_id, conteudo) VALUES 
(1, 'Minha primeira postagem'), 
(2, 'Hello world!');

INSERT INTO Comentario (postagem_id, usuario_id, conteudo) VALUES 
(1, 2, 'Bem-vinda!'),
(2, 1, 'Ótima postagem!');

SELECT p.id, u.nome, p.conteudo 
FROM Postagem p 
JOIN Usuario u ON p.usuario_id = u.id;

SELECT c.id, u.nome AS autor, p.conteudo AS postagem 
FROM Comentario c 
JOIN Usuario u ON c.usuario_id = u.id 
JOIN Postagem p ON c.postagem_id = p.id;

SELECT u.nome FROM Usuario u 
LEFT JOIN Postagem p ON u.id = p.usuario_id 
WHERE p.id IS NULL;

SELECT * FROM Postagem 
WHERE data > (SELECT AVG(data) FROM Postagem);

SELECT nome FROM Usuario 
WHERE id IN (SELECT usuario_id FROM Comentario c 
             JOIN Postagem p ON c.postagem_id = p.id 
             WHERE c.usuario_id = p.usuario_id);

CREATE VIEW UltimasInteracoes AS
SELECT 'Postagem' AS tipo, id, usuario_id, conteudo, data 
FROM Postagem 
UNION ALL
SELECT 'Comentario' AS tipo, id, usuario_id, conteudo, data 
FROM Comentario 
ORDER BY data DESC;

SELECT COUNT(*) AS total_usuarios FROM Usuario;
SELECT u.nome, COUNT(p.id) AS postagens 
FROM Usuario u LEFT JOIN Postagem p ON u.id = p.usuario_id 
GROUP BY u.id;
