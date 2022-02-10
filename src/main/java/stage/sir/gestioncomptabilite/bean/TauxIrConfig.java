package stage.sir.gestioncomptabilite.bean;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class TauxIrConfig {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String ref;
    private Double cotisationMinimale;
    private Date dateMin;
    private Date dateMax;

    @OneToMany(mappedBy="tauxIrConfig")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private List<TauxIr> tauxIrList;


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

    public Double getCotisationMinimale() {
        return cotisationMinimale;
    }

    public void setCotisationMinimale(Double cotisationMinimale) {
        this.cotisationMinimale = cotisationMinimale;
    }

    public Date getDateMin() {
        return dateMin;
    }

    public void setDateMin(Date dateMin) {
        this.dateMin = dateMin;
    }

    public Date getDateMax() {
        return dateMax;
    }

    public void setDateMax(Date dateMax) {
        this.dateMax = dateMax;
    }

    public List<TauxIr> getTauxIrList() {
        return tauxIrList;
    }

    public void setTauxIrList(List<TauxIr> tauxIrList) {
        this.tauxIrList = tauxIrList;
    }
}
