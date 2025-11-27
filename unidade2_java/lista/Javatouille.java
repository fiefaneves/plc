package unidade2_java.lista;

class Ingrediente {
    private String nome;

    public Ingrediente(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

class Balcao {
    private String nome; // nome do balcão
    private int capacidade; // capacidade máxima de ingredientes
    private java.util.Queue<Ingrediente> filaIngredientes; // fila de ingredientes no balcão

    public Balcao(String nome, int capacidade) {
        this.nome = nome;
        this.capacidade = capacidade;
        this.filaIngredientes = new java.util.LinkedList<>();
    }

    public void colocar(Ingrediente ingrediente) throws InterruptedException {
        synchronized (this) {
            while (filaIngredientes.size() >= capacidade) {
                wait();
            }
            filaIngredientes.add(ingrediente);
            System.out.println("Ingrediente " + ingrediente.getNome() + " colocado no balcão " + nome);
            notifyAll();
        }
    }

    public void retirar() throws InterruptedException {
        synchronized (this) {
            while (filaIngredientes.isEmpty()) {
                wait();
            }
            Ingrediente ingrediente = filaIngredientes.poll();
            System.out.println("Ingrediente " + ingrediente.getNome() + " retirado do balcão " + nome);
            notifyAll();
        }
    }
}

class Aprendiz implements Runnable {
    private Balcao balcao;
    private int desempenho; // número de ingredientes preparados por iteração

    public Aprendiz(Balcao balcao, int desempenho) {
        this.balcao = balcao;
        this.desempenho = desempenho;
    }

    @Override
    public void run() {
        try {
            for (int i = 0; i < desempenho; i++) {
                Ingrediente ingrediente = new Ingrediente("Ingrediente-" + i);
                balcao.colocar(ingrediente);
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}

class Chefe implements Runnable {
    private Balcao balcao;
    private int desempenho; // número de ingredientes consumidos por iteração

    public Chefe(Balcao balcao, int desempenho) {
        this.balcao = balcao;
        this.desempenho = desempenho;
    }

    @Override
    public void run() {
        try {
            for (int i = 0; i < desempenho; i++) {
                balcao.retirar();
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}

public class Javatouille {
    public static void main(String[] args) {
        Runnable[] tasks = {
            () -> simulateScenario("Balcão Pequeno", 2, 5, 3),
            () -> simulateScenario("Balcão Grande", 5, 10, 4),
            () -> simulateScenario("Balcão Médio", 3, 4, 8)
        };

        for (Runnable task : tasks) {
            new Thread(task).start();
        }
    }

    private static void simulateScenario(String name, int capacity, int prod, int cons) {
        Balcao balcao = new Balcao(name, capacity);
        Thread[] threads = {
            new Thread(new Aprendiz(balcao, prod), "Aprendiz"),
            new Thread(new Chefe(balcao, cons), "Chefe")
        };

        for (Thread t : threads) {
            t.start();
        }
    }
}