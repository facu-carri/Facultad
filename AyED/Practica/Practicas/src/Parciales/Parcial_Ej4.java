package Parciales;

import tp02.ejercicio3.ColaGenerica;
import tp03.ejercicio1.ArbolBinario;

public class Parcial_Ej4 {

	public static void main(String[] args) {
		
	}
	
	public boolean esArbolCreciente(ArbolBinario<Integer> arbol){
		ColaGenerica<ArbolBinario<Integer>> cola = new ColaGenerica<ArbolBinario<Integer>>();
		cola.encolar(arbol);
		cola.encolar(null);
		int nivelActual = 0;
		int nodosActual = 0;
		boolean ret = true;
		if(arbol.esVacio()){
			return false;
		}
		while(!cola.esVacia() && ret){
			ArbolBinario<Integer> hijo = cola.desencolar();
			if(hijo != null){
				nodosActual++;
				if(hijo.tieneHijoIzquierdo()){
					cola.encolar(hijo.getHijoIzquierdo());
				}
				if(hijo.tieneHijoDerecho()){
					cola.encolar(hijo.getHijoDerecho());
				}
			}else if(!cola.esVacia()){
				nivelActual++;
				if(nodosActual < nivelActual){
					ret = false;
				}
				nodosActual = 0;
				cola.encolar(null);
			}
		}
		return ret;
	}
}
