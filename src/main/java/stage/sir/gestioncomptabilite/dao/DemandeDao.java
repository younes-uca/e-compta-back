package stage.sir.gestioncomptabilite.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import stage.sir.gestioncomptabilite.bean.Demande;

import java.util.List;

@Repository
public interface DemandeDao extends JpaRepository<Demande, Long> {
    Demande findByRef(String ref);
    int deleteByRef(String ref);
    List<Demande> findByOperation(String operation);
    List<Demande> findBycomptableTraiteurCode(String code);
    List<Demande> findBycomptableValidateurCode(String code);
    List<Demande> findBySocieteIce(String ice);
    List<Demande> findBySocieteIceAndEtatDemandeLibelle(String ice, String etat);
    List<Demande> findBySocieteIceAndEtatDemandeLibelleAndOperation(String ice, String etat, String operation);
    List<Demande> findByEtatDemandeLibelle(String libelle);
    List<Demande> findByEtatDemandeLibelleAndOperation(String libelle, String operation);
    List<Demande> findBySocieteIceAndOperation(String ice, String operation);
    Long countDemandeByEtatDemandeRefAndOperation(String ref, String operation);
    List<Demande> findByEtatDemandeLibelleAndOperationAndComptableTraiteurCode(String libelle, String operation , String code);
    List<Demande> findByEtatDemandeLibelleAndOperationAndComptableValidateurCode(String libelle, String operation , String code);
    List<Demande> findByOperationAndComptableTraiteurCode(String operation, String code);
    List<Demande> findByOperationAndComptableValidateurCode(String operation, String code);
    Long countByEtatDemandeLibelle(String etat);
    Long countByEtatDemandeRefAndOperation(String etat, String operation);
    

}
