package stage.sir.gestioncomptabilite.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import stage.sir.gestioncomptabilite.bean.FacturePieceJointe;


@Repository
public interface FacturePieceJointeDao extends JpaRepository<FacturePieceJointe, Long> {
    //FacturePieceJointe findByFactureRef(String reference);
    FacturePieceJointe findByName(String name);
    Optional<FacturePieceJointe> findById(Long id);

}
