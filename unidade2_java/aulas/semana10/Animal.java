package unidade2_java.aulas.semana10;

public interface Animal {
    // todos os metodos sao public e abstract por padrao
    void nasce();
    void come();
    void dorme();
    void emiteSom();
    double getPeso();    
}

class Morcego implements Animal {
    private double peso;

    public Morcego(double peso) {
        this.peso = peso;
    }

    @Override
    public void nasce() {
        System.out.println("O morcego nasceu.");
    }

    @Override
    public void come() {
        System.out.println("O morcego está comendo.");
    }

    @Override
    public void dorme() {
        System.out.println("O morcego está dormindo.");
    }

    @Override
    public void emiteSom() {
        System.out.println("O morcego emite sons de alta frequência.");
    }

    @Override
    public double getPeso() {
        return this.peso;
    }
}

class Zebra implements Animal {
    private double peso;

    public Zebra(double peso) {
        this.peso = peso;
    }

    @Override
    public void nasce() {
        System.out.println("A zebra nasceu.");
    }

    @Override
    public void come() {
        System.out.println("A zebra está comendo capim.");
    }

    @Override
    public void dorme() {
        System.out.println("A zebra está dormindo.");
    }

    @Override
    public void emiteSom() {
        System.out.println("A zebra relincha.");
    }

    @Override
    public double getPeso() {
        return this.peso;
    }

    public int contaListras() {
        return 80; // Exemplo fixo de número de listras
    }
}

class Ornitorrinco implements Animal {
    private double peso;

    public Ornitorrinco(double peso) {
        this.peso = peso;
    }

    @Override
    public void nasce() {
        System.out.println("O ornitorrinco nasceu.");
    }

    @Override
    public void come() {
        System.out.println("O ornitorrinco está comendo insetos.");
    }

    @Override
    public void dorme() {
        System.out.println("O ornitorrinco está dormindo.");
    }

    @Override
    public void emiteSom() {
        System.out.println("O ornitorrinco emite sons suaves.");
    }

    @Override
    public double getPeso() {
        return this.peso;
    }
}
