package tema3;

public class AlumnoDeGrado extends Alumno{
	
	public AlumnoDeGrado(String carrera, String nombre, int DNI) {
		super(nombre, DNI);
		this.carrera = carrera;
	}
	private String carrera;

	public String getCarrera() {
		return carrera;
	}

	public void setCarrera(String carrera) {
		this.carrera = carrera;
	}
}