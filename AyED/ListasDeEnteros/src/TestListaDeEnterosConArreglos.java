import tp02.ejercicio1.*;

public class TestListaDeEnterosConArreglos {

	public static void main(Integer[] secuencia) {
		ListaDeEnterosConArreglos listaArreglo = new ListaDeEnterosConArreglos();
		listaArreglo.comenzar();
		for (int i = 0; i < secuencia.length; i++){
			listaArreglo.agregarFinal(secuencia[i]);
		}
		for (int i = 0; i < listaArreglo.tamanio(); i++){
			System.out.println(listaArreglo.elemento(i));
		}
	}
}
