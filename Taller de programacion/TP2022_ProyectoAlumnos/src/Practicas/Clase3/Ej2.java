package Practicas.Clase3;
import PaqueteLectura.*;
public class Ej2 {

	public static void main(String[] args) {
		Autor a = new Autor();
		a.setNombre("Herbert Schildt");
		a.setBiografia("ANASHE GUAU GUAU");
		a.setOrigen("UGANDA");
		Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 a, "978-0071809252", 21.72);
		a.setNombre("John Horton");
		a.setBiografia("ANASHE GUAU GUAU");
		a.setOrigen("UGANDA");
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               a, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        Libro libro3= new Libro(); 
	}	
}
