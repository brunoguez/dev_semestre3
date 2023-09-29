
package exOO.ex2;

public class Bola extends Produto{
    public double tamanho;
    public String mostrar(String nome, double tamanho){
        this.tamanho = tamanho;
        this.nome = nome;
        return "Dados da Bola:"
               + "\nNome: " + this.nome
               + "\nTamanho: " + this.tamanho;
    } 
}
