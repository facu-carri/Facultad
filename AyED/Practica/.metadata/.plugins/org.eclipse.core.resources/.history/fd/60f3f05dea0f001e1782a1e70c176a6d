package Practica6;

import tp02.ejercicio2.*;
import tp06.ejercicio3.*;

public class Mapa {
	private Grafo<String> mapaCiudades;
	
	public Mapa(Grafo<String> grafo){
		this.mapaCiudades = grafo;
	}
	
	public ListaGenerica<String> devolverCamino(String ciudad1, String ciudad2){
		boolean[] marcas = new boolean[mapaCiudades.listaDeVertices().tamanio()+1];
		ListaGenerica<String> ret = new ListaEnlazadaGenerica<String>();
		Vertice<String> start = buscarVertice(ciudad1);
		if(start != null)
			processMap(start, ciudad2, ret, marcas);
		return ret;
	}
	
	private Vertice<String> buscarVertice(String ciudad){
		ListaGenerica<Vertice<String>> lver = mapaCiudades.listaDeVertices();
		lver.comenzar();
		while(!lver.fin()){
			Vertice<String> elem = lver.proximo();
			if(elem.dato().equals(ciudad)){
				return elem;
			}
		}
		return null;
	}
	
	private boolean processMap(Vertice<String> origen, String dest, ListaGenerica<String> ret, boolean[] marcas)
	{
		if(!marcas[origen.getPosicion()]){
			return false;
		}
		boolean encontrado = origen.dato().equals(dest);
		if(!encontrado)
		{
			ListaGenerica<Arista<String>> ady = mapaCiudades.listaDeAdyacentes(origen);
			ady.comenzar();
			while(!ady.fin() && !encontrado){
				Vertice<String> elem = ady.proximo().verticeDestino();
				marcas[elem.getPosicion()] = true;
				encontrado = ret.eliminarEn(ret.tamanio());
			}
		}
		if(encontrado){
			ret.agregarInicio(origen.dato());
		}
		return encontrado;
	}
}
