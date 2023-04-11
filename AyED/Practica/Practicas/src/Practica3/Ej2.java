package Practica3;
import tp03.ejercicio1.*;

public class Ej2
{
	public static void main(String[] args)
	{
		ArbolBinario<Integer> arbol = new ArbolBinario<Integer>(1);
		agregarIzq(arbol, 2);
		agregarIzq(arbol, 4);
		arbol.getHijoIzquierdo().agregarHijoDerecho(crearNodo(5));
		arbol.agregarHijoDerecho(crearNodo(3));
		arbol.getHijoDerecho().agregarHijoDerecho(crearNodo(6));
		arbol.entreNiveles(1, 2);
	}
	
	private static ArbolBinario<Integer> crearNodo(Integer dato){
		return new ArbolBinario<Integer>(dato);
	}
	
	private static void agregarIzq(ArbolBinario<Integer> arbol, Integer dato){
		ArbolBinario<Integer> init = arbol;
		while(!arbol.esHoja()){
			arbol = arbol.getHijoIzquierdo();
		}
		arbol.agregarHijoIzquierdo(crearNodo(dato));
		arbol = init;
	}
	
	/*private static void agregar(ArbolBinario<Integer> arbol, Integer dato)
	{
		if(arbol != null){
			if(dato < arbol.getDato()){
				if(arbol.getHijoIzquierdo() == null){
					arbol.agregarHijoIzquierdo(crearNodo(dato));
				}else{
					agregar(arbol.getHijoIzquierdo(), dato);
				}
			}else{
				if(arbol.getHijoDerecho() == null){
					arbol.agregarHijoDerecho(crearNodo(dato));
				}else{
					agregar(arbol.getHijoDerecho(), dato);
				}
			}
		}else{
			arbol = crearNodo(dato);
		}
	}*/
	
	/*
	private static void agregar(ArbolBinario<Integer> arbol, Integer dato)
	{
		if(!arbol.esVacio()){
			if(dato < arbol.getDato()){
				if(arbol.getHijoIzquierdo() == null){
					arbol.agregarHijoIzquierdo(crearNodo(dato));
				}else{
					agregar(arbol.getHijoIzquierdo(), dato);
				}
			}else{
				if(arbol.getHijoDerecho() == null){
					arbol.agregarHijoDerecho(crearNodo(dato));
				}else{
					agregar(arbol.getHijoDerecho(), dato);
				}
			}
		}else{
			arbol = crearNodo(dato);
		}
	}*/
	
}