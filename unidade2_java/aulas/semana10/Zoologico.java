package unidade2_java.aulas.semana10;

public class Zoologico {
    
    static public void vida(Animal a) {
        a.nasce();
        a.come();
        a.dorme();
        a.emiteSom();
        System.out.println("Peso do animal: " + a.getPeso() + " kg");
        System.out.println("---------------------------");
    }

    /*
    static public void fazFuncionar() {
        Zebra z1 = new Zebra(250.0);
        Animal z2 = (Animal) new Zebra(300.0);
        Morcego m1 = new Morcego(1.5);
        Ornitorrinco o1 = new Ornitorrinco(5.0);

        vida(z1);
        vida(z2);
        vida(m1);
        vida(o1);
        z1.contaListras();
        //z2.contaListras(); --> nao compila
    }
    */

    // refatorado
    static public void fazFuncionar() {
        Animal[] animais = new Animal[4];
        animais[0] = new Zebra(250.0);
        animais[1] = new Zebra(300.0);
        animais[2] = new Morcego(1.5);
        animais[3] = new Ornitorrinco(5.0);

        for (Animal a : animais) {
            vida(a);
        }

        // Acessando o método específico de Zebra
        if (animais[0] instanceof Zebra) {
            Zebra z = (Zebra) animais[0];
            z.contaListras();
        }
    }
}

class TestaZoologico {
    public static void main(String[] args) {
        Zoologico.fazFuncionar();
    }
}