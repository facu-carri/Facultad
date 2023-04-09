package Practicas.Clase2;
import PaqueteLectura.*;
/*
Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
partido sabe responder a los siguientes mensajes:

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:

- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local
*/
public class Ej5 {

	public static void main(String[] args) {
		int dimF = 20;
		int dimL = 0;
		Partido [] partidos = new Partido[dimF];
		Partido p = loadPartidoFast(dimL);
		while(p.getVisitante() != "ZZZ" && dimL < dimF){
			partidos[dimL] = p;
			dimL++;
			p = loadPartidoFast(dimL);//loadPartido();
		}
		int boca = 0;
		int river = 0;
		for (int i = 0; i < dimL; i++){
			p = partidos[i];
			if(p.hayGanador() && p.getGanador() == "River"){
				river++;
			}
			if(p.getLocal() == "Boca"){
				boca += p.getGolesLocal();
			}
			trace("{" + p.getLocal() + " " + p.getGolesLocal() + " VS " + p.getVisitante() + " " + p.getGolesVisitante() + "}");
		}
		trace("Total de goles que realizó Boca jugando de local: " + boca);
		trace("Cantidad de partidos que ganó River: " + river);
	}
	
	public static Partido loadPartidoFast(int a){
		return new Partido("loc_" + a, "vis_" + a, GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarInt(10));
	}
	
	public static void trace(String str){
		System.out.println(str);
	}
	
	public static Partido loadPartido(){
		System.out.println("Ingrese equipo visitante: ");
		String visitante = Lector.leerString();
		System.out.println("Ingrese equipo local: ");
		String local = Lector.leerString();
		System.out.println("Ingrese cantidad de goles del equipo visitante: ");
		int golesVisitant = Lector.leerInt();
		System.out.println("Ingrese cantidad de goles del equipo local: ");
		int golesLocal = Lector.leerInt();
		return new Partido(local, visitante, golesLocal, golesVisitant);
	}
}