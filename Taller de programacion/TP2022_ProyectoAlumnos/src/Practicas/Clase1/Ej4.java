package Practicas.Clase1;
import PaqueteLectura.*;
public class Ej4 {

	public static void main(String[] args) {
		GeneradorAleatorio.iniciar();
		int [][] edificio = new int[5][9];
		int piso = GeneradorAleatorio.generarInt(9) + 1;//1..9
		int ofi = GeneradorAleatorio.generarInt(3) + 1;//1..4
		while(piso != 9){
			edificio[ofi][piso] += 1;
			ofi = GeneradorAleatorio.generarInt(3) + 1;
			piso = GeneradorAleatorio.generarInt(9) + 1;
		}
		int i = 1;//Piso = Columna
		int j = 1;//Ofi = Fila
		while(i < 9 && j < 5){
			if(edificio[j][i] != 0){
				System.out.println("En el piso " + i + ", en la oficina " + j + " hay " + edificio[j][i] + " personas");
			}
			if(i == 8){
				i = 1;
				j++;
			}else{
				i++;
			}
		}
	}
	
	public static void trace(String str){
		System.out.println(str);
	}
}
