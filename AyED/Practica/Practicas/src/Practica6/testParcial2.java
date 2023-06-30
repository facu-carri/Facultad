package Practica6;

import tp02.ejercicio2.ListaGenerica;
import tp06.ejercicio3.Grafo;
import tp06.ejercicio3.GrafoImplListAdy;
import tp06.ejercicio3.Vertice;
import tp06.ejercicio3.VerticeImplListAdy;

public class testParcial2
{
	public static void main(String[] args){
		Grafo<nodoColor> grafo = new GrafoImplListAdy<nodoColor>();
        
        Vertice<nodoColor> a = new VerticeImplListAdy<nodoColor>(new nodoColor("A", "blanco"));
        Vertice<nodoColor> b = new VerticeImplListAdy<nodoColor>(new nodoColor("B", "blanco"));
        Vertice<nodoColor> c = new VerticeImplListAdy<nodoColor>(new nodoColor("C", "blanco"));
        Vertice<nodoColor> d = new VerticeImplListAdy<nodoColor>(new nodoColor("D", "negro"));
        Vertice<nodoColor> e = new VerticeImplListAdy<nodoColor>(new nodoColor("E", "negro"));
        Vertice<nodoColor> f = new VerticeImplListAdy<nodoColor>(new nodoColor("F", "blanco"));
        Vertice<nodoColor> g = new VerticeImplListAdy<nodoColor>(new nodoColor("G", "negro"));
        
        grafo.agregarVertice(a);
        grafo.agregarVertice(b);
        grafo.agregarVertice(c);
        grafo.agregarVertice(d);
        grafo.agregarVertice(e);
        grafo.agregarVertice(f);
        grafo.agregarVertice(g);
        
        grafo.conectar(a, b);
        grafo.conectar(a, g);
        grafo.conectar(a, f);
        grafo.conectar(b, a);
        grafo.conectar(b, g);
        grafo.conectar(b, c);
        grafo.conectar(c, b);
        grafo.conectar(c, g);
        grafo.conectar(c, d);
        grafo.conectar(d, c);
        grafo.conectar(d, g);
        grafo.conectar(d, e);
        grafo.conectar(e, f);
        grafo.conectar(e, g);
        grafo.conectar(e, d);
        grafo.conectar(f, a);
        grafo.conectar(f, g);
        grafo.conectar(f, e);
        grafo.conectar(g, a);
        grafo.conectar(g, b);
        grafo.conectar(g, c);
        grafo.conectar(g, d);
        grafo.conectar(g, e);
        grafo.conectar(g, f);
        ParcialEjGrafo p = new ParcialEjGrafo();
        ListaGenerica<String> lis = p.devolverRecorrido(grafo);
        lis.comenzar();
        while(!lis.fin()){
        	String dato = lis.proximo();
        	System.out.print(dato);
        }
	}
}
