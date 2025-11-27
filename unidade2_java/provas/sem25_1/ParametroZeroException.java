package unidade2_java.provas.sem25_1;

public class ParametroZeroException extends Exception {
    public ParametroZeroException(String message) {
        super(message);
    }
}

class Classe1 { 
    private static int x = 3;  
    private int y = 2; 
    public static void setX(int i) { x = i; } 
    public void setY(int i) { y = i; } 
    public static int getX() { return x; }      
    public int getY() { return y; } 
    public int function(int x) { return (this.x * y); }   
} 

// modifique o código  de  Classe2  na  primeira  questão  para  que 
// essa  exceção  que  você  criou  seja levantada quando o parâmetro passado 
// para function2 for igual a zero.

class Classe2 extends Classe1 { 
    public int function(int x) { return (getX() + getY() + x); } 
    public String function2(int x) throws ParametroZeroException { 
        if (x == 0) {
            throw new ParametroZeroException("Parâmetro zero não permitido");
        }
        return "Hello"; 
    } 
}