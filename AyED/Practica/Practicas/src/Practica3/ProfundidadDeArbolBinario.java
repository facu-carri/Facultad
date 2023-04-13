package Practica3;

import tp02.ejercicio3.ColaGenerica;
import tp03.ejercicio1.*;

public class ProfundidadDeArbolBinario {

	private ArbolBinario<Integer> arbol;
	
	public ProfundidadDeArbolBinario(ArbolBinario<Integer> arbol){
		this.arbol = arbol;
	}
	
	public int sumaElementosProfundidad(int p){
		//usar una queue
		//validar el tamaño del arbol
		int suma = 0;
		int level = 1;
		ColaGenerica<ArbolBinario<Integer>> cola = new ColaGenerica<ArbolBinario<Integer>>();
		cola.encolar(arbol);
		cola.encolar(null);
		while(!cola.esVacia()){
			ArbolBinario<Integer> nodo = cola.desencolar();
			if(nodo != null){
				if(level >= p){
					suma += nodo.getDato();
				}
				if(nodo.tieneHijoIzquierdo()){
					cola.encolar(nodo.getHijoIzquierdo());
				}
				if(nodo.tieneHijoDerecho()){
					cola.encolar(nodo.getHijoDerecho());
				}
			}else if(!cola.esVacia()){
				level++;
				cola.encolar(null);
			}
		}
		return suma;
	}
}
