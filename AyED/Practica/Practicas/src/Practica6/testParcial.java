package Practica6;

import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;
import tp06.ejercicio3.Grafo;
import tp06.ejercicio3.GrafoImplListAdy;
import tp06.ejercicio3.Vertice;
import tp06.ejercicio3.VerticeImplListAdy;

@SuppressWarnings("unused")
public class testParcial {
	public static void main(String[] args) {
		Vertice<String> v1 = new VerticeImplListAdy<String>("Buenos Aires");
		Vertice<String> v2 = new VerticeImplListAdy<String>("Santiago");
		Vertice<String> v3 = new VerticeImplListAdy<String>("Lima");
		Vertice<String> v4 = new VerticeImplListAdy<String>("Montevideo");
		Vertice<String> v5 = new VerticeImplListAdy<String>("Asuncion");
		Vertice<String> v6 = new VerticeImplListAdy<String>("Caracas");
		Vertice<String> v7 = new VerticeImplListAdy<String>("La Habana");

		Grafo<String> ciudades = new GrafoImplListAdy<String>();
		
		ciudades.agregarVertice(v1);
		ciudades.agregarVertice(v2);
		ciudades.agregarVertice(v3);
		ciudades.agregarVertice(v4);
		ciudades.agregarVertice(v5);
		ciudades.agregarVertice(v6);
		ciudades.agregarVertice(v7);

		ciudades.conectar(v1, v2,3);
		ciudades.conectar(v1, v3,9);
		ciudades.conectar(v1, v4,4);
		ciudades.conectar(v1, v5,8);
		ciudades.conectar(v2, v5,500);
		ciudades.conectar(v2, v7,4);
		ciudades.conectar(v3, v5,4);
		ciudades.conectar(v4, v5,6);
		ciudades.conectar(v6, v5,11);
		ciudades.conectar(v6, v7,10);

		//ListaGenerica<String> lis = mapa.devolverCamino("Buenos Aires","La habana");
		String origen = "Buenos Aires";
		String destino = "Asuncion";
		int maxKm = 6;
		//ListaGenerica<String> skip = new ListaEnlazadaGenerica<String>();
		//ListaGenerica<ListaGenerica<String>> lis = Parcial.resolver(ciudades, origen, destino, skip);
		ListaGenerica<ListaGenerica<String>> lis = ParcialTema1.resolver(ciudades, origen, destino, maxKm);
		ListaGenerica<String> lis_2 = Parcial2017.caminoDistanciaMaxima(ciudades, origen, destino, maxKm);
		print_2(lis_2);
	}
	
	private static void print_1(ListaGenerica<ListaGenerica<String>> lis)
	{
		lis.comenzar();
		while(!lis.fin()){
			ListaGenerica<String> camino = lis.proximo();
			System.out.println();
			print_2(camino);
		}
	}
	
	private static void print_2(ListaGenerica<String> lis)
	{
		lis.comenzar();
		while(!lis.fin()){
			String city = lis.proximo();
			System.out.print(city + " --> ");
		}
	}
}
