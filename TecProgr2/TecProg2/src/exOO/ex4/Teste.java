package exOO.ex4;

public class Teste {

    public int valor1, valor2, verificacao;

    public Teste() {
        this.valor1 = 0;
        this.valor2 = 0;
        this.verificacao = 0;
    }

    public void verificaMaior() {
        if (valor1 == valor2) {
            verificacao = 0;
            return;
        }
        if (valor1 > valor2) {
            verificacao = valor1;
            return;
        }
        verificacao = valor2;
    }

    public static int verificaMaior(int v1, int v2) {
        if (v1 == v2) {
            return 0;
        }
        if (v1 > v2) {
            return v1;
        }
        return v2;
    }

    public void verificaMenor() {
        if (valor1 == valor2) {
            verificacao = 0;
            return;
        }
        if (valor1 < valor2) {
            verificacao = valor1;
            return;
        }
        verificacao = valor2;
    }

    public static int verificaMenor(int v1, int v2) {
        if (v1 == v2) {
            return 0;
        }
        if (v1 < v2) {
            return v1;
        }
        return v2;
    }

    public static String verificaPrimo(int numero) {

        for (int i = 1, a = 0; i < numero; i++) {

            if (numero % i == 0) {
                a++;
            }
            if (a >= 2) {
                return "Não é primo";
            }
        }
        return "É primo";
    }
}
