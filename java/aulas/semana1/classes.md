# Classes em Java

## O que é uma Classe?
Uma classe é um modelo ou template que define as características e comportamentos de um objeto. É a estrutura básica da Programação Orientada a Objetos em Java.

## Definindo uma Classe
```java
public class Carro {
    // corpo da classe
}
```

## Atributos e Métodos
### Atributos (Campos)
São as características/propriedades da classe:
```java
public class Carro {
    private String marca;
    private String modelo;
    private int ano;
}
```

### Métodos
São os comportamentos/ações da classe:
```java
public class Carro {
    private String marca;
    
    public void acelerar() {
        // código do método
    }
    
    public String getMarca() {
        return marca;
    }
}
```

## Construtores
### Construtor Padrão (sem parâmetros)
```java
public class Carro {
    public Carro() {
        // inicialização básica
    }
}
```

### Construtor com Parâmetros
```java
public class Carro {
    private String marca;
    
    public Carro(String marca) {
        this.marca = marca;
    }
}
```

## Instanciando Classes
Para criar um objeto a partir de uma classe:
```java
Carro meuCarro = new Carro();
Carro outroCarro = new Carro("Toyota");
```

## Visibilidade de Classes
### Public
- Classe pode ser acessada de qualquer lugar
```java
public class Carro {
    // código da classe
}
```

### Package-Private (default)
- Classe só pode ser acessada dentro do mesmo pacote
```java
class Carro {
    // código da classe
}
```

**Nota:** Classes em Java não podem ser declaradas como `private`, apenas membros internos podem ter essa visibilidade.