package unidade2_java.aulas.semana10;

import javax.management.RuntimeErrorException;

interface RepositorioContas {
    void inserir(ContaAbstrata conta);
    ContaAbstrata procurar(String numero);
    void remover(String numero);
    void atualizar(ContaAbstrata conta);
    boolean existe(String numero);
}

public class Banco {
    private RepositorioContas contas;

    public Banco(RepositorioContas repositorio) {
        this.contas = repositorio;
    }

    public void abrirConta(ContaAbstrata conta) {
        String numero = conta.getNumero();
        if (!contas.existe(numero)) {
            contas.inserir(conta);
        } else {
            throw new RuntimeErrorException(null, "Conta já cadastrada!");
        }
    }
}
