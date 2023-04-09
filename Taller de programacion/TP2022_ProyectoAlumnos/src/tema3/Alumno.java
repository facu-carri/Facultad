package tema3;

public abstract class Alumno {
	
	private String nombre;
	private int DNI;
	private int dimL = 0;
	private Materia [] aprobadas;

	public Alumno(String nombre, int DNI) {
		this.nombre = nombre;
		this.DNI = DNI;
	}
	
	public Alumno(int dimF){
		this.aprobadas = new Materia[dimF];
	}
	
	public void addMateria(Materia m){
		aprobadas[dimL] = m;
		dimL++;
	}
	
	public int dimF() {
		return aprobadas.length;
	}
	
	public boolean materiaAprobada(String str){
		int i = 0;
		boolean found = false;
		while(!found && i < dimL){
			if(aprobadas[i].getNombre() == str){
				found = true;
			}
			i++;
		}
		return found;
	}
	
	public boolean graduado(){
		return dimF() == dimL;
	}
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getDNI() {
		return DNI;
	}

	public void setDNI(int DNI) {
		this.DNI = DNI;
	}

	public Materia[] getAprobadas() {
		return aprobadas;
	}

	public void setAprobadas(Materia[] aprobadas) {
		this.aprobadas = aprobadas;
	}
	
	@Override
	public String toString(){
		String mAp =  "";
		for (int i = 0; i < dimL; i++){
			mAp += aprobadas[i].toString();
		}
		return "DNI " + DNI + "; Nombre " + nombre + "; Materias aprobadas: " + mAp + "; Está graduado: " + graduado();
	}
}