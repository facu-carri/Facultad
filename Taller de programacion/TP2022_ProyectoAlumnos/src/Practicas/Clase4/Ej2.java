package Practicas.Clase4;

public class Ej2 {

	public static void main(String[] args) {
		Jugador manuel = new Jugador(2, 11, "Manuel", 12400, 3);
		Entrenador jorge = new Entrenador(12, "Jorge", 8000, 9);
		System.out.println(manuel);
		System.out.println("Sueldo a cobrar: " + manuel.calcularSueldoACobrar());
		System.out.println();
		System.out.println(jorge);
		System.out.println("Sueldo a cobrar: " + jorge.calcularSueldoACobrar());
	}
}