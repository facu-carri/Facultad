package tema3;

public class AlumnoDeDoctorado extends Alumno {

	public AlumnoDeDoctorado(String titulo, String universidad, String nombre, int DNI) {
		super(nombre, DNI);
		this.titulo = titulo;
		this.universidad = universidad;
	}
	private String titulo,universidad;

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getUniversidad() {
		return universidad;
	}

	public void setUniversidad(String universidad) {
		this.universidad = universidad;
	}
	
	@Override
	public boolean graduado(){
		return super.graduado() && materiaAprobada("Metodologías de la investigación");
	}
}