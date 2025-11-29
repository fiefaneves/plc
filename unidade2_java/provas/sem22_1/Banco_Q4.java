package unidade2_java.provas.sem22_1;

enum Moeda {
    BRL(1.0), // Real Brasileiro
    USD(5.0); // Dólar Americano

    private final double taxaConversao;

    Moeda(double taxaConversao) {
        this.taxaConversao = taxaConversao;
    }

    public double getTaxaCambio() {
        return taxaConversao;
    }

    // Metodo para converter um valor de uma moeda para outra
    public double converter(Moeda destino, double valor) {
        if (this == destino) {
            return valor; // Mesma moeda, sem conversão
        }
        // Converter para Real e depois para a moeda de destino
        double valorEmReais = valor * this.taxaConversao;
        return valorEmReais / destino.getTaxaCambio();
    }
}

class ContaComMoeda {
    private String numero;
    private double saldo;
    private Moeda moeda;

    public ContaComMoeda(String numero, double saldoInicial, Moeda moeda) {
        this.numero = numero;
        this.saldo = saldoInicial;
        this.moeda = moeda;
    }

    public String getNumero() {
        return numero;
    }

    public double getSaldo() {
        return saldo;
    }

    public Moeda getMoeda() {
        return moeda;
    }

    public void creditar(double valor) {
        if (valor > 0) {
            saldo += valor;
        } else {
            System.out.println("Valor inválido para crédito.");
        }
    }

    public void debitar(double valor) {
        if (valor > 0 && valor <= getSaldo()) {
            saldo -= valor;
        } else {
            System.out.println("Saldo insuficiente ou valor inválido para débito.");
        }
    }

    public void transferir(ContaComMoeda destino, double valor) {
        if (valor > 0 && valor <= getSaldo()) {
            double valorConvertido = this.moeda.converter(destino.getMoeda(), valor);
            this.debitar(valor);
            destino.creditar(valorConvertido);
            System.out.printf("Transferência realizada: %.2f %s -> %.2f %s%n",
                valor, this.moeda, valorConvertido, destino.getMoeda());
        } else {
            System.out.println("Saldo insuficiente ou valor inválido para transferência.");
        }
    }
}

public class Banco_Q4 {
    public static void main(String[] args) {
        // Criar contas em moedas diferentes
        ContaComMoeda contaReal = new ContaComMoeda("12345-6", 1000.0, Moeda.BRL);
        ContaComMoeda contaDolar = new ContaComMoeda("98765-4", 200.0, Moeda.USD);

        System.out.println("Saldo inicial conta em Real: R$" + contaReal.getSaldo());
        System.out.println("Saldo inicial conta em Dólar: $" + contaDolar.getSaldo());

        // Transferir de Real para Dólar
        contaReal.transferir(contaDolar, 500.0);

        System.out.println("Saldo após transferência:");
        System.out.println("Conta em Real: R$" + contaReal.getSaldo());
        System.out.println("Conta em Dólar: $" + contaDolar.getSaldo());

        // Transferir de Dólar para Real
        contaDolar.transferir(contaReal, 50.0);

        System.out.println("Saldo após nova transferência:");
        System.out.println("Conta em Real: R$" + contaReal.getSaldo());
        System.out.println("Conta em Dólar: $" + contaDolar.getSaldo());
    }
}