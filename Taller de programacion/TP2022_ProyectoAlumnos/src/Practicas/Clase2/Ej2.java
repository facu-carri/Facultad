package Practicas.Clase2;
import PaqueteLectura.*;
public class Ej2 {

	public static void main(String[] args) {
		int dimL = 0;
		Persona [] vector = new Persona[15];
		Persona p = new Persona("EG", GeneradorAleatorio.generarInt(99), GeneradorAleatorio.generarInt(80));
		while(p.getEdad() != 0){
			vector[dimL] = p;
			dimL++;
			p = new Persona("EG", GeneradorAleatorio.generarInt(99), GeneradorAleatorio.generarInt(10));
		}
		int mayores = 0;
		Persona min = new Persona("EG", 0, 9999);
		System.out.println(dimL);
		for (int i = 0; i < dimL; i++){
			if(vector[i].getEdad() > 65){
				mayores++;
			}
			if(vector[i].getDNI() < min.getDNI()){
				min = vector[i];
			}
		}
		System.out.println("Personas mayores a 65 años " + mayores);
		System.out.println("Persona con menor DNI: " + min.toString());
	}
	
}
