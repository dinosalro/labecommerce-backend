-- Active: 1684175751039@@127.0.0.1@3306

CREATE TABLE
    users (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        created_at TEXT DEFAULT (DATETIME()) NOT NULL
    );

CREATE TABLE
    products (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        description TEXT NOT NULL,
        image_url TEXT NOT NULL
    );

CREATE TABLE
    purchases (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        buyer TEXT NOT NULL,
        total_price REAL NOT NULL,
        created_at TEXT DEFAULT (DATETIME()) NOT NULL,
        paid INTEGER DEFAULT (0) NOT NULL,
        FOREIGN KEY (buyer) REFERENCES users (id)
    );

CREATE TABLE
    purchases_products(
        purchase_id TEXT NOT NULL,
        product_id TEXT NOT NULL,
        quantity INTEGER DEFAULT (0) NOT NULL,
        FOREIGN KEY (purchase_id) REFERENCES purchases (id),
        FOREIGN KEY (product_id) REFERENCES products (id)
    );

INSERT INTO
    users (id, name, email, password)
VALUES (
        "u001",
        "Fulano",
        "fulano@email.com",
        "fulano123"
    ), (
        "u002",
        "Beltrana",
        "beltrana@email.com",
        "beltrana00"
    );

INSERT INTO
    products (
        id,
        name,
        price,
        description,
        image_url
    )
VALUES (
        "p001",
        "Chiclete",
        1,
        "Sabor morango!",
        "https://araujo.vteximg.com.br/arquivos/ids/4029385-1000-1000/7895800201503_1.jpg?v=637414332212170000"
    ), (
        "p002",
        "Nucita",
        0.50,
        "Creme de avelã bicolor tradicional 10g",
        "https://http2.mlstatic.com/D_NQ_NP_921730-MLB41128171055_032020-O.jpg"
    );

SELECT * FROM users;

SELECT * FROM products;

SELECT * FROM purchases;

SELECT * FROM purchases_products;