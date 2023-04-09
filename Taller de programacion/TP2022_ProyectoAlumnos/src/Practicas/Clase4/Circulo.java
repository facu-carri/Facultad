package Practicas.Clase4;
/*
Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String).
*/
public class Circulo extends Figura {
	
	private double radio;

	public Circulo(double radio, String unCR, String unCL) {
		super(unCR, unCL);
		this.radio = radio;
	}
	
	public double getRadio() {
		return radio;
	}

	public void setRadio(double radio) {
		this.radio = radio;
	}
	
	@Override
	public double calcularArea(){
		return Math.PI*radio*radio;
	}
	
	@Override
	public double calcularPerimetro(){
		return 2*Math.PI*radio;
	}
	
	@Override
	public String toString(){
		return super.toString() + ", Radio: " + radio;
	}
}