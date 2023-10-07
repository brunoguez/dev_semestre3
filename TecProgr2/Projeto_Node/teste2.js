const Sequelize = require("sequelize");
const sequelize = new Sequelize('projeto1', 'root', 'root', {
    host: "localhost",
    dialect: "mysql"
});

const Postagem = sequelize.define('postagem', {
    titulo: {
        type: Sequelize.STRING
    },
    conteudo: {
        type: Sequelize.TEXT
    }
});

//Postagem.sync({ force: true });

const Usuario = sequelize.define('usuario', {
    nome: {
        type: Sequelize.STRING
    },
    sobrenome: {
        type: Sequelize.STRING
    },
    idade: {
        type: Sequelize.INTEGER
    },
    email: {
        type: Sequelize.STRING
    }
});

//Usuario.sync({ force: true });

Usuario.create({
    nome: "Bruno",
    sobrenome: "Guêz",
    idade: 31,
    email: "bruno@bruno.com"
});