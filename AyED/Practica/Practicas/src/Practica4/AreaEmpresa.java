package Practica4;

public class AreaEmpresa
{
	private String nombre;
	private int retardo;
	/*private int max = 100;
	private int min = 1;*/
	
	public AreaEmpresa(int retardo){
		this.retardo = retardo;
		this.nombre = "test_" + retardo;//Math.floor(Math.random() * (max - min + 1));
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getRetardo() {
		return retardo;
	}
	public void setRetardo(int retardo) {
		this.retardo = retardo;
	}
}
