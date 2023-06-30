package Practica6;

import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;
import tp06.ejercicio3.Arista;
import tp06.ejercicio3.Grafo;
import tp06.ejercicio3.Vertice;

public class ParcialTema1 {
	
	public static ListaGenerica<ListaGenerica<String>> resolver(Grafo<String> ciudades, String origen, String destino, int maxKilometros){
		boolean[] visitados = new boolean[ciudades.listaDeVertices().tamanio()+1];
		ListaGenerica<ListaGenerica<String>> ret = new ListaEnlazadaGenerica<ListaGenerica<String>>();
		ListaGenerica<String> pathList = new ListaEnlazadaGenerica<String>();
		Vertice<String> vOrig = buscarCiudad(ciudades, origen);
		Vertice<String> vDest = buscarCiudad(ciudades, destino);
		if(vOrig != null && vDest != null){
			buscarCaminos(ciudades, vOrig, vDest, pathList, ret, maxKilometros, visitados);
		}
		return ret;
	}
	
	private static Vertice<String> buscarCiudad(Grafo<String> ciudades, String ciudad){
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
	
	private static boolean buscarCaminos(Grafo<String> caminos, Vertice<String> origen, Vertice<String> destino, ListaGenerica<String> pathList, ListaGenerica<ListaGenerica<String>> ret, int maxKm, boolean[] visitados){
		if(visitados[origen.getPosicion()]){
			return false;
		}
		boolean found = origen.dato().equals(destino.dato()) && maxKm >= 0;
		visitados[origen.getPosicion()] = true;
		pathList.agregarFinal(origen.dato());
		if(!found){
			ListaGenerica<Arista<String>> ady = caminos.listaDeAdyacentes(origen);
			ady.comenzar();
			while(!ady.fin()){
				Arista<String> elem = ady.proximo();
				buscarCaminos(caminos, elem.verticeDestino(), destino, pathList.clonar(), ret, maxKm-elem.peso(), visitados);
			}
		}else{
			ret.agregarFinal(pathList);
		}
		visitados[origen.getPosicion()] = false;
		return found;
	}
}
