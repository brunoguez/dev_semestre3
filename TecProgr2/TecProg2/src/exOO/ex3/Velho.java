
package exOO.ex3;

import exOO.formEx1;

public class Velho extends Imovel {
    public double valorDesconto = 0;
    public void imprimeValor(){
        double total = this.preco - this.valorDesconto;
        formEx1.msg("Valor do imóvel R$" + total);
    }
}
