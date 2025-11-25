package unidade2_java.aulas.semana10;

interface Voador {
    void voa();
    void pousa();
}

interface Transportador {
    void carregaPassageiros();
    void descarregaPassageiros();
}

public class Aviao implements Voador, Transportador {
    @Override
    public void voa() {
        System.out.println("O avião está voando.");
    }

    @Override
    public void pousa() {
        System.out.println("O avião está pousando.");
    }

    @Override
    public void carregaPassageiros() {
        System.out.println("O avião está carregando passageiros.");
    }

    @Override
    public void descarregaPassageiros() {
        System.out.println("O avião está descarregando passageiros.");
    }

}

class TestaAviao {
    public static void main(String[] args) {
        Aviao aviao = new Aviao();
        aviao.carregaPassageiros();
        aviao.voa();
        aviao.pousa();
        aviao.descarregaPassageiros();
    }
}