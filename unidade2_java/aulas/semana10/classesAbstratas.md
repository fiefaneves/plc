# Classes abstratas em Java

- Uma classe abstrata é uma classe que pode declarar métodos abstratos (sem implementação) e métodos concretos (com implementação). Serve como contrato parcial para subclasses.

- Sintaxe básica
```java
public abstract class Forma {
        private String cor;
        public Forma(String cor) { this.cor = cor; }
        public abstract double area(); // método abstrato
        public String getCor() { return cor; } // método concreto
}
```

- Regras importantes
    - Não é possível instanciar (new) uma classe abstrata.
    - Subclasses concretas devem implementar todos os métodos abstratos ou também ser declaradas abstract.
    - Métodos abstratos não podem ser static, final ou private.
    - A classe abstrata pode ter construtores, atributos, métodos estáticos, e blocos estáticos.
    - Pode implementar interfaces e definir métodos padrão/auxiliares compartilhados.

- Quando usar
    - Quando quiser definir comportamento comum e exigir que subclasses implementem detalhes específicos.
    - Para evitar duplicação de código e fornecer métodos utilitários/estado compartilhado.

- Diferença rápida entre abstract class e interface
    - Classe abstrata: pode ter estado (fields), construtores e métodos concretos; usado quando há forte relação "é-um" com comportamento compartilhado.
    - Interface: originalmente só assinaturas; desde Java 8 pode ter métodos default/static; usa-se para contratos múltiplos (implementação múltipla).

- Exemplo completo
```java
public abstract class Animal {
        public abstract void emitirSom();
        public void dormir() { System.out.println("Dormindo..."); }
}

public class Cachorro extends Animal {
        @Override
        public void emitirSom() { System.out.println("Au au"); }
}

public class Teste {
        public static void main(String[] args) {
                Animal a = new Cachorro();
                a.emitirSom(); // Au au
                a.dormir();
        }
}
```
