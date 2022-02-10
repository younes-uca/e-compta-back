package stage.sir.gestioncomptabilite.bean;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonProperty;

import stage.sir.gestioncomptabilite.Security.models.User;

@Entity
public class Comptable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String code;
    private String nom;
    private String telephone;
    private String prenom;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToOne(mappedBy = "comptable")
    private User user;
    private Boolean typeTraitant;
    private Boolean typeValidateur;
    private String type;
    
    
    
    
    public Boolean getTypeTraitant() {
        return typeTraitant;
    }

    public void setTypeTraitant(Boolean typeTraitant) {
        this.typeTraitant = typeTraitant;
    }

    public Boolean getTypeValidateur() {
        return typeValidateur;
    }

    public void setTypeValidateur(Boolean typeValidateur) {
        this.typeValidateur = typeValidateur;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    
    public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
