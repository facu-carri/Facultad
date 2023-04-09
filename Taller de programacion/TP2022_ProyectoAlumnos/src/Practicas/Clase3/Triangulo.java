package Practicas.Clase3;

public class Triangulo {
	private double lado1,lado2,lado3;
	private String colorR, colorB;
	
	public Triangulo(double lado1, double lado2, double lado3, String colorB, String colorR) {
		this.setLado1(lado1);
		this.setLado2(lado2);
		this.setLado3(lado3);
		this.setColorB(colorB);
		this.setColorR(colorR);
	}
	
	public double getLado1() {
		return lado1;
	}

	public void setLado1(double lado1) {
		this.lado1 = lado1;
	}

	public double getLado2() {
		return lado2;
	}

	public void setLado2(double lado2) {
		this.lado2 = lado2;
	}

	public double getLado3() {
		return lado3;
	}

	public void setLado3(double lado3) {
		this.lado3 = lado3;
	}

	public String getColorR() {
		return colorR;
	}

	public void setColorR(String colorR) {
		this.colorR = colorR;
	}

	public String getColorB() {
		return colorB;
	}

	public void setColorB(String colorB) {
		this.colorB = colorB;
	}
	
	public double calcularPerimetro(){
		return lado1 + lado2 + lado3;
	}
	
	public double calcularArea(){
		double s = calcularPerimetro()/2;
		return Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
	}
}
