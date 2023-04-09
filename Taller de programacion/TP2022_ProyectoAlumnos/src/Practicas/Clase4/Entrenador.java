package Practicas.Clase4;

public class Entrenador extends Empleado{
	private int campeonatosGanados;

	public Entrenador(int campeonatosGanados, String nombre, int sueldo, int antiguedad) {
		super(nombre, sueldo, antiguedad);
		this.campeonatosGanados = campeonatosGanados;
	}

	public int getCampeonatosGanados() {
		return campeonatosGanados;
	}

	public void setCampeonatosGanados(int campeonatosGanados) {
		this.campeonatosGanados = campeonatosGanados;
	}

	@Override
	public double calcularEfectividad(){
		if(getAntiguedad() <= 0){
			return -1;
		}
		return campeonatosGanados/getAntiguedad();
	}
	
	@Override
	public double calcularSueldoACobrar(){
		int plus = 0;
		if(campeonatosGanados > 0){
			if(campeonatosGanados <= 4){
				plus = 5000;
			}else if(campeonatosGanados <= 10){
				plus = 30000;
			}else if(campeonatosGanados > 10){
				plus = 50000;
			}
		}
		return super.calcularSueldoACobrar() + plus;
	}
}