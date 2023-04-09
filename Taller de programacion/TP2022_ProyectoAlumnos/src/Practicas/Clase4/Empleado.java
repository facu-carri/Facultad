package Practicas.Clase4;

public abstract class Empleado {
	
	private String nombre;
	private int sueldo, antiguedad;

	public Empleado(String nombre, int sueldo, int antiguedad) {
		this.nombre = nombre;
		this.sueldo = sueldo;
		this.antiguedad = antiguedad;
	}

	public int getSueldo() {
		return sueldo;
	}

	public void setSueldo(int sueldo) {
		this.sueldo = sueldo;
	}

	public int getAntiguedad() {
		return antiguedad;
	}

	public void setAntiguedad(int antiguedad) {
		this.antiguedad = antiguedad;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public abstract double calcularEfectividad();
	
	public double calcularSueldoACobrar(){
		double mas = sueldo*0.10*antiguedad;
		return sueldo + mas;
	}
	
	public String toString(){
		return "Nombre: " + nombre + ", Sueldo: " + sueldo + ", Efectividad: " + calcularEfectividad();
	}
}