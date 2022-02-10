package stage.sir.gestioncomptabilite.bean;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonProperty;



@Entity
public class TauxIr {
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private Double salaireMin;
	private Double salaireMax;
	private Double pourcentage;
	@ManyToOne
    private TauxIrConfig tauxIrConfig;
	@OneToMany(mappedBy = "tauxIr")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private List<DeclarationIREmploye> declarationIREmployesList;
/*
	public List<Details> getDetailsTauxDetails() {
		return detailsTauxDetails;
	}
	public void setDetailsTauxDetails(List<Details> detailsTauxDetails) {
		this.detailsTauxDetails = detailsTauxDetails;
	}*/
	
	
	public Long getId() {
		return id;
	}
	public List<DeclarationIREmploye> getDeclarationIREmployesList() {
		return declarationIREmployesList;
	}
	public void setDeclarationIREmployesList(List<DeclarationIREmploye> declarationIREmployesList) {
		this.declarationIREmployesList = declarationIREmployesList;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Double getSalaireMin() {
		return salaireMin;
	}
	public void setSalaireMin(Double salaireMin) {
		this.salaireMin = salaireMin;
	}
	public Double getSalaireMax() {
		return salaireMax;
	}
	public void setSalaireMax(Double salaireMax) {
		this.salaireMax = salaireMax;
	}
	public Double getPourcentage() {
		return pourcentage;
	}
	public void setPourcentage(Double pourcentage) {
		this.pourcentage = pourcentage;
	}



	public TauxIrConfig getTauxIrConfig() {
		return this.tauxIrConfig;
	}

	public void setTauxIrConfig(TauxIrConfig tauxIrConfig) {
		this.tauxIrConfig = tauxIrConfig;
	}

}
