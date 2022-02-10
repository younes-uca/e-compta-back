package stage.sir.gestioncomptabilite.bean;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class TauxIsConfig {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String ref;
    private Double cotisationMinimale;
    private Date dateMin;
    private Date dateMax;
    @OneToMany(mappedBy = "tauxIsConfig")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private List<TauxIS> tauxISList;


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

    public List<TauxIS> getTauxISList() {
        return tauxISList;
    }

    public void setTauxISList(List<TauxIS> tauxISList) {
        this.tauxISList = tauxISList;
    }
}
