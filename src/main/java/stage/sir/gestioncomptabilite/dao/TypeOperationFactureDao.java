package stage.sir.gestioncomptabilite.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import stage.sir.gestioncomptabilite.bean.TypeOperationFacture;

@Repository
public interface TypeOperationFactureDao extends JpaRepository<TypeOperationFacture, Long> {
    public TypeOperationFacture findByLibelle(String libelle);
}
