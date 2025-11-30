package unidade2_java.provas.sem23_2;

public class Fila <T> {
    private T[] dados;
    private int primeiro, ultimo;
    
    @SuppressWarnings("unchecked")
    public Fila(){
        dados = (T[]) new Object[100];
    }

    public void insere(T valor) {
        dados[ultimo++] = valor;
    }

    public T remove() throws ExceptionFilaVazia {
        if (primeiro == ultimo) {
            throw new ExceptionFilaVazia("Fila vazia. Não é possível remover elementos.");
        }
        return dados[primeiro++];
    }
}

// a) implemente um método testaFila que crie duas filas de tipos diferentes
// e insira e remova elementos nelas;

class TestaFila {
    public static void main(String[] args) {
        Fila<Integer> filaInteiros = new Fila<>();
        Fila<String> filaStrings = new Fila<>();

        try {
            // Inserindo elementos na fila de inteiros
            filaInteiros.insere(10);
            filaInteiros.insere(20);
            filaInteiros.insere(30);

            // Removendo elementos da fila de inteiros
            System.out.println("Removido da fila de inteiros: " + filaInteiros.remove());
            System.out.println("Removido da fila de inteiros: " + filaInteiros.remove());

            // Inserindo elementos na fila de strings
            filaStrings.insere("Olá");
            filaStrings.insere("Mundo");

            // Removendo elementos da fila de strings
            System.out.println("Removido da fila de strings: " + filaStrings.remove());
            System.out.println("Removido da fila de strings: " + filaStrings.remove());
        } catch (ExceptionFilaVazia e) {
            System.out.println(e.getMessage());
        }
    }
}

// b) declare e implemente uma exceção ExceptionFilaVazia e modifique o código
// para que ela seja levantada quando se tentar remover algo da fila vazia 
// (i.e. quando os dois índices forem iguais).

class ExceptionFilaVazia extends Exception {
    public ExceptionFilaVazia(String mensagem) {
        super(mensagem);
    }
}