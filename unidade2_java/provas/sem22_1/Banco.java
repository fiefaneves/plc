package unidade2_java.provas.sem22_1;

class Pessoa {
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
}

class PessoaFisica extends Pessoa {
    private String cpf;

    public PessoaFisica(String nome, String endereco, String cpf) {
        super(nome, endereco);
        this.cpf = cpf;
    }

    public String getCpf() {
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

    public String getCnpj() {
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
        Pessoa pessoa = new Pessoa("João Silva", "Rua das Flores, 123");
        Conta conta = new Conta("12345-6", 1000.0);

        System.out.println("Cliente: " + pessoa.getNome());
        System.out.println("Endereço: " + pessoa.getEndereco());
        System.out.println("Número da conta: " + conta.getNumero());
        System.out.println("Saldo inicial: R$" + conta.getSaldo());

        conta.creditar(500.0);
        System.out.println("Saldo após crédito: R$" + conta.getSaldo());

        conta.debitar(200.0);
        System.out.println("Saldo após débito: R$" + conta.getSaldo());

        conta.debitar(1500.0); // Teste de saldo insuficiente
        conta.creditar(-100); // Teste de crédito inválido

        PessoaFisica pf = new PessoaFisica("Maria Oliveira", "Avenida Central, 456", "123.456.789-00");
        System.out.println("Pessoa Física: " + pf.getNome() + ", CPF: " + pf.getCpf());

        PessoaJuridica pj = new PessoaJuridica("Empresa XYZ", "Rua do Comércio, 789", "12.345.678/0001-99");
        System.out.println("Pessoa Jurídica: " + pj.getNome() + ", CNPJ: " + pj.getCnpj());        
    }
}