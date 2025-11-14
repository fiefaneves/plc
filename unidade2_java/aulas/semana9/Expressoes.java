package unidade2_java.aulas.semana9;

/*
       Expressão
           |
    -----------------
    |               |
  Valor      Expressão Binária
                    |
            -------------------
            |                 |
          Soma              Mult        
*/

public class Expressoes {
    public static void main(String[] args) {
        Expressao exp = new Soma(new Valor(42), new Mult(new Valor(10), new Valor(3)));
        if (exp instanceof Soma) {
            Soma sum = (Soma) exp;
            System.out.println(sum.avaliar()); 
        }
        System.out.println(exp);

        //System.out.println(new Soma(new Valor(42), new Mult(new Valor(10), new Valor(3))));
        //System.out.println(new Soma(new Valor(42), new Mult(new Valor(10), new Valor(3))).avaliar());
    }
}

class Expressao {
    public String toString() {
        return "Expressao";
    }
    // se tivesse `final` aqui nao poderia ser sobrescrito nas subclasses
    // final public int avaliar() {
    public int avaliar() {
        return 0;
    }
}

// Valor é uma subclasse de Expressao
// Valor herda/estende Expressao
// expressao é a superclasse de Valor
class Valor extends Expressao {
    protected int valor;
    Valor (int valor) {
        this.valor = valor;
    }

    public int avaliar() {
        return this.valor;
    }

    public String toString() {
        //return "" + this.valor;
        return Integer.toString(this.valor);
    }
}

class ExpressaoBinaria extends Expressao {
    protected Expressao esquerda;
    protected Expressao direita;

    ExpressaoBinaria(Expressao esquerda, Expressao direita) {
        this.esquerda = esquerda;
        this.direita = direita;
    }
}

// em java uma classe so pode ter uma superclasse
// Soma é subclasse de ExpressaoBinaria entao é tambem subclasse de Expressao
class Soma extends ExpressaoBinaria {
    Soma(Expressao esquerda, Expressao direita) {
        super(esquerda, direita);
    }

    public int avaliar() {
        return this.esquerda.avaliar() + this.direita.avaliar();
    }

    public String toString() {
        return "(" + this.esquerda.toString() + " + " + this.direita.toString() + ")";
    }
}

class Mult extends ExpressaoBinaria {
    Mult(Expressao esquerda, Expressao direita) {
        super(esquerda, direita);
    }

    public int avaliar() {
        return this.esquerda.avaliar() * this.direita.avaliar();
    }

    public String toString() {
        return "(" + this.esquerda.toString() + " * " + this.direita.toString() + ")";
    }
}