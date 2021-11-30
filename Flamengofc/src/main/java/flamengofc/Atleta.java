
package flamengofc;

import java.util.Date;

public class Atleta {
    
    
    private float numerocamiseta;
    private String nome;
    private float salariomensal;
    private Date dataadmissaoclub;
    private float cartoesamarelos;
    private float cartoesvermelhos;
    private float numerofaltas;

    public Atleta(int numerocamiseta, String nome, float salariomensal, Date dataadmissaoclub, int cartoesamarelos, int cartoesvermelhos, int numerofaltas) {
        this.numerocamiseta = numerocamiseta;
        this.nome = nome;
        this.salariomensal = salariomensal;
        this.dataadmissaoclub = dataadmissaoclub;
        this.cartoesamarelos = cartoesamarelos;
        this.cartoesvermelhos = cartoesvermelhos;
        this.numerofaltas = numerofaltas;
    }
     


    public float getNumerocamiseta() {
        return numerocamiseta;
    }

    public void setNumerocamiseta(int numerocamiseta) {
        this.numerocamiseta = numerocamiseta;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public float getSalariomensal() {
        return salariomensal;
    }

    public void setSalariomensal(float salariomensal) {
        this.salariomensal = salariomensal;
    }

    public Date getDataadmissaoclub() {
        return dataadmissaoclub;
    }

    public void setDataadmissaoclub(Date dataadmissaoclub) {
        this.dataadmissaoclub = dataadmissaoclub;
    }

    public float getCartoesamarelos() {
        return cartoesamarelos;
    }

    public void setCartoesamarelos(int cartoesamarelos) {
        this.cartoesamarelos = cartoesamarelos;
    }

    public float getCartoesvermelhos() {
        return cartoesvermelhos;
    }

    public void setCartoesvermelhos(int cartoesvermelhos) {
        this.cartoesvermelhos = cartoesvermelhos;
    }

    public float getNumerofaltas() {
        return numerofaltas;
    }

    public void setNumerofaltas(int numerofaltas) {
        this.numerofaltas = numerofaltas;
    }
    
}
