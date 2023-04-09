package Practicas.Clase1;
import PaqueteLectura.*;
public class Ej3 {

	public static void main(String[] args) {
		GeneradorAleatorio.iniciar();
		int [] [] matriz = new int[5][5];
		for (int i = 0; i < matriz.length; i++){
			for (int j = 0; j < matriz.length; j++){
				matriz[i][j] = GeneradorAleatorio.generarInt(31);
			}
		}
		for (int i = 0; i < matriz.length; i++){
			for (int j = 0; j < matriz.length; j++){
				System.out.println("Fila: " + i + ", Columna: " + j + ": " + matriz[i][j]);
			}
		}
		/*int sum = 0;
		for(int i = 0; i < matriz.length; i++){
			sum += matriz[0][i];
		}
		System.out.println("Suma primera fila: " + sum);*/
		int [] sumCols = new int[matriz.length];
		for (int i = 0; i < sumCols.length; i++){
			int colSum = 0;
			for(int j = 0; j < sumCols.length; j++){
				colSum += matriz[j][i];
			}
			sumCols[i] = colSum;
		}
		for(int i = 0; i < sumCols.length; i++){
			System.out.println("Columna: " + i + ": " + sumCols[i]);
		}
		int a;
		System.out.println("Ingrese un número: ");
		a = Lector.leerInt();
		boolean found = false;
		int i = 0;
		int j = 0;
		while(!found && i < matriz.length && j < matriz.length){
			if(matriz[i][j] == a){
				found = true;
			}else if(j == matriz.length - 1){
				i++;
				j = 0;
			}else{
				j++;
			}
		}
		if(found){
			System.out.println("El número " + Integer.toString(a) + " fue encontrado en la fila " + i + ", columna: " + j);
		}else{
			System.out.println("No se encontró el elemento");
		}
	}
}
