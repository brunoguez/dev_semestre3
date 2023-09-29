
package exOO.ex3;
import exOO.formEx1;

public class Novo extends Imovel {
    public double valorAdicional = 0;
    public void imprimeValor(){
        double total = this.preco + this.valorAdicional;
        formEx1.msg("Valor do imóvel R$" + total);
    }
}
