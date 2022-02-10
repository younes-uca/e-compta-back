package stage.sir.gestioncomptabilite.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.web.multipart.MultipartFile;
import stage.sir.gestioncomptabilite.bean.*;

import javax.persistence.ManyToOne;
import java.util.Date;

public class FactureVo {

    private String libelle;
    private double montantHorsTaxe;
    private Date dateOperation;
    private TypeOperationFacture typeOperation;
    private Date dmax;
    private Date dmin;
    private String reference;
    private MultipartFile factureFile;
    private Tva tva;
    private EtatFacture etatFacture;
    private EtatPaiement etatPaiement;
    private Societe societeSource;
    private Societe societeDistination;
    private CompteComptable compteComptable;

    public CompteComptable getCompteComptable() {
        return compteComptable;
    }

    public void setCompteComptable(CompteComptable compteComptable) {
        this.compteComptable = compteComptable;
    }

    public Tva getTva() {
        return tva;
    }

    public void setTva(Tva tva) {
        this.tva = tva;
    }

    public EtatFacture getEtatFacture() {
        return etatFacture;
    }

    public void setEtatFacture(EtatFacture etatFacture) {
        this.etatFacture = etatFacture;
    }

    public EtatPaiement getEtatPaiement() {
        return etatPaiement;
    }

    public void setEtatPaiement(EtatPaiement etatPaiement) {
        this.etatPaiement = etatPaiement;
    }

    public Societe getSocieteSource() {
        return societeSource;
    }

    public void setSocieteSource(Societe societeSource) {
        this.societeSource = societeSource;
    }

    public Societe getSocieteDistination() {
        return societeDistination;
    }

    public void setSocieteDistination(Societe societeDistination) {
        this.societeDistination = societeDistination;
    }

    public String getReference() {
        return reference;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public double getMontantHorsTaxe() {
        return montantHorsTaxe;
    }

    public void setMontantHorsTaxe(double montantHorsTaxe) {
        this.montantHorsTaxe = montantHorsTaxe;
    }

    public Date getDateOperation() {
        return dateOperation;
    }

    public void setDateOperation(Date dateOperation) {
        this.dateOperation = dateOperation;
    }


    public TypeOperationFacture getTypeOperation() {
        return typeOperation;
    }

    public void setTypeOperation(TypeOperationFacture typeOperation) {
        this.typeOperation = typeOperation;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    private double totaldebit;
    private double totalcredit ;

    public Date getDmax() {
        return dmax;
    }

    public void setDmax(Date dmax) {
        this.dmax = dmax;
    }

    public Date getDmin() {
        return dmin;
    }

    public void setDmin(Date dmin) {
        this.dmin = dmin;
    }

    public double getTotaldebit() {
        return totaldebit;
    }

    public void setTotaldebit(double totaldebit) {
        this.totaldebit = totaldebit;
    }

    public double getTotalcredit() {
        return totalcredit;
    }

    public void setTotalcredit(double totalcredit) {
        this.totalcredit = totalcredit;
    }

    public MultipartFile getFactureFile() {
        return factureFile;
    }

    public void setFactureFile(MultipartFile factureFile) {
        this.factureFile = factureFile;
    }
}