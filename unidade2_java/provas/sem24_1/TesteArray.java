package unidade2_java.provas.sem24_1;

public class TesteArray {
    public static <T> T[] trocaposicao(T v[], int x, int y) {
        T w = v[x];
        v[x] = v[y];
        v[y] = w;
        return v;
    }
}
