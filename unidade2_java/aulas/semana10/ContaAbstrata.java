package unidade2_java.aulas.semana10;

public abstract class ContaAbstrata {
    public String numero;
    public double saldo;

    public ContaAbstrata(String numero) {
        this.numero = numero;
        this.saldo = 0.0;
    };

    public void creditar(double valor) {
        this.saldo += valor;
    };
    public double getSaldo() {
        return this.saldo;
    };
    protected void setSaldo(double saldo) {
        this.saldo = saldo;
    };
    public String getNumero() {
        return this.numero;
    };
    public abstract void debitar(double valor); // método abstrato -> sem implementação
}

class Conta extends ContaAbstrata {
    public Conta(String numero) {
        super(numero);
    };

    // Implementa a semântica de debitar da classe base
    public void debitar(double valor) {
        if (valor <= this.getSaldo()) {
            this.setSaldo(this.getSaldo() - valor);
        } else {
            System.out.println("Saldo insuficiente!");
        };
    };
}

class Poupanca extends Conta {
    public Poupanca(String numero) {
        super(numero);
    };

    public void renderJuros(double taxa) {
        double juros = this.getSaldo() * taxa;
        this.creditar(juros);
    };
}

class ContaEspecial extends Conta {
    public static final double TAXA = 0.01;
    public ContaEspecial(String numero) {
        super(numero);
    };

    public void creditar(double valor) {
        super.creditar(valor);
    };
}

class ContaImposto extends ContaAbstrata {
    private static final double CPMF = 0.01;

    public ContaImposto(String numero) {
        super(numero);
    };

    public void debitar(double valor) {
        double imposto = valor * CPMF;
        if (valor + imposto <= this.getSaldo()) {
            this.setSaldo(this.getSaldo() - (valor + imposto));
        } else {
            System.out.println("Saldo insuficiente!");
        };
    };
}
// Como muda semântica de debitar, quebra a noção de subtipagem/herança
/*
public class ContaImposto extends Conta {
    private static final double CPMF = 0.01;

    public ContaImposto(String numero) {
        super(numero);
    };

    public void debitar(double valor) {
        double imposto = valor * CPMF;
        super.debitar(valor + imposto);
    };
}
*/

//exemplo de uso
class TestaContas {
    public static void main(String[] args) {
        ContaAbstrata conta1, conta2;
        conta1 = new ContaEspecial("21.242-7");
        conta2 = new ContaImposto("34.567-8");
        conta1.creditar(1000.0);
        conta2.creditar(1000.0);
        conta1.debitar(100.0);
        conta2.debitar(100.0);
        System.out.println("Saldo conta especial: " + conta1.getSaldo());
        System.out.println("Saldo conta imposto: " + conta2.getSaldo());
    };
}