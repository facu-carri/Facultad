package Practicas.Clase3;

import PaqueteLectura.*;

public class Habitacion {
	
	private int costo;
	
	private boolean ocupada;
	
	private String nombre;
	
	private int DNI;
	
	private int edad;

	public Habitacion() {
		this.costo = GeneradorAleatorio.generarInt(6000) + 2000;
		this.ocupada = false;
	}

	public Habitacion(String nombre, int DNI, int edad) {
		this.nombre = nombre;
		this.DNI = DNI;
		this.edad = edad;
	}

	public int getCosto() {
		return costo;
	}

	public void setCosto(int costo) {
		this.costo = costo;
	}

	public boolean isOcupada() {
		return ocupada;
	}

	public void setOcupada(boolean ocupada) {
		this.ocupada = ocupada;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getDNI() {
		return DNI;
	}

	public void setDNI(int DNI) {
		this.DNI = DNI;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}
}