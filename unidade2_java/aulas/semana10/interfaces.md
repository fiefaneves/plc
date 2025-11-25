# Interfaces em Java

## O que é uma Interface?

Uma interface é um contrato que define um conjunto de métodos que uma classe deve implementar. É uma forma de estabelecer um padrão de comportamento.

## Características Principais

- **Abstração**: Define "o que fazer", não "como fazer"
- **Contrato**: Classes que implementam devem cumprir todos os métodos
- **Múltipla implementação**: Uma classe pode implementar várias interfaces
- **Sem estado**: Não pode ter variáveis de instância (apenas constantes)

## Sintaxe Básica

```java
public interface MinhaInterface {
    void metodo1();
    int metodo2(String param);
}

public class MinhaClasse implements MinhaInterface {
    @Override
    public void metodo1() {
        // implementação
    }
    
    @Override
    public int metodo2(String param) {
        return 0;
    }
}
```

## Recursos Modernos (Java 8+)

- **Métodos default**: Possuem implementação padrão
- **Métodos static**: Utilitários na interface
- **Métodos private**: Lógica auxiliar

## Benefícios

- Promove desacoplamento
- Facilita testes
- Permite polimorfismo
- Melhora a arquitetura do código
