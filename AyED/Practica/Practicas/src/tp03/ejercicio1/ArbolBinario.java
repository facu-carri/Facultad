package tp03.ejercicio1;

import tp02.ejercicio3.ColaGenerica;

public class ArbolBinario<T> {
	private T dato;
	private ArbolBinario<T> hijoIzquierdo;   
	private ArbolBinario<T> hijoDerecho; 

	
	public ArbolBinario() {
		super();
	}

	public ArbolBinario(T dato) {
		this.dato = dato;
	}

	/*
	 * getters y setters
	 * 
	 */
	public T getDato() {
		return dato;
	}

	public void setDato(T dato) {
		this.dato = dato;
	}
	
	/**
	 * Preguntar antes de invocar si tieneHijoIzquierdo()
	 * @return
	 */
	public ArbolBinario<T> getHijoIzquierdo() {
		return this.hijoIzquierdo;
	}

	public ArbolBinario<T> getHijoDerecho() {
		return this.hijoDerecho;

	}

	public void agregarHijoIzquierdo(ArbolBinario<T> hijo) {
		this.hijoIzquierdo = hijo;
	}

	public void agregarHijoDerecho(ArbolBinario<T> hijo) {
		this.hijoDerecho = hijo;
	}

	public void eliminarHijoIzquierdo() {
		this.hijoIzquierdo = null;
	}

	public void eliminarHijoDerecho() {
		this.hijoDerecho = null;
	}

	public boolean esVacio() {
		return this.getDato() == null && !this.tieneHijoIzquierdo() && !this.tieneHijoDerecho();
	}

	public boolean esHoja() {
		return (!this.tieneHijoIzquierdo() && !this.tieneHijoDerecho());

	}

	@Override
	public String toString() {
		return this.getDato().toString();
	}

	 
	public boolean tieneHijoIzquierdo() {
		return this.hijoIzquierdo!=null;
	}

	 
	public boolean tieneHijoDerecho() {
		return this.hijoDerecho!=null;
	}

	public int contarHojas()
	{
		if(this.esHoja() && !this.esVacio()){
			return 1;
		}
		int cant = 0;
		if(this.tieneHijoIzquierdo()){
			cant += this.getHijoIzquierdo().contarHojas();
		}
		if(this.tieneHijoDerecho()){
			cant += this.getHijoDerecho().contarHojas();
		}
		return cant;
		//return preorder(this);
	}
	
	/*private int preorder(ArbolBinario<T> arbol){
		if(arbol.esHoja() && !arbol.esVacio()){
			return 1;
		}
		int cant = 0;
		if(arbol.tieneHijoIzquierdo()){
			cant += this.preorder(arbol.getHijoIzquierdo());
		}
		if(arbol.tieneHijoDerecho()){
			cant += this.preorder(arbol.getHijoDerecho());
		}
		return cant;
	}*/

    public ArbolBinario<T> espejo()
    {
    	ArbolBinario<T> doble = new ArbolBinario<T>(this.getDato());
		if(this.tieneHijoIzquierdo()){
			doble.agregarHijoDerecho(hijoIzquierdo.espejo());
		}
		if(this.tieneHijoDerecho()){
			doble.agregarHijoIzquierdo(hijoDerecho.espejo());
		}
		return doble;
	}


    public void entreNiveles(int n, int m)
    {
        ColaGenerica<ArbolBinario<T>> queue = new ColaGenerica<ArbolBinario<T>>(); //First in, First Out
        queue.encolar(this);
        queue.encolar(null);
        int nivelActual = 1;
        ArbolBinario<T> nodo;
        while(!queue.esVacia()){
            nodo = queue.desencolar();
            if(nodo != null){
                if(nivelActual >= n && nivelActual <= m){
                    System.out.println(nodo.getDato());
                }
                if(nodo.tieneHijoIzquierdo()){
                    queue.encolar(nodo.getHijoIzquierdo());
                }
                if(nodo.tieneHijoDerecho()){
                    queue.encolar(nodo.getHijoDerecho());
                }
            }else{
                if(!queue.esVacia()){
                    nivelActual = nivelActual + 1;
                    queue.encolar(null);
                }
            }
        }
    }
}