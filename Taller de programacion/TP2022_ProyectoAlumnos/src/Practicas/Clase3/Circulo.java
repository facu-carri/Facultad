package Practicas.Clase3;
/*
Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String).
*/
public class Circulo {
	
	private double radio;
	
	private String colorLinea,colorRelleno;

	public Circulo(){
		
	}
	
	public Circulo(double radio, String colorLinea, String colorRelleno) {
		this.radio = radio;
		this.colorLinea = colorLinea;
		this.colorRelleno = colorRelleno;
	}
	
	public double calcularArea(){
		return Math.PI*radio*radio;
	}
	
	public double calcularPerimetro(){
		return 2*Math.PI*radio;
	}
	
	public double getRadio() {
		return radio;
	}

	public void setRadio(double radio) {
		this.radio = radio;
	}

	public String getColorLinea() {
		return colorLinea;
	}

	public void setColorLinea(String colorLinea) {
		this.colorLinea = colorLinea;
	}

	public String getColorRelleno() {
		return colorRelleno;
	}

	public void setColorRelleno(String colorRelleno) {
		this.colorRelleno = colorRelleno;
	}
	
	
}