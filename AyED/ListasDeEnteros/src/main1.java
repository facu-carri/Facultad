import tp02.ejercicio1.*;

public class main1
{
	public static void main(String[] args)
	{
		ListaDeEnteros lista = printSucesion(6);
		lista.comenzar();
		while(!lista.fin()){
			System.out.print(lista.proximo().toString() + " ");
		}
	}
	
	/*private void printListaReversa(ListaDeEnteros lista){
		int dato = lista.proximo();
		if(!lista.fin()){
			printListaReversa(lista);
		}
		System.out.println(dato);
	}*/
	
	private static ListaDeEnteros printSucesion(int num){
		ListaDeEnteros lista = new ListaDeEnterosEnlazada();
		recursion(lista, num);
		return lista;
	}
	
	private static void recursion(ListaDeEnteros lista, int num){
		lista.agregarFinal(num);
		if(num != 1){
			if(num % 2 == 0){
				recursion(lista, num/2);
			}else{
				recursion(lista, 3*num + 1);
			}
		}
	}
}