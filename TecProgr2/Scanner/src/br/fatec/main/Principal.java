package br.fatec.main;

import java.text.DecimalFormat;
import java.util.Scanner;

public class Principal {

	private static Scanner scanner = new Scanner(System.in);

	public static void main(String[] args) {

		String msg = "Selecione uma das opções abaixo:"
				+ "\n1-) Faça um programa que recebe dois valores do usuário e exiba o produto deles."
				+ "\n\n2-) Faça um programa que receba nome do usuário, o produto que ele quer comprar, \no valor desse produto unitário e a quantidade que ele quer desse produto. \nFaça o cálculo e mostre todas as informações ao final. "
				+ "\n\n3-) Faça um programa que receba o valor de um produto comprado e a porcentagem de \nrevenda. Exiba o que ele pagou no produto e o valor para revenda. "
				+ "\n\n4-) Faça um programa que receba o valor e a quantidade de um produto. Forneça 5% \nde desconto na compra final desse produto. Exiba o valor real e o valor \ncom desconto. "
				+ "\n\n0-) Sair";

		int opcao = -1;
		while (opcao != 0) {
			System.out.println(msg);
			opcao = solicitaInt("");
			switch (opcao) {
			case 1: {
				ex1();
				break;
			}
			case 2: {
				ex2();
				break;
			}
			case 3: {
				ex3();
				break;
			}
			case 4: {
				ex4();
				break;
			}
			}
		}
	}

	private static void ex4() {
		double valor =  solicitaDouble("Digite o valor do produto comprado");
		double quantidade = solicitaDouble("Digite a quantidade do produto");
		double total = valor * quantidade;
		DecimalFormat df = new DecimalFormat("#,###.00");
		System.out.println("Informações do produto:"
				+ "\nValor do Produto: R$" + df.format(valor)
				+ "\nQuantidade: " + String.valueOf(quantidade)
				+ "\nValor sem desconto: R$" + df.format(total)
				+ "\nValor com desconto de 5%: R$" + df.format(total - ((total * 5)/100)));
		System.out.println("\nPressione enter para continuar");
		scanner.nextLine();
		scanner.nextLine();
	}

	private static void ex3() {
		double valor =  solicitaDouble("Digite o valor do produto comprado");
		double porcentagem =  solicitaDouble("Digite o valor da % para revenda");
		DecimalFormat df = new DecimalFormat("#,###.00");
		System.out.println("Informações do produto:"
				+ "\nValor do Produto: R$" + df.format(valor)
				+ "\nProcentagem para revenda: " + df.format(porcentagem) + "%"
				+ "\nValor Total: R$" + df.format(valor + ((valor * porcentagem)/100)));
		System.out.println("\nPressione enter para continuar");
		scanner.nextLine();
		scanner.nextLine();
	}

	private static void ex2() {
		String nome = solicitaString("Digite o nome do usuário");
		String produto = solicitaString("Digite o produto desejado");
		double valor =  solicitaDouble("Digite o valor do produto");
		double quantidade = solicitaDouble("Digite a quantidade do produto");
		DecimalFormat df = new DecimalFormat("#,###.00");
		System.out.println("Informações da venda:"
				+ "\nNome: " + nome
				+ "\nproduto: " + produto
				+ "\nPreço Unitário: R$" + df.format(valor)
				+ "\nQuantidade: " + String.valueOf(quantidade)
				+ "\nPreço Total: R$" + df.format(quantidade * valor));
		System.out.println("\nPressione enter para continuar");
		scanner.nextLine();
		scanner.nextLine();
	}

	private static void ex1() {
		int value1 = solicitaInt("Digite o primeiro valor");
		int value2 = solicitaInt("Digite o segundo valor");
		System.out.println("A soma de " + value1 + " e " + value2 + " é " + (value1 + value2));
		System.out.println("\nPressione enter para continuar");
		scanner.nextLine();
		scanner.nextLine();
	}

	private static int solicitaInt(String msg) {
		while (true) {
			try {
				System.out.println(msg);
				return scanner.nextInt();
			} catch (Exception e) {
				scanner.nextLine();
				System.out.println("\nValor ditado é inválido");
			}
		}
	}

	private static String solicitaString(String msg) {
		while(true) {
			System.out.println(msg);
			String response = scanner.next();
			if(!response.equals("")) return response;
			System.out.println("\nDigite um valor válido");
		}
	}
	
	private static double solicitaDouble(String msg) {
		while (true) {
			try {
				System.out.println(msg);
				return scanner.nextDouble();
			} catch (Exception e) {
				scanner.nextLine();
				System.out.println("\nValor ditado é inválido");
			}
		}
	}
}
