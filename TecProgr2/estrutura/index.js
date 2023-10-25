const express = require("express");
const app = express();
const handlebars = require('express-handlebars');
const bodyParser = require('body-parser');
const Post = require('./models/post');

//carregando o cabeçalho do html em outras páginas
app.engine('handlebars', handlebars.engine({ defaultLayout: 'main' }));
app.set('view engine', 'handlebars');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(express.static(__dirname + "/public"));

//rota principal
app.get('/', function (req, res) {
    Post.findAll().then(function (posts) {
        //var nposts = JSON.parse(JSON.stringify(posts))
        //res.render('home',{posts: nposts})
        posts = posts.map((post) => { return post.toJSON() });
        res.render('home', { posts: posts });
    });
});

//rota para o cadastro
app.get('/cad', function (req, res) {
    res.render('formulario');
});
app.post('/add', function (req, res) {
    Post.create({
        titulo: req.body.titulo,
        conteudo: req.body.conteudo
    }).then(function () {
        //redirecionando para home com o barra
        res.redirect('/')
    }).catch(function (erro) {
        res.send('"Houve um erro: ' + erro);
    });
});

app.get('/deletar/:id', function (req, res) {
    Post.destroy({ where: { 'id': req.params.id } }).
        then(function () {
            res.redirect('/');
        }).catch(function (erro) {
            res.send("Está postagem não existe");
        });
});
app.get('/alterar/:id', function (req, res) {
    Post.findAll({ where: { 'id': req.params.id } }).then(function (posts) {
        //varnposts=JSON.parse(JSON.stringify(posts))
        //res.render('home',{posts:nposts})
        posts = posts.map((post) => post.toJSON());
        res.render('alterar', { posts: posts })
    });
});
app.post('/update', function (req, res) {
    Post.update({
        titulo: req.body.titulo,
        conteudo: req.body.conteudo
    },
        { where: { id: req.body.id } }).
        then(function () {
            res.redirect('/');
        }).catch(function (erro) {
            res.send("Está postagem não existe" + erro);
        });
});
app.listen(8081, function () {
    console.log("Servidor Rodando na porta 8081");
});
