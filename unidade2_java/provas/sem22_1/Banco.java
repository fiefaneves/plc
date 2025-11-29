package unidade2_java.provas.sem22_1;
abstract class Pessoa {
    private String nome;
    private String endereco;

    public Pessoa(String nome, String endereco) {
        this.nome = nome;
        this.endereco = endereco;
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

    // Método abstrato para obter o documento (CPF ou CNPJ)
    public abstract String getDocumento();
}

class PessoaFisica extends Pessoa {
    private String cpf;

    public PessoaFisica(String nome, String endereco, String cpf) {
        super(nome, endereco);
        this.cpf = cpf;
    }

    @Override
    public String getDocumento() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
}

class PessoaJuridica extends Pessoa {
    private String cnpj;

    public PessoaJuridica(String nome, String endereco, String cnpj) {
        super(nome, endereco);
        this.cnpj = cnpj;
    }

    @Override
    public String getDocumento() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
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

public class Banco {
    public static void main(String[] args) {
        PessoaFisica pf = new PessoaFisica("Maria Oliveira", "Avenida Central, 456", "123.456.789-00");
        PessoaJuridica pj = new PessoaJuridica("Empresa XYZ", "Rua do Comércio, 789", "12.345.678/0001-99");

        Conta contaPf = new Conta("12345-6", 1000.0);
        Conta contaPj = new Conta("98765-4", 5000.0);

        System.out.println("Pessoa Física: " + pf.getNome() + ", CPF: " + pf.getDocumento());
        System.out.println("Conta PF: " + contaPf.getNumero() + ", Saldo: R$" + contaPf.getSaldo());

        System.out.println("Pessoa Jurídica: " + pj.getNome() + ", CNPJ: " + pj.getDocumento());
        System.out.println("Conta PJ: " + contaPj.getNumero() + ", Saldo: R$" + contaPj.getSaldo());

        contaPf.creditar(500.0);
        System.out.println("Saldo PF após crédito: R$" + contaPf.getSaldo());

        contaPj.debitar(1000.0);
        System.out.println("Saldo PJ após débito: R$" + contaPj.getSaldo());        
    }
}