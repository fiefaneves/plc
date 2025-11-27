package unidade2_java.lista;

interface Transporte {
    double calcularValor();
    String tempoDeViagem();
}

class Viagem implements Transporte {
    private String destino;
    private double distanciaEmKm;
    private double precoBase; //valor minimo da viagem

    public Viagem(String destino, double distanciaEmKm, double precoBase) {
        this.destino = destino;
        this.distanciaEmKm = distanciaEmKm;
        this.precoBase = precoBase;
    }

    public String getDestino() {
        return destino;
    }

    public double getDistanciaEmKm() {
        return distanciaEmKm;
    }

    public double getPrecoBase() {
        return precoBase;
    }

    @Override
    public double calcularValor() {
        return precoBase;
    }

    @Override
    public String tempoDeViagem() {
        return "Tempo desconhecido";
    }
}

class Onibus extends Viagem {
    public Onibus(String destino, double distanciaEmKm, double precoBase) {
        super(destino, distanciaEmKm, precoBase);
    }

    @Override
    public double calcularValor() {
        return getPrecoBase() + (getDistanciaEmKm() * 0.30);
    }

    @Override
    public String tempoDeViagem() {
        int tempo = (int) Math.ceil(getDistanciaEmKm() / 80);
        return tempo + " horas";
    }
}

class Aviao extends Viagem {
    public Aviao(String destino, double distanciaEmKm, double precoBase) {
        super(destino, distanciaEmKm, precoBase);
    }

    @Override
    public double calcularValor() {
        return getPrecoBase() + (getDistanciaEmKm() * 1.00);
    }

    @Override
    public String tempoDeViagem() {
        double tempo = Math.round((getDistanciaEmKm() / 800) * 10.0) / 10.0;
        return tempo + " horas";
    }
}

class Carro extends Viagem {
    public Carro(String destino, double distanciaEmKm, double precoBase) {
        super(destino, distanciaEmKm, precoBase);
    }

    @Override
    public double calcularValor() {
        return getPrecoBase() + (getDistanciaEmKm() * 0.50);
    }

    @Override
    public String tempoDeViagem() {
        int tempo = (int) Math.ceil(getDistanciaEmKm() / 100);
        return tempo + " horas";
    }
}

public class ViagemPraia {
    public static void main(String[] args) {
        Viagem onibus = new Onibus("Salvador", 900, 50);
        Viagem aviao = new Aviao("Salvador", 900, 200);
        Viagem carro = new Carro("Salvador", 900, 100);

        System.out.println("Transporte: Ônibus");
        System.out.println("Destino: " + onibus.getDestino());
        System.out.println("Preço da viagem: R$" + onibus.calcularValor());
        System.out.println("Tempo estimado: " + onibus.tempoDeViagem());
        System.out.println();

        System.out.println("Transporte: Avião");
        System.out.println("Destino: " + aviao.getDestino());
        System.out.println("Preço da viagem: R$" + aviao.calcularValor());
        System.out.println("Tempo estimado: " + aviao.tempoDeViagem());
        System.out.println();

        System.out.println("Transporte: Carro");
        System.out.println("Destino: " + carro.getDestino());
        System.out.println("Preço da viagem: R$" + carro.calcularValor());
        System.out.println("Tempo estimado: " + carro.tempoDeViagem());
    }
}
