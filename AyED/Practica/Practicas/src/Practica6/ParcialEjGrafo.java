package Practica6;

import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;
import tp06.ejercicio3.Arista;
import tp06.ejercicio3.Grafo;
import tp06.ejercicio3.Vertice;

public class ParcialEjGrafo
{
	public ParcialEjGrafo(){
		
	}
	
	public ListaGenerica<String> devolverRecorrido(Grafo<nodoColor> grafo){
		boolean[] visitados = new boolean[grafo.listaDeVertices().tamanio()+1];
		ListaGenerica<String> ret = new ListaEnlazadaGenerica<String>();
		String origen = "A";
		String destino = "E";
		Vertice<nodoColor> vOrig = buscarVertice(grafo, origen);
		Vertice<nodoColor> vDest = buscarVertice(grafo, destino);
		if(vOrig != null && vDest != null){
			buscarCamino(grafo, vOrig, vDest, ret, visitados);
		}
		return ret;
	}
	
	private Vertice<nodoColor> buscarVertice(Grafo<nodoColor> grafo, String letra){
		ListaGenerica<Vertice<nodoColor>> lis = grafo.listaDeVertices();
		lis.comenzar();
		while(!lis.fin()){
			Vertice<nodoColor> elem = lis.proximo();
			if(elem.dato().equals(letra)){
				return elem;
			}
		}
		return null;
	}
	
	private boolean buscarCamino(Grafo<nodoColor> grafo, Vertice<nodoColor> origen, Vertice<nodoColor> destino, ListaGenerica<String> ret, boolean[] visitados){
		if(visitados[origen.getPosicion()]){
			return false;
		}
		visitados[origen.getPosicion()] = true;
		boolean found = destino.dato().getDato() == origen.dato().getDato();
		if(!found){
			ListaGenerica<Arista<nodoColor>> lis = grafo.listaDeAdyacentes(origen);
			lis.comenzar();
			while(!lis.fin() && !found){
				Arista<nodoColor> arista = lis.proximo();
				Vertice<nodoColor> vert = arista.verticeDestino();
				if(vert.dato().getColor() != origen.dato().getColor()){
					found = buscarCamino(grafo, vert, destino, ret, visitados);
				}
			}
		}
		if(found){
			ret.agregarInicio(origen.dato().getDato());
		}
		visitados[origen.getPosicion()] = false;
		return found;
	}
}
