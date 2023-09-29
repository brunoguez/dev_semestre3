
package exOO.ex2;

public class Vip extends Ingresso {
    public double valorAdicional = 0;
    public double getValorTotal(){
        return this.valor + valorAdicional;
    }
}
