package stage.sir.gestioncomptabilite.bean;

import javax.persistence.*;


@Entity
public class TauxIS {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String ref;
    private Double resultatFiscalMin;
    private Double resultatFiscalMax;
    private Double pourcentage;
    private Double penalite;
    @ManyToOne
    private TauxIsConfig tauxIsConfig;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public Double getResultatFiscalMin() {
        return resultatFiscalMin;
    }

    public void setResultatFiscalMin(Double resultatFiscalMin) {
        this.resultatFiscalMin = resultatFiscalMin;
    }

    public Double getResultatFiscalMax() {
        return resultatFiscalMax;
    }

    public void setResultatFiscalMax(Double resultatFiscalMax) {
        this.resultatFiscalMax = resultatFiscalMax;
    }

    public Double getPourcentage() {
        return pourcentage;
    }

    public void setPourcentage(Double pourcentage) {
        this.pourcentage = pourcentage;
    }

    public Double getPenalite() { return penalite; }

    public void setPenalite(Double penalite) { this.penalite = penalite; }

    public TauxIsConfig getTauxIsConfig() {
        return tauxIsConfig;
    }

    public void setTauxIsConfig(TauxIsConfig tauxIsConfig) {
        this.tauxIsConfig = tauxIsConfig;
    }
}
