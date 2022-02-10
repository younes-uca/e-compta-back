package stage.sir.gestioncomptabilite.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TypeOperationFacture {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String libelle;
    private String typeOperationSociete;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getTypeOperationSociete() {
        return typeOperationSociete;
    }

    public void setTypeOperationSociete(String typeOperationSociete) {
        this.typeOperationSociete = typeOperationSociete;
    }
}
