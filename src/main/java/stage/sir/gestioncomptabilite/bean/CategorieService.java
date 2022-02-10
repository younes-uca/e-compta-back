package stage.sir.gestioncomptabilite.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class CategorieService {
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	Long id;
	String titre;
	@Lob
	String description;
	@Lob
	String detail;
	Double montant;
	String lien;
	String icon;
	String texteButton;
	Integer indiceAffichage;

	public String getIcon() { return icon;	}
	public void setIcon(String icon) { this.icon = icon; }
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getMontant() {
		return montant;
	}
	public void setMontant(Double montant) {
		this.montant = montant;
	}
	public String getLien() {
		return lien;
	}
	public void setLien(String lien) {
		this.lien = lien;
	}
	public String getTexteButton() {
		return texteButton;
	}
	public void setTexteButton(String texteButton) {
		this.texteButton = texteButton;
	}
	public Integer getIndiceAffichage() {
		return indiceAffichage;
	}
	public void setIndiceAffichage(Integer indiceAffichage) {
		this.indiceAffichage = indiceAffichage;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	
}
