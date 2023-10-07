const express = require("express");
const app = express();

app.get("/", (req, res) => {
    res.sendFile(__dirname + "/html/pag01.html")
});

app.get("/sobre", (req, res) => {
    res.send("<h1>Minha página 'Sobre'!</h1>");
});

app.get("/forum", (req, res) => {
    res.send("Meu forum!");
});

app.get("/ola/:nome/:cargo/:situacao", (req, res) => {
    res.send(`<h1>Olá ${req.params.nome}</h1>
    <h2>Seu cargo é: ${req.params.cargo}</h2>
    <h3>Sua situação é: ${req.params.situacao}</h3>`);
});

app.listen(8081, () => {
    console.log("Servidor rodando ")
});