package Practica6;

import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;
import tp06.ejercicio3.Arista;
import tp06.ejercicio3.Grafo;
import tp06.ejercicio3.Vertice;

public class Parcial2017 {
	public static ListaGenerica<String> caminoDistanciaMaxima(Grafo<String> ciudades, String origen, String destino, int maxDist)
	{
		boolean[] visitados = new boolean[ciudades.listaDeVertices().tamanio()+1];
		ListaGenerica<String> ret = new ListaEnlazadaGenerica<String>();
		Vertice<String> vOrig = buscarCiudad(ciudades, origen);
		Vertice<String> vDest = buscarCiudad(ciudades, destino);
		if(vOrig != null && vDest != null){
			buscarCamino(ciudades, vOrig, vDest, ret, maxDist, visitados);
		}
		return ret;
	}
	
	private static Vertice<String> buscarCiudad(Grafo<String> ciudades, String ciudad)
	{
		ListaGenerica<Vertice<String>> lis = ciudades.listaDeVertices();
		lis.comenzar();
		while(!lis.fin()){
			Vertice<String> elem = lis.proximo();
			if(elem.dato().equals(ciudad)){
				return elem;
			}
		}
		return null;
	}
	
	private static boolean buscarCamino(Grafo<String> ciudades, Vertice<String> origen, Vertice<String> destino, ListaGenerica<String> ret, int maxDist, boolean[] visitados)
	{
		if(visitados[origen.getPosicion()]){
			return false;
		}
		boolean found = origen.dato().equals(destino.dato());
		visitados[origen.getPosicion()] = true;
		if(!found){
			ListaGenerica<Arista<String>> ady = ciudades.listaDeAdyacentes(origen);
			ady.comenzar();
			while(!ady.fin() && !found){
				Arista<String> elem = ady.proximo();
				if(elem.peso() <= maxDist){
					found = buscarCamino(ciudades, elem.verticeDestino(), destino, ret, maxDist, visitados);
				}
			}
		}
		if(found){
			ret.agregarInicio(origen.dato());
		}
		visitados[origen.getPosicion()] = false;
		return found;
	}
}
