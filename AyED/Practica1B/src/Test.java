import java.util.Scanner;

public class Test
{
	public static void main(String[] args)
	{
		Scanner scan = new Scanner(System.in);
		Estudiante[] estudiantes = new Estudiante[2];////declaro y creo el arreglo
		Profesor[] profes = new Profesor[3];
		for (int i = 0; i < estudiantes.length; i++){
			estudiantes[i] = new Estudiante();//Inicializa
			
			log("Ingrese nombre del alumno");
			estudiantes[i].setNombre(scan.next());
			
			log("Ingrese apellido del alumno");
			estudiantes[i].setApellido(scan.next());
			
			log("Ingrese comision del alumno");
			estudiantes[i].setComision(scan.next());
			
			log("Ingrese email del alumno");
			estudiantes[i].setEmail(scan.next());
			
			log("Ingrese catedra del alumno");
			estudiantes[i].setCatedra(scan.next());
			
			log("Ingrese direccion del alumno");
			estudiantes[i].setCatedra(scan.next());
		}
		for (int i = 0; i < profes.length; i++){
			profes[i] = new Profesor();
			
			log("Ingrese nombre del profesor");
			profes[i].setNombre(scan.next());
			
			log("Ingrese apellido del profesor");
			profes[i].setApellido(scan.next());
			
			log("Ingrese email del profesor");
			profes[i].setEmail(scan.next());
			
			log("Ingrese catedra del profesor");
			profes[i].setCatedra(scan.next());
			
			log("Ingrese facultad del profesor");
			profes[i].setFacultad(scan.next());
		}
		for (int i = 0; i < estudiantes.length; i++){
			log(estudiantes[i].tusDatos());
		}
		for (int i = 0; i < profes.length; i++){
			log(profes[i].tusDatos());
		}
		scan.close();
	}
	
	private static void log(String str) {
		System.out.println(str);
	}
}