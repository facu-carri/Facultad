import tp02.ejercicio1.ListaDeEnterosEnlazada;

public class TestListaDeEnterosEnlazada {

	public static void main(int[] secuencia) {
		ListaDeEnterosEnlazada lista = new ListaDeEnterosEnlazada();
		lista.comenzar();
		for (int i = 0; i < secuencia.length; i++){
			lista.agregarFinal(secuencia[i]);
		}
		while(!lista.fin()){
			System.out.println(lista.proximo());
		}
	}
}