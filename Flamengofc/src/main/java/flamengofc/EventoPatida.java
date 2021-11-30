package flamengofc;
public class EventoPatida {
    private String tipoeventopartida;
    private Atleta atletaenvolvido;

    public String getTipoeventopartida() {
        return tipoeventopartida;
    }

    public void setTipoeventopartida(String tipoeventopartida) {
        this.tipoeventopartida = tipoeventopartida;
    }

    public Atleta getAtletaenvolvido() {
        return atletaenvolvido;
    }

    public void setAtletaenvolvido(Atleta atletaenvolvido) {
        this.atletaenvolvido = atletaenvolvido;
    }

    public EventoPatida(String tipoeventopartida, Atleta atletaenvolvido) {
        this.tipoeventopartida = tipoeventopartida;
        this.atletaenvolvido = atletaenvolvido;
    }
    
}
