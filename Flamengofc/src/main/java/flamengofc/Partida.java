package flamengofc;

import java.util.Date;

public class Partida {
    private String nomeadversario;
    private Date datapartida;
    private String atlecasescalados;
    private String eventos;

    public Partida(String nomeadversario, Date datapartida, String atlecasescalados, String eventos) {
        this.nomeadversario = nomeadversario;
        this.datapartida = datapartida;
        this.atlecasescalados = atlecasescalados;
        this.eventos = eventos;
    }

    public String getNomeadversario() {
        return nomeadversario;
    }

    public void setNomeadversario(String nomeadversario) {
        this.nomeadversario = nomeadversario;
    }

    public Date getDatapartida() {
        return datapartida;
    }

    public void setDatapartida(Date datapartida) {
        this.datapartida = datapartida;
    }

    public String getAtlecasescalados() {
        return atlecasescalados;
    }

    public void setAtlecasescalados(String atlecasescalados) {
        this.atlecasescalados = atlecasescalados;
    }

    public String getEventos() {
        return eventos;
    }

    public void setEventos(String eventos) {
        this.eventos = eventos;
    }
    
}
