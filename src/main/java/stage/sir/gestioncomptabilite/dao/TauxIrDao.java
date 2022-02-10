package stage.sir.gestioncomptabilite.dao;


import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import stage.sir.gestioncomptabilite.bean.TauxIr;

@Repository
public interface TauxIrDao extends JpaRepository<TauxIr,Long> {
	
	
	@Override
	 Optional<TauxIr> findById(Long id);
	@Override
	void deleteById(Long id);
	TauxIr findByPourcentage(Double pourcentage);
	@Query("SELECT tauxIr FROM TauxIr tauxIr WHERE (:dateActuelle BETWEEN tauxIr.tauxIrConfig.dateMin AND tauxIr.tauxIrConfig.dateMax) OR (:dateActuelle >= tauxIr.tauxIrConfig.dateMin AND tauxIr.tauxIrConfig.dateMax IS NULL )  ORDER BY tauxIr.pourcentage")
	public List<TauxIr> findTauxIr(@Param(value = "dateActuelle") Date dateActuelle);

	
	

}
