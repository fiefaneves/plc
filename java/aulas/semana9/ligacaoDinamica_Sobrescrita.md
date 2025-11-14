# Ligação dinâmica e sobrescrita em Java — resumo

## Conceitos
- Ligação dinâmica (dynamic binding) = escolha do método a executar é feita em tempo de execução com base no tipo real do objeto.
- Sobrescrita (overriding) = uma subclasse fornece implementação distinta para um método herdado da superclasse (mesma assinatura).

## Regras principais
- Ligação dinâmica aplica-se a métodos de instância (não estáticos).
- Método sobrescrito é chamado conforme o tipo real do objeto, não conforme o tipo da referência.
- Não é possível sobrescrever métodos `final` ou `private`. Métodos `static` são ocultos (method hiding), não sobrescritos.
- Usar `@Override` ajuda a detectar erros de assinatura.

## Exemplo
```java
class Animal {
    void falar() { System.out.println("Animal"); }
    static void info() { System.out.println("Info Animal"); }
}

class Cao extends Animal {
    @Override
    void falar() { System.out.println("Cão"); }
    static void info() { System.out.println("Info Cão"); } // hiding, não overriding
}

public class Test {
    public static void main(String[] args) {
        Animal a = new Cao();
        a.falar();    
        // output: "Cão"  — ligação dinâmica chama o método da classe real (Cao)
        a.info();     
        // output: "Info Animal" — static usa o tipo da referência (hiding)
    }
}
```

## Observações rápidas
- Sobrescrita permite polimorfismo de tempo de execução e designs flexíveis (por exemplo, padrões Strategy/Template).
- Verifique visibilidade: método sobrescrito deve ser público/protegido ao aumentar acesso, nunca mais restrito.
- Exceções: a assinatura e tipos de exceção devem ser compatíveis ao sobrescrever.
