# Herança em Java

## Conceito
Herança permite que uma classe (subclasse/filha) reutilize atributos e métodos de outra classe (superclasse/pai). Promove reaproveitamento de código e modelagem hierárquica.

## Sintaxe básica
- Declaração: `class Filho extends Pai { ... }`
- Uma classe em Java estende no máximo uma classe concreta (herança simples).
- Interfaces podem ser múltiplas: `implements`.

## Principais características
- Reutilização de código: métodos e campos protegidos/public são acessíveis na subclasse.
- Sobrescrita (overriding): subclasse redefine método da superclasse (mesma assinatura).
- Chamada ao construtor da superclasse: `super(...)` deve ser a primeira linha do construtor.
- `super` também acessa métodos/atributos da superclasse.
- Polimorfismo: referência do tipo da superclasse pode apontar para instância da subclasse (upcasting).
- Downcasting requer cast explícito e pode lançar `ClassCastException`.

## Modificadores relevantes
- `private`: não herdado diretamente (mas existe na superclasse; não acessável).
- `protected`: acessível em subclasses e no mesmo pacote.
- `final class`: não pode ser estendida.
- `final method`: não pode ser sobrescrito.
- `abstract class`: pode declarar métodos abstratos que as subclasses devem implementar.

## Exemplo simples
```java
class Animal {
    protected String nome;
    Animal(String nome) { this.nome = nome; }
    void falar() { System.out.println("..."); }
}

class Cachorro extends Animal {
    Cachorro(String nome) { super(nome); }
    @Override
    void falar() { System.out.println(nome + " diz: Au!"); }
}
```

## Boas práticas e observações
- Prefira composição em vez de herança quando a relação não for "é um".
- Use herança para especialização, mantendo coesão.
- Evite hierarquias muito profundas.
- Documente contratos de métodos sobrescritos (comportamento e exceções).

## Palavras-chave úteis
extends, super, instanceof, final, abstract, @Override, implements
