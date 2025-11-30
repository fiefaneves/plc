package unidade2_java.provas.sem22_2;

abstract class Forma {
    public double posicaoX, posicaoY;

    public Forma(double x, double y) {
        this.posicaoX = x;
        this.posicaoY = y;
    }

    public abstract double area();

    public void mover(double deltaX, double deltaY) {
        this.posicaoX += deltaX;
        this.posicaoY += deltaY;
    }
}

public class Circulo extends Forma {
    private double raio;

    public Circulo(double x, double y, double raio) {
        super(x, y);
        this.raio = raio;
    }

    @Override
    public double area() {
        return Math.PI * raio * raio;
    }
}

class Retangulo extends Forma {
    private double lado1, lado2;

    public Retangulo(double x, double y, double lado1, double lado2) {
        super(x, y);
        this.lado1 = lado1;
        this.lado2 = lado2;
    }

    @Override
    public double area() {
        return lado1 * lado2;
    }
}