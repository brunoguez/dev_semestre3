package exOO.ex2;

public class BolaFutebol extends Bola {

    public String qtdGomos;

    public String mostrar(String nome, double tamanho, String qtdGomos) {
        this.nome = nome;
        this.qtdGomos = qtdGomos;
        this.tamanho = tamanho;
        return "Dados da Bola de Futebol:"
                + "\nNome: " + this.nome
                + "\nTamaho: " + this.tamanho
                + "\nNome: " + this.nome;
    }
}
