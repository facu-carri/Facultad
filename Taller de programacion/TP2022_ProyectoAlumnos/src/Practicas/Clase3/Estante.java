package Practicas.Clase3;

public class Estante {

	private Libro [] libros;
	
	private int dimL;
	
	public Estante() {
		this.dimL = 0;
		this.libros = new Libro[20];
	}
	
	public int cantidad(){
		return dimL;
	}
	
	public boolean full(){
		return dimL >= libros.length;
	}
	
	public void agregarLibro(Libro l){
		if(!full()){
			libros[dimL] = l;
			dimL++;
		}
	}
	
	public Libro buscarTitulo(String str){
		//CAMINO 1
		int i = 0;
		while(i < dimL && libros[i].getTitulo() != str){
			i++;
		}
		if(i == dimL){
			return null;
		}else{
			return libros[i];
		}
		
		/*
		//CAMINO 2
		for (int i = 0; i < dimL; i++){
			if(str.equals(libros[i].getTitulo())){
				return libros[i];
			}
		}
		return null;
		*/
	}
}