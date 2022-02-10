package stage.sir.gestioncomptabilite.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import stage.sir.gestioncomptabilite.bean.PieceJointSociete;

@Repository
public interface PieceJointSocieteDao extends JpaRepository<PieceJointSociete,Long> {


}
