package unidade2_java.provas.sem22_1;

enum TipoPessoa {
    FISICA,
    JURIDICA
}

class Pessoa {
    private String nome;
    private String endereco;
    private TipoPessoa tipo;
    private String documento;

    public Pessoa(String nome, String endereco, TipoPessoa tipo, String documento) {
        this.nome = nome;
        this.endereco = endereco;
        this.tipo = tipo;
        this.documento = documento;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public TipoPessoa getTipo() {
        return tipo;
    }

    public void setTipo(TipoPessoa tipo) {
        this.tipo = tipo;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }
}

class Conta {
    private String numero;
    private double saldo;

    public Conta(String numero, double saldoInicial) {
        this.numero = numero;
        this.saldo = saldoInicial;
    }

    public String getNumero() {
        return numero;
    }

    public double getSaldo() {
        return saldo;
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
}

public class Banco_Q3 {
    public static void main(String[] args) {
        Pessoa pessoafisica = new Pessoa("João Silva", "Rua das Flores, 123", TipoPessoa.FISICA, "123.456.789-00");
        Pessoa pessoajuridica = new Pessoa("João Silva", "Rua das Flores, 123", TipoPessoa.JURIDICA, "12.345.678/0001-00");
        Conta contapf = new Conta("12345-6", 1000.0);
        Conta contapj = new Conta("65432-1", 5000.0);

        System.out.println("Pessoa Física: " + pessoafisica.getNome() + ", Documento: " + pessoafisica.getDocumento());
        System.out.println("Pessoa Jurídica: " + pessoajuridica.getNome() + ", Documento: " + pessoajuridica.getDocumento());
        // creditar e debitar em suas respectivas contas
        contapf.creditar(500.0);
        System.out.println("Saldo Pessoa Física após crédito: R$" + contapf.getSaldo());
        contapj.debitar(1000.0);
        System.out.println("Saldo Pessoa Jurídica após débito: R$" + contapj.getSaldo());         

    }
}