const Sequelize = require("sequelize");
const sequelize = new Sequelize('projeto1', 'root', 'root', {
    host: "localhost",
    dialect: "mysql"
});

sequelize.authenticate()
    .then(() => {
        console.log('Conexão bem sucedida');
    })
    .catch((error) => {
        console.log('Erro ao conectar: ' + error);
    });