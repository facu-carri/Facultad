package Practicas.Clase4;

public class Jugador extends Empleado{
	private int partidos, goles;

	public Jugador(int partidos, int goles, String nombre, int sueldo, int antiguedad) {
		super(nombre, sueldo, antiguedad);
		this.partidos = partidos;
		this.goles = goles;
	}

	public int getPartidos() {
		return partidos;
	}

	public void setPartidos(int partidos) {
		this.partidos = partidos;
	}

	public int getGoles() {
		return goles;
	}

	public void setGoles(int goles) {
		this.goles = goles;
	}
	
	public double calcularEfectividad(){
		if(partidos <= 0)
			return -1;
		return goles/partidos;
	}
	
	@Override
	public double calcularSueldoACobrar(){
		int plus = 0;
		if(calcularEfectividad() > 0.5)
			plus = getSueldo();
		return super.calcularSueldoACobrar() + plus;
	}
}