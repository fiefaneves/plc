package unidade2_java.lista;

class EnergiaIncompatívelException extends Exception {
    public EnergiaIncompatívelException(String message) {
        super(message);
    }
}

// Enum para tipos de energia
enum TipoEnergia {
    MANA,
    ESTAMINA
}

interface Restauracao {
    void restaurar(Personagem personagem, double quantidadeRecuperada) throws EnergiaIncompatívelException;
    void calcularDuracao(double quantidadeRecuperada);
}

class Personagem {
    double vidaAtual;
    double vidaMaxima;
    double energiaAtual;
    double energiaMaxima;
    TipoEnergia tipo;

    public Personagem(double vidaMaxima, double energiaMaxima, TipoEnergia tipo) {
        this.vidaMaxima = vidaMaxima;
        this.energiaMaxima = energiaMaxima;
        this.vidaAtual = vidaMaxima;
        this.energiaAtual = energiaMaxima;
        this.tipo = tipo;
    }

    public void setVidaAtual(double vidaAtual) {
        this.vidaAtual = Math.min(vidaAtual, vidaMaxima);
    }

    public void setEnergiaAtual(double energiaAtual) {
        this.energiaAtual = Math.min(energiaAtual, energiaMaxima);
    }

    public double getVidaAtual() {
        return vidaAtual;
    }

    public double getVidaMaxima() {
        return vidaMaxima;
    }

    public double getEnergiaAtual() {
        return energiaAtual;
    }

    public double getEnergiaMaxima() {
        return energiaMaxima;
    }
}

class Fogueira implements Restauracao {
    double eficiencia;

    public Fogueira(double eficiencia) {
        this.eficiencia = eficiencia;
    }

    @Override
    public void restaurar(Personagem personagem, double quantidadeRecuperada) {
        personagem.setVidaAtual(personagem.getVidaAtual() + quantidadeRecuperada);
    }

    @Override
    public void calcularDuracao(double quantidadeRecuperada) {
        double duracao = quantidadeRecuperada / eficiencia;
        System.out.println("Vida recuperada: " + quantidadeRecuperada + ", duração: " + duracao + " segundos");
    }
}

class FonteMagica implements Restauracao {
    double eficiencia;

    public FonteMagica(double eficiencia) {
        this.eficiencia = eficiencia;
    }

    @Override
    public void restaurar(Personagem personagem, double quantidadeRecuperada) throws EnergiaIncompatívelException {
        if (personagem.tipo != TipoEnergia.MANA) {
            throw new EnergiaIncompatívelException("Personagem não utiliza mana!");
        }
        personagem.setEnergiaAtual(personagem.getEnergiaAtual() + quantidadeRecuperada);
    }

    @Override
    public void calcularDuracao(double quantidadeRecuperada) {
        double duracao = quantidadeRecuperada / eficiencia;
        System.out.println("Mana recuperada: " + quantidadeRecuperada + ", duração: " + duracao + " segundos");
    }
}

class Acampamento implements Restauracao {
    double eficiencia;

    public Acampamento(double eficiencia) {
        this.eficiencia = eficiencia;
    }

    @Override
    public void restaurar(Personagem personagem, double quantidadeRecuperada) throws EnergiaIncompatívelException {
        if (personagem.tipo != TipoEnergia.ESTAMINA) {
            throw new EnergiaIncompatívelException("Personagem não utiliza estamina!");
        }
        personagem.setEnergiaAtual(personagem.getEnergiaAtual() + quantidadeRecuperada);
    }

    @Override
    public void calcularDuracao(double quantidadeRecuperada) {
        double duracao = quantidadeRecuperada / eficiencia;
        System.out.println("Estamina recuperada: " + quantidadeRecuperada + ", duração: " + duracao + " segundos");
    }
}

public class JavaSouls {
    public static void main(String[] args) {
        try {
            // Restauração de vida
            Personagem guerreiro = new Personagem(100, 50, TipoEnergia.ESTAMINA);
            Fogueira fogueira = new Fogueira(10);
            fogueira.restaurar(guerreiro, 30);
            fogueira.calcularDuracao(30);

            // Restauração de energia bem sucedido
            Personagem mago = new Personagem(80, 100, TipoEnergia.MANA);
            FonteMagica fonteMagica = new FonteMagica(20);
            fonteMagica.restaurar(mago, 40);
            fonteMagica.calcularDuracao(40);

            // Restauração de energia incompatível
            Acampamento acampamento = new Acampamento(15);
            acampamento.restaurar(mago, 20);
        } catch (EnergiaIncompatívelException e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}