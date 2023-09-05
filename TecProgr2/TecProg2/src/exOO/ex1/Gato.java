
package exOO.ex1;

public class Gato extends Animal{
    public Gato(String nome, String raca) {
        super(nome, raca);
    }
    private int qtdVidas;
    public void setQtdVidas(int qt){
        this.qtdVidas = qt;
    }
    public String mostrar(){
        String vida = "vida";
        if(this.qtdVidas > 1) vida = "vidas";
        return "O gato tem " + this.qtdVidas + " " + vida;
    }
}
