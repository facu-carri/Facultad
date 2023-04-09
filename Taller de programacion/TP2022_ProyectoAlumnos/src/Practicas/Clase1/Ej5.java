/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Clase1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author FACU
 */
public class Ej5 {

	public static void main(String[] args) {
		GeneradorAleatorio.iniciar();
		int [][] calif = new int[5][4];
		//Fila de clientes
		for(int i = 0; i < 5; i++){
			for (int j = 0; j < 4; j++){
				int valor = GeneradorAleatorio.generarInt(10);//Lector.leerInt();
				calif[i][j] = valor;
			}
		}
		String [] califName = {"Atención al cliente", "Calidad de la comida", "Precio", "Ambiente"};
		for (int i = 0; i < 4; i++){
			int totalCalif = 0;
			for (int j = 0; j < 5; j++){
				totalCalif += calif[j][i];
			}
			System.out.println("Promedio de calificaciones de " + califName[i] + " es: " + totalCalif/5);
		}
	}
}
