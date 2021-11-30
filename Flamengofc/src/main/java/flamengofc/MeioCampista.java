
package flamengofc;

import java.util.Date;

public class MeioCampista extends Atleta {
     private Atleta numeroassistencia;
     private Atleta numeropasses;
     private Atleta numeropasseserrdos; 

    public MeioCampista(Atleta numeroassistencia, Atleta numeropasses, Atleta numeropasseserrdos, int numerocamiseta, String nome, float salariomensal, Date dataadmissaoclub, int cartoesamarelos, int cartoesvermelhos, int numerofaltas) {
        super(numerocamiseta, nome, salariomensal, dataadmissaoclub, cartoesamarelos, cartoesvermelhos, numerofaltas);
        this.numeroassistencia = numeroassistencia;
        this.numeropasses = numeropasses;
        this.numeropasseserrdos = numeropasseserrdos;
    }

    public Atleta getNumeroassistencia() {
        return numeroassistencia;
    }

    public void setNumeroassistencia(Atleta numeroassistencia) {
        this.numeroassistencia = numeroassistencia;
    }

    public Atleta getNumeropasses() {
        return numeropasses;
    }

    public void setNumeropasses(Atleta numeropasses) {
        this.numeropasses = numeropasses;
    }

    public Atleta getNumeropasseserrdos() {
        return numeropasseserrdos;
    }

    public void setNumeropasseserrdos(Atleta numeropasseserrdos) {
        this.numeropasseserrdos = numeropasseserrdos;
    }
    
}
