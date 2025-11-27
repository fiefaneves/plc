# Exceções em Java

## O que são Exceções?
Exceções são eventos que ocorrem durante a execução de um programa e interrompem seu fluxo normal. Representam erros ou situações anômalas que podem ser tratadas.

## Hierarquia de Exceções
```
Throwable
├── Error (erros críticos)
└── Exception (exceções tratáveis)
    ├── Checked Exceptions (verificadas em tempo de compilação)
    └── Unchecked Exceptions (erros em tempo de execução)
```

## Tipos Principais

### Checked Exceptions
Devem ser tratadas ou declaradas com `throws`:
- `IOException`
- `SQLException`
- `FileNotFoundException`

### Unchecked Exceptions
Herdam de `RuntimeException`:
- `NullPointerException`
- `ArrayIndexOutOfBoundsException`
- `ArithmeticException`

## Tratamento com Try-Catch

```java
try {
    // código que pode gerar exceção
} catch (TipoExcecao e) {
    // tratamento
} finally {
    // sempre executado
}
```

## Lançando Exceções

```java
throw new Exception("Mensagem de erro");
```

## Boas Práticas
- Use exceções específicas
- Trate exceções no nível apropriado
- Use `finally` para limpeza de recursos
- Considere usar try-with-resources para recursos
