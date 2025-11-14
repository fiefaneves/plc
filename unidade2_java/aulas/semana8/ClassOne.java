package unidade2_java.aulas.semana8;

public class ClassOne {

    // definicao de constante
    // convenção: maiúsculas e underscore
    public static final double SOU_CONSTANTE_PI = 3.14;
    
    //public - modificador de acesso
    //static - método de classe (não precisa de instância)
    //void - tipo de retorno (nenhum)
    public static void main(String[] args) {
        System.out.println("Hello, World!");

        int x = 10; //x = "não pode!;" -- fortemente tipada
        System.out.println(x);

        double m = 12;
        m = m + x; //widening -> alargamento de tipo (double + int = double)
        System.out.println(m);

        m = x; //polimorfismo de coerção -> consigo representar com double qualquer valor do tipo int 
        
        String nome = m + " é o resultado"; //concatenação
        System.out.println(nome);

        //tipo de referência
        String outroNome = new String("Outro nome"); //equialete ao malloc de memória em C
        System.out.println(outroNome);

        int valor = devolve60(); //chamada de método
        // como tao na mesma classe, não precisa do nome da classe
        // int valor = ClassOne.devolve60();
        System.out.println("Valor devolvido: " + valor);
        
        boolean primos = primosEntreSi(15, 28);
        System.out.println("15 e 28 são primos entre si? " + primos);
        //System.out.println("15 e 42 são primos entre si? " + primosEntreSi(15, 42));
    
        //array
        int[] vetor = new int[5]; //vetor de inteiros com 5 posições
        vetor[0] = 10;
        vetor[1] = 20;
        System.out.println("Vetor tamanho: " + vetor.length);
        System.out.println("Vetor posição 0: " + vetor[0]);
        System.out.println("Vetor posição 1: " + vetor[1]);
    }
    
    public static int devolve60() {
        return 60;
    }

    public static boolean primosEntreSi(int a, int b) {
        // supondo que a e b são maiores que 1
        int div = a;
        while (div > 1) {
            if (a % div == 0 && b % div == 0) {
                return false;
            }
            div--;
        }
        return true;
    }
}