package stage.sir.gestioncomptabilite.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import stage.sir.gestioncomptabilite.bean.TauxIsConfig;

import java.util.Date;

@Repository
public interface TauxISConfigDao extends JpaRepository<TauxIsConfig, Long> {
     TauxIsConfig findByRef(String ref);
     @Query ("SELECT tauxISConfig FROM TauxIsConfig tauxISConfig WHERE ((:currentDate >= tauxISConfig.dateMin) AND (:currentDate <= tauxISConfig.dateMax))")
     TauxIsConfig findCurrentTauxIsConfig(@Param(value = "currentDate") Date currentDate);
     @Query ("SELECT tauxISConfig FROM TauxIsConfig tauxISConfig WHERE ((:date >= tauxISConfig.dateMin) AND (:date <= tauxISConfig.dateMax))")
     TauxIsConfig findTauxIsConfig(@Param(value = "date") Date date);
}
