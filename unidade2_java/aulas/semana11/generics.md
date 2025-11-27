# Generics em Java

- O que são
    - Generics permitem parametrizar tipos (classes, interfaces, métodos) para aumentar segurança em tempo de compilação e evitar casts explícitos.

- Sintaxe básica
    - Declaração de classe genérica:
        ```java
        class Caixa<T> {
            private T valor;
            void set(T v) { valor = v; }
            T get() { return valor; }
        }
        ```
    - Método genérico:
        ```java
        static <T> T primeiro(T[] arr) { return arr.length>0 ? arr[0] : null; }
        ```

- Wildcards (coringas)
    - ? = qualquer tipo.
    - ? extends T = aceita T ou subtipos (leitura segura).
    - ? super T = aceita T ou supertypos (escrita segura).
    - Regra prática (PECS): Producer Extends, Consumer Super.

- Bounds (limites)
    - Bounded type parameters: `<T extends Number>` — restringe T a subtipos de Number.
    - Múltiplos bounds: `<T extends A & B>` (interfaces após a primeira).

- Inferência e operador diamante
    - Java infere tipos: `List<String> list = new ArrayList<>();`

- Type erasure
    - Informações genéricas são removidas em tempo de execução (erasure). Não há sobrecarga por tipo genérico nem runtime tipo parametrizado.

- Restrições importantes
    - Não é possível criar arrays de tipos genéricos (`new T[]` ou `new ArrayList<String>[10]`).
    - Não é possível instanciar parâmetro de tipo (`new T()`).
    - Não é possível usar instanceof com tipos parametrizados (`obj instanceof List<String>` é um erro).
    - Não há reified generics — reflexões têm limitações.

- Boas práticas
    - Prefira tipos genéricos em APIs públicas para evitar casts.
    - Use wildcards nos parâmetros quando fizer sentido (`List<? extends Number>` para leitura).
    - Evite raw types (List em vez de List<String>).

Exemplos rápidos:
```java
List<? extends Number> nums = List.of(1, 2.5); // leitura OK, add proibido
List<? super Integer> ints = new ArrayList<Number>();
ints.add(10); // OK
```
