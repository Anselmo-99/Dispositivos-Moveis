package flamengofc;

import java.util.Date;

public class Atacante extends MeioCampista {
    private MeioCampista numerogols;
    private MeioCampista numerofinalizaçoes;

    public Atacante(MeioCampista numerogols, MeioCampista numerofinalizaçoes, Atleta numeroassistencia, Atleta numeropasses, Atleta numeropasseserrdos, int numerocamiseta, String nome, float salariomensal, Date dataadmissaoclub, int cartoesamarelos, int cartoesvermelhos, int numerofaltas) {
        super(numeroassistencia, numeropasses, numeropasseserrdos, numerocamiseta, nome, salariomensal, dataadmissaoclub, cartoesamarelos, cartoesvermelhos, numerofaltas);
        this.numerogols = numerogols;
        this.numerofinalizaçoes = numerofinalizaçoes;
    }

    
    public MeioCampista getNumerogols() {
        return numerogols;
    }

    public void setNumerogols(MeioCampista numerogols) {
        this.numerogols = numerogols;
    }

    public MeioCampista getNumerofinalizaçoes() {
        return numerofinalizaçoes;
    }

    public void setNumerofinalizaçoes(MeioCampista numerofinalizaçoes) {
        this.numerofinalizaçoes = numerofinalizaçoes;
    }
    
}
