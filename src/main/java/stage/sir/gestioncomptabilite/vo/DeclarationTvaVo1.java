package stage.sir.gestioncomptabilite.vo;

public class DeclarationTvaVo1 {
    private String societeref;
    private String typedeclarationtva;
    private double annee;
    private double trim;
    private double mois;
    private String refDemande;


    public String getRefDemande() {
        return this.refDemande;
    }

    public void setRefDemande(String refDemande) {
        this.refDemande = refDemande;
    }

    public String getSocieteref() {
        return societeref;
    }

    public void setSocieteref(String societeref) {
        this.societeref = societeref;
    }

    public String getTypedeclarationtva() {
        return typedeclarationtva;
    }

    public void setTypedeclarationtva(String typedeclarationtva) {
        this.typedeclarationtva = typedeclarationtva;
    }

    public double getAnnee() {
        return annee;
    }

    public void setAnnee(double annee) {
        this.annee = annee;
    }

    public double getTrim() {
        return trim;
    }

    public void setTrim(double trim) {
        this.trim = trim;
    }

    public double getMois() {
        return mois;
    }

    public void setMois(double mois) {
        this.mois = mois;
    }
}
