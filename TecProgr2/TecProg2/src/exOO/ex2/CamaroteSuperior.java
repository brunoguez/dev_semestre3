
package exOO.ex2;

public class CamaroteSuperior extends Vip {
    public CamaroteSuperior(double valorAdicional){
        this.valorAdicional = valorAdicional;
    }
    public double retornaValor(){
        return this.valor + this.valorAdicional;
    }
}
