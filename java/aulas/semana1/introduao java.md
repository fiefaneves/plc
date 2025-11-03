# Conceitos Introdutórios de Java

## Tipos Estáticos (Statically Typed)
- Java é uma linguagem fortemente tipada
- Todas as variáveis precisam ter tipo declarado
- O tipo não pode mudar durante a execução

## Orientação a Objetos
- Quase tudo em Java é um objeto
- Por exemplo, para fazer um "Hello Word!", temos que criar uma classe
- Exceção: tipos primitivos (int, boolean, etc.)

## Tipos de Dados
### Primitivos
- byte, short, int, long
- float, double
- boolean
- char

### Tipos Referência
- Classes
- Arrays
- Interfaces

## Classes
- Unidade básica de organização
- Classes públicas devem estar em arquivos com mesmo nome
- Uma classe por arquivo quando pública

## Modificador Static
- Membros estáticos pertencem à classe, não aos objetos
- Podem ser acessados sem instanciar objetos
- Útil para utilitários e constantes
- É o que temos de mais próximo de uma função em C/C++

## Alocação de memória
- Tipos primitivos são alocados na pilha (stack)
- Objetos são alocados no heap
- Garbage Collector gerencia memória automaticamente
- Referências são armazenadas na pilha
- Não é necessário liberar memória manualmente

## Estruturas Básicas
### Condicionais
```java
if (condição) {
    // código
} else {
    // código
}
```

### Loops
```java
for (int i = 0; i < 10; i++) {
    // código
}

while (condição) {
    // código
}
```

### Arrays
```java
int[] numeros = new int[10];
String[] nomes = {"João", "Maria"};
```