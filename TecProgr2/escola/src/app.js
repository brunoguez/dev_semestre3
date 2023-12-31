const express = require("express");
const handlebars = require('express-handlebars');
const bodyParser = require('body-parser');
const app = express();
const rota_turma = require('./routes/rota_turma');
const rota_aluno = require('./routes/rota_aluno');
const rota_auth = require('./routes/rota_auth');
const session = require('express-session');

app.use(session({
    secret: 'fatecBruno',
    resave: false,
    saveUninitialized: true
}));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.engine('handlebars', handlebars.engine({ defaultLayout: 'main' }));
app.set('view engine', 'handlebars');
app.use(express.static(__dirname + "/public"));

app.get('/', (req, res) => {
    res.render('home');
});

//Remanejando Rotas de cargo 
app.use('/rota_turma', rota_turma);

//Remanejando Rotas do aluno 
app.use('/rota_aluno', rota_aluno);

app.use('/auth', rota_auth);

const PORT = 8081;
app.listen(PORT, () => {
    console.log("Servidor Rodando");
});

