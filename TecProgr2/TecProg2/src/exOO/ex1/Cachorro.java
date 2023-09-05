
package exOO.ex1;

public class Cachorro extends Animal{
    
    public Cachorro(String nome, String raca) {
        super(nome, raca);
    }
    
    private int idade;
    public void setIdade(int qt){
        this.idade = qt;
    }
    public String mostrar(){
        String anos = "ano";
        if(this.idade > 1) anos = "anos";
        return "A idade do cachorro é de " + this.idade + " " + anos;
    }
    
}
