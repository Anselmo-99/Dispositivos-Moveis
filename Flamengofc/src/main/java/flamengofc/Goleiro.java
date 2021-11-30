
package flamengofc;

import java.util.Date;

public class Goleiro extends Defensor {
    private Defensor numerodedefesas;
    Atleta Um=new Atleta(1,"Diego",3500f,1,1,0,0);

    public Goleiro(Defensor numerodedefesas, int numerocamiseta, String nome, float salariomensal, Date dataadmissaoclub, int cartoesamarelos, int cartoesvermelhos, int numerofaltas) {
        super(numerocamiseta, nome, salariomensal, dataadmissaoclub, cartoesamarelos, cartoesvermelhos, numerofaltas);
        this.numerodedefesas = numerodedefesas;
    }

            
    public Defensor getNumerodedefesas() {
        return numerodedefesas;
    }

    public void setNumerodedefesas(Defensor numerodedefesas) {
        this.numerodedefesas = numerodedefesas;
    }
    
}
