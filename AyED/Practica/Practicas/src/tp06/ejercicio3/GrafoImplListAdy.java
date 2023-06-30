package tp06.ejercicio3;

import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;

/**
 * Implementacion del grafo con lista de ady
 * 
 * @author juan
 *
 */

public class GrafoImplListAdy<T> implements Grafo<T> {
	ListaGenerica<Vertice<T>> vertices = new ListaEnlazadaGenerica<Vertice<T>>();


	public void agregarVertice(Vertice<T> v) {
		if(!vertices.incluye(v)){
		    vertices.agregarFinal(v);
			((VerticeImplListAdy<T>) v).setPosicion(vertices.tamanio());
		}
	}

	public void eliminarVertice(Vertice<T> v) {
		int indice = ((VerticeImplListAdy<T>)v).getPosicion();
		if(indice >=0){
			Vertice<T> vert;
			vertices.comenzar();
			while(!vertices.fin()){
				vert = vertices.proximo();
				desConectar(vert, v);
			}
			
			boolean salir = false;
			vertices.comenzar();
			while(!vertices.fin() && !salir){
				vert = vertices.proximo();
				if(vert.equals(v)){
					vertices.eliminar(vert);
					salir = true;
				}
			}

			for(;indice<vertices.tamanio();indice++){
				vert = vertices.elemento(indice);
				((VerticeImplListAdy<T>)vert).setPosicion(vert.getPosicion()-1);
			}
		}
	}

	public void conectar(Vertice<T> origen, Vertice<T> destino) {
		((VerticeImplListAdy<T>) origen).conectar(destino);
	}

	public void conectar(Vertice<T> origen, Vertice<T> destino, int peso) {
		((VerticeImplListAdy<T>) origen).conectar(destino,peso);
	}

	public void desConectar(Vertice<T> origen, Vertice<T> destino) {
		((VerticeImplListAdy<T>) origen).desconectar(destino);
	}

	public boolean esAdyacente(Vertice<T> origen, Vertice<T> destino) {
		return ((VerticeImplListAdy<T>) origen).esAdyacente(destino);
	}

	public boolean esVacio() {
		return vertices.esVacia();
	}

	public ListaGenerica<Vertice<T>> listaDeVertices() {
		return vertices;
	}

	public int peso(Vertice<T> origen, Vertice<T> destino) {
		return ((VerticeImplListAdy<T>) origen).peso(destino);
	}
	
    public ListaGenerica<Arista<T>> listaDeAdyacentes(Vertice<T> v){
		return ((VerticeImplListAdy<T>) v).obtenerAdyacentes();
	}
	
    public Vertice<T> vetice(int posicion){
		return vertices.elemento(posicion);
	}
}
