package Practicas.Clase2;
import PaqueteLectura.*;
public class Ej1 {

	public static void main(String[] args) {
		System.out.println("Ingrese nombre ");
		String name = Lector.leerString();
		System.out.println("Ingrese DNI ");
		int DNI = Lector.leerInt();
		System.out.println("Ingrese edad ");
		int edad = Lector.leerInt();
		Persona p = new Persona(name, DNI, edad);
		System.out.println(p.toString());
	}
}
