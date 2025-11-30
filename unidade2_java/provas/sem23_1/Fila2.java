package unidade2_java.provas.sem23_1;

import java.util.Enumeration;
import java.util.NoSuchElementException;

// b) implemente as alterações necessárias no código para termos uma versão dele
//usando generics, de forma que esse mesmo código possa funcionar para termos Filas de
// Integer, Boolean, Character, Double ou de objetos de qualquer outra classe.

public class Fila2 <T> implements Enumeration<T> {
    private T[] dados;
    private int primeiro, ultimo;
    
    @SuppressWarnings("unchecked")
    public Fila2(){
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

    @Override
    public boolean hasMoreElements() {
        return primeiro < ultimo;
    }

    @Override
    public T nextElement() {
        if (!hasMoreElements()) {
            throw new NoSuchElementException("Não há mais elementos na fila.");
        }
        return dados[primeiro++];
    }
    public static void main(String[] args) {
        Fila2<Integer> filaInteiros = new Fila2<>();
        Fila2<String> filaStrings = new Fila2<>();

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

        System.out.println("\n--- Testando Fila com a interface Enumeration ---");
        Fila2<Character> filaEnumeration = new Fila2<>();
        filaEnumeration.insere('A');
        filaEnumeration.insere('B');
        filaEnumeration.insere('C');

        // Itera sobre a fila usando os métodos da interface Enumeration
        while (filaEnumeration.hasMoreElements()) {
            System.out.println("Elemento obtido via nextElement(): " + filaEnumeration.nextElement());
        }

        // Testa a exceção para quando não há mais elementos
        try {
            filaEnumeration.nextElement();
        } catch (NoSuchElementException e) {
            System.out.println("Exceção capturada com sucesso: " + e.getMessage());
        }
    }
}