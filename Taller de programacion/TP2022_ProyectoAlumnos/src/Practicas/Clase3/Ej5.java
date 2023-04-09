package Practicas.Clase3;

import PaqueteLectura.Lector;

public class Ej5 {

	public static void main(String[] args) {
		Circulo c;
		System.out.println("Radio: ");
		double radio = Lector.leerDouble();
		System.out.println("Color linea: ");
		String colorLinea = Lector.leerString();
		System.out.println("Color relleno: ");
		String colorRelleno = Lector.leerString();
		c = new Circulo(radio, colorLinea, colorRelleno);
		System.out.println("Perímetro: " + c.calcularPerimetro());
		System.out.println("Área: " + c.calcularArea());
	}
}