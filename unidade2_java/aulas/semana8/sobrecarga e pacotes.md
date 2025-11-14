# Sobrecarga e Pacotes

## Sobrecarga (Overloading)
- Sobrecarga é ter vários métodos (ou construtores) com o mesmo nome, mas assinaturas diferentes (número, tipo ou ordem dos parâmetros).
- Regras principais:
    - Assinatura = nome + lista de parâmetros. Tipo de retorno não faz parte da assinatura — não é possível sobrecarregar apenas mudando o retorno.
    - Resolução em tempo de compilação (compile-time overload resolution).
    - Autoboxing, varargs e conversões podem afetar qual overload é escolhido; podem causar ambiguidade.
- Boas práticas:
    - Manter comportamento relacionado e coerente entre as variantes.
    - Evitar ambiguidade com varargs e tipos primitivos/Wrapper.
- Exemplo:
```java
public class MathUtils {
        public int sum(int a, int b) { return a + b; }
        public double sum(double a, double b) { return a + b; }
        public int sum(int... values) { 
                int s = 0; for (int v : values) s += v; 
                return s;
        }
}
```

## Pacotes (Packages)
- Pacotes agrupam classes e interfaces e definem namespace, facilitando organização e controle de acesso.
- Declaração: a primeira linha do arquivo fonte (se houver pacote):
```java
package com.exemplo.util;
```
- Convenção de nomes: nomes em minúsculas, geralmente baseado no domínio reverso (ex.: com.empresa.projeto).
- Importação:
    - `import pacote.Classe;` ou `import pacote.*;`
    - `import static` para membros estáticos: `import static java.lang.Math.PI;`
    - Imports são conveniência; você pode usar nomes qualificados: `java.util.List<String> l;`
- Controle de acesso relacionado a pacotes:
    - `public` — visível em qualquer pacote.
    - sem modificador (package-private) — visível apenas dentro do mesmo pacote.
    - `protected` — visível no mesmo pacote e em subclasses.
- Organização no sistema de arquivos:
    - Diretório deve refletir o pacote: `com/exemplo/util/MinhaClasse.java`
    - Classe pública deve estar em arquivo com mesmo nome da classe.
- Pequeno exemplo:
```java
// arquivo: src/com/exemplo/util/StringUtils.java
package com.exemplo.util;

public class StringUtils {
        public static boolean empty(String s) { return s == null || s.isEmpty(); }
}
```
```java
// outro arquivo
import com.exemplo.util.StringUtils;

public class App {
        public static void main(String[] args) {
                System.out.println(StringUtils.empty(""));
        }
}
```

Resumo final: sobrecarga permite múltiplas assinaturas com mesmo nome para conveniência e legibilidade; pacotes organizam código, controlam visibilidade e exigem correspondência com a estrutura de diretórios.