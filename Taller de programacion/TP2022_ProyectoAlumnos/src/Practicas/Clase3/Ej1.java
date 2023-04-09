package Practicas.Clase3;
import PaqueteLectura.*;
public class Ej1 {

	public static void main(String[] args) {
		String borde,relleno;
		double lado1,lado2,lado3;
		System.out.println("Lado1: ");lado1 = Lector.leerDouble();
		System.out.println("Lado2: "); lado2 = Lector.leerDouble();
		System.out.println("Lado3: "); lado3 = Lector.leerDouble();
		System.out.println("Borde: "); borde = Lector.leerString();
		System.out.println("Relleno: "); relleno = Lector.leerString();
		Triangulo t = new Triangulo(lado1,lado2,lado3,borde,relleno);
		System.out.println("Perimetro: " + t.calcularPerimetro());
		System.out.println("Área: " + t.calcularArea());
	}
}