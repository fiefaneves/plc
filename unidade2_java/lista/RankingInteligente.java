package unidade2_java.lista;

class PontosInsuficientesException extends RuntimeException {
    public PontosInsuficientesException(String message) {
        super(message);
    }
}

class JogadorATP {
    private double pontos;
    private String nome;

    public JogadorATP(String nome) {
        this.pontos = 0;
        this.nome = nome;
    }

    public synchronized void adicionarPontos(double valor) {
        this.pontos += valor;
        System.out.println(Thread.currentThread().getName() + " adicionou " + valor + " pontos. Total agora: " + this.pontos);
    }

    public synchronized void removerPontos(double valor) {
        if (valor > this.pontos) {
            throw new PontosInsuficientesException("Pontos insuficientes para remover " + valor + " pontos. Total atual: " + this.pontos);
        }
        this.pontos -= valor;
        System.out.println(Thread.currentThread().getName() + " removeu " + valor + " pontos. Total agora: " + this.pontos);
    }

    public double getPontos() {
        return pontos;
    }
}

class AtualizacaoRanking extends Thread {
    private JogadorATP jogador;
    private boolean ehGanho;
    private double valor;

    public AtualizacaoRanking(JogadorATP jogador, boolean ehGanho, double valor) {
        this.jogador = jogador;
        this.ehGanho = ehGanho;
        this.valor = valor;
    }

    @Override
    public void run() {
        if (ehGanho) {
            jogador.adicionarPontos(valor);
        } else {
            try {
                jogador.removerPontos(valor);
            } catch (PontosInsuficientesException e) {
                System.out.println(Thread.currentThread().getName() + " falhou ao remover pontos: " + e.getMessage());
            }
        }
    }
}

public class RankingInteligente {
    public static void main(String[] args) {
        JogadorATP jogador = new JogadorATP("Nadal");
        jogador.adicionarPontos(100);

        Thread[] threads = new Thread[10];

        for (int i = 0; i < 5; i++) {
            threads[i] = new AtualizacaoRanking(jogador, true, 50);
        }
        for (int i = 5; i < 10; i++) {
            threads[i] = new AtualizacaoRanking(jogador, false, 30);
        }
        for (Thread thread : threads) {
            thread.start();
        }
        for (Thread thread : threads) {
            try {
                thread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println("Ranking final: " + jogador.getPontos() + " pontos.");
    }
}
