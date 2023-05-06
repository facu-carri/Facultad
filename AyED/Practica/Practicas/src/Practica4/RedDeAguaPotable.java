package Practica4;

import tp02.ejercicio2.*;
import tp04.ejercicio1.ArbolGeneral;

public class RedDeAguaPotable {

	private ArbolGeneral<Integer> arbol;
	
	public RedDeAguaPotable(ArbolGeneral<Integer> arbol){
		this.arbol = arbol;
	}
	
	public double minimoCaudal(double caudal){
		if(arbol.esHoja()){
			return caudal;
		}
		double cant = 0;
		double min = 999;
		ListaGenerica<ArbolGeneral<Integer>> hijos = arbol.getHijos();
		hijos.comenzar();
		while(!hijos.fin()){
			cant = new RedDeAguaPotable(hijos.proximo()).minimoCaudal(caudal/arbol.getHijos().tamanio());
			if(cant < min){
				min = cant;
			}
		}
		return min;
	}
}