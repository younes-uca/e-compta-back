package stage.sir.gestioncomptabilite.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class Demande {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String ref;
    private String operation;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date dateDemande;
    private double annee;
    private Integer mois;
    private Integer trimestre;
    private boolean enableBtn;
    @ManyToOne
    private Societe societe;
    @ManyToOne
    private Comptable comptableTraiteur;
    @ManyToOne
    private Comptable comptableValidateur;
    @ManyToOne
    private EtatDemande etatDemande;
    @OneToMany(mappedBy="demande")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private List<Facture> factures;
    
    
    
 

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

    public Date getDateDemande() {
        return dateDemande;
    }

    public void setDateDemande(Date dateDemande) {
        this.dateDemande = dateDemande;
    }

    public String getOperation() { return operation; }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public double getAnnee() {
        return annee;
    }

    public void setAnnee(double annee) {
        this.annee = annee;
    }

    public Integer getMois() {
        return mois;
    }

    public void setMois(Integer mois) {
        this.mois = mois;
    }

    public Integer getTrimestre() {
        return trimestre;
    }

    public void setTrimestre(Integer trimestre) {
        this.trimestre = trimestre;
    }

    public Societe getSociete() {
        return societe;
    }

    public void setSociete(Societe societe) {
        this.societe = societe;
    }

    public Comptable getComptableTraiteur() {
        return comptableTraiteur;
    }

    public void setComptableTraiteur(Comptable comptableTraiteur) {
        this.comptableTraiteur = comptableTraiteur;
    }

    public Comptable getComptableValidateur() {
        return comptableValidateur;
    }

    public void setComptableValidateur(Comptable comptableValidateur) {
        this.comptableValidateur = comptableValidateur;
    }

    public EtatDemande getEtatDemande() {
        return etatDemande;
    }

    public void setEtatDemande(EtatDemande etatDemande) {
        this.etatDemande = etatDemande;
    }

    public boolean isEnableBtn() {
        return enableBtn;
    }

    public void setEnableBtn(boolean enableBtn) {
        this.enableBtn = enableBtn;
    }

    public List<Facture> getFactures() {
        return factures;
    }

    public void setFactures(List<Facture> factures) {
        this.factures = factures;
    }
}
