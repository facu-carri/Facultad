package Practicas.Clase4;

public class Triangulo extends Figura {
	
	private int lado1,lado2,lado3;

	public Triangulo(int lado1, int lado2, int lado3, String unCR, String unCL) {
		super(unCR, unCL);
		this.lado1 = lado1;
		this.lado2 = lado2;
		this.lado3 = lado3;
	}

	public int getLado1() {
		return lado1;
	}

	public void setLado1(int lado1) {
		this.lado1 = lado1;
	}

	public int getLado2() {
		return lado2;
	}

	public void setLado2(int lado2) {
		this.lado2 = lado2;
	}

	public int getLado3() {
		return lado3;
	}

	public void setLado3(int lado3) {
		this.lado3 = lado3;
	}
	
	@Override
	public double calcularPerimetro(){
		return lado1+lado2+lado3;
	}
	
	@Override
	public double calcularArea(){
		double s = calcularPerimetro()/2;
		return Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
	}
	
	@Override
	public String toString(){
		return super.toString() + ", Lado1: " + lado1 + ", Lado2: " + lado2 + ", Lado3: " + lado3;
	}
}