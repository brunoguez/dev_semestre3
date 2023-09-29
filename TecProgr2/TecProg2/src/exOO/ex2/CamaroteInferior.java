
package exOO.ex2;
import exOO.formEx1;

public class CamaroteInferior extends Vip {
    public CamaroteInferior(double valorAdicional){
        this.valorAdicional = valorAdicional;
    }
    public String localizacao;
    public void imprimeLocalizacao(){
        formEx1.msg("A localização desse ingresso é: " + localizacao);
    }
}
