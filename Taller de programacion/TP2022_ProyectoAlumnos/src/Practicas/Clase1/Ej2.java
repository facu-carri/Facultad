package Practicas.Clase1;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Ej2 {

	public static void main(String[] args) {
		double [] players = new double [15];
		double altura;
		double totalAlturas = 0;
		double promedio;
		int alturasMax = 0;
		for (int i = 0; i < players.length; i++){
			System.out.println("Ingrese la altura del jugador ");
			altura = GeneradorAleatorio.generarDouble(45);//Lector.leerDouble();
			players[i] = altura;
			totalAlturas += altura;
		}
		promedio = totalAlturas/players.length;
		System.out.println("Promedio " + promedio);
		for (int i = 0; i < players.length; i++){
			if(players[i] > promedio){
				alturasMax++;
			}
		}
		System.out.println("Cantidad de alturas superior al promedio " + alturasMax);
	}
	
}
