package stage.sir.gestioncomptabilite.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import stage.sir.gestioncomptabilite.bean.TauxIS;

import java.util.Date;
import java.util.List;

@Repository
public interface TauxISDao extends JpaRepository<TauxIS, Long> {
    TauxIS findByRef(String ref);
    int deleteByRef(String ref);
    List<TauxIS> findByTauxIsConfigId(Long id);
    @Query("SELECT tauxIs FROM TauxIS tauxIs WHERE (:dateActuelle BETWEEN tauxIs.tauxIsConfig.dateMin AND tauxIs.tauxIsConfig.dateMax) OR (:dateActuelle >= tauxIs.tauxIsConfig.dateMin AND tauxIs.tauxIsConfig.dateMax IS NULL  ) ORDER BY tauxIs.pourcentage")
    List<TauxIS> findTauxIs(@Param(value = "dateActuelle") Date dateActuelle);
}
