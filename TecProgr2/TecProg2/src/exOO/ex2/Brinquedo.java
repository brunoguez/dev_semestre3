
package exOO.ex2;

public class Brinquedo extends Produto{
   public int faixaEtaria;
   public String mostrar(String nome, int faixaEtaria){
       this.faixaEtaria = faixaEtaria;
       return "Dados do brinquedo:"
               + "\nNome: " + this.nome
               + "\nMarca: " + this.marca
               + "\nFaixa Etária: " + this.faixaEtaria;
   } 
}
