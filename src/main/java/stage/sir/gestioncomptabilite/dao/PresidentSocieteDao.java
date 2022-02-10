package stage.sir.gestioncomptabilite.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import stage.sir.gestioncomptabilite.bean.PresidentSociete;

import java.util.Optional;

@Repository
public interface PresidentSocieteDao extends JpaRepository<PresidentSociete, Long> {
    PresidentSociete findByCin(String cin);
    Optional<PresidentSociete> findById(Long id);
}
