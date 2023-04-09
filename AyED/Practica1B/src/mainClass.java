import java.util.Scanner;

public class mainClass
{	
	public static void main(String[] args)
	{
		Scanner scan = new Scanner(System.in);
		print_A(0,7);
		print_B(0,7);
		print_C(0,7);
		int cant = scan.nextInt();
		while(cant != 42){
			pinrtArr(getMultiplos(cant));
			cant = scan.nextInt();
		}
		scan.close();
	}
	
	public static void pinrtArr(int[] arr)
	{
		for(int i=0; i < arr.length; i++)
		{
			if(i == arr.length - 1){
				System.out.print(arr[i]);
			}else{
				System.out.print(arr[i] + ", ");
			}
		}
		System.out.println();
	}
	
	public static void print_A(int a, int b)
	{
		for(int i=a+1; i < b; i++){
			System.out.println(i);
		}
	}
	
	public static void print_B(int a, int b)
	{
		a++;
		while(a < b){
			System.out.println(a);
			a++;
		}
	}
	
	public static void print_C(int a, int b)
	{
		a++;
		if(a < b){
			System.out.println(a);
			print_C(a, b);
		}
	}
	
	public static int[] getMultiplos(int n)
	{
		int[] arr = new int[n];
		for(int i = 0; i < arr.length; i++){
			arr[i] = n + (n * i);
		}
		return arr;
	}
}