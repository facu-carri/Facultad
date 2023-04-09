package tema3;

public class Materia {
	
	private String nombre;
	private int nota, fecha;

	public Materia(String nombre, int nota, int fecha) {
		this.nombre = nombre;
		this.nota = nota;
		this.fecha = fecha;
	}
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getNota() {
		return nota;
	}

	public void setNota(int nota) {
		this.nota = nota;
	}

	public int getFecha() {
		return fecha;
	}

	public void setFecha(int fecha) {
		this.fecha = fecha;
	}
	
	@Override
	public String toString(){
		return nombre + " " + fecha + " " + nota;
	}
}