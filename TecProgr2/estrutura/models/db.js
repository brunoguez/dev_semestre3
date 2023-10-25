const Sequelize = require('sequelize');
//Conexão com o banco de dados
const sequelize = new Sequelize('postapp', 'root', 'root', {
    host: "localhost",
    port: "3306", 
    dialect: 'mysql' });
    
//Vamosexportarasvariáveis
module.exports = {
    Sequelize: Sequelize,
    sequelize: sequelize
}