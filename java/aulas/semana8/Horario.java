package java.aulas.semana1;

import java.util.ArrayList; //nome do tipo precedido pelos pacotes

public class Horario {

    int horas;
    int minutos;
    int segundos;

    public String toString() {
        return horas + ":" + minutos + ":" + segundos;
    }

    Horario() {}

    Horario(int horas, int minutos, int segundos) {
        this.horas = horas;
        this.minutos = minutos;
        this.segundos = segundos;
    }

    Horario(int horas, int minutos) {
        this.horas = horas;
        this.minutos = minutos;
        this.segundos = 0;
    }

    public static void main(String[] args) {
        Horario horario = new Horario();
        horario.horas = 14;
        horario.minutos = 30;
        horario.segundos = 45;

        System.out.println("Horario atual: " + horario); // equivalente a horario.toString()
    
        Horario horario1 = new Horario();
        Horario horario2 = new Horario(10, 15);
        Horario horario3 = new Horario(9, 45, 30);

        // criar uma lista de horarios
        // pacotes java.util
        // podemos substituir java.util.ArrayList por ArrayList se importarmos o pacote no inicio do arquivo
        // java.util.ArrayList<Horario> horarios = new java.util.ArrayList<Horario>();
        ArrayList<Horario> horarios = new ArrayList<Horario>();
        horarios.add(horario1);
        horarios.add(horario2);
        horarios.add(horario3);
        System.out.println("Numero de horarios na lista: " + horarios.size());
        //printar horarios pela lista
        for (Horario h : horarios) {
            System.out.println(h);
        }

    }
}