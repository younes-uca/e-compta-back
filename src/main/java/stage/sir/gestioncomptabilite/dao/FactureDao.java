package stage.sir.gestioncomptabilite.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import stage.sir.gestioncomptabilite.bean.Facture;

import java.util.List;

@Repository

public interface FactureDao extends JpaRepository<Facture,Long> {
    public Facture findByRef(String ref);
    public int deleteByRef(String ref);
    List<Facture> findBySocieteSourceIceAndAnnee(String ice, double annee);
    List<Facture> findBySocieteSourceIceAndAnneeAndTrim(String ice, double annee,double trim);
    List<Facture> findBySocieteSourceIceAndAnneeAndMois(String ice, double annee, double mois);
    List<Facture> findBySocieteSourceIceAndAnneeAndTrimAndTypeOperationLibelle(String ice, double annee,double trim,String typeoperation);
    List<Facture> findBySocieteSourceIceAndAnneeAndMoisAndTypeOperationLibelle(String ice, double annee,double mois,String typeoperation);
    List<Facture> findBySocieteSourceIceAndTypeOperation(String ice,String typeoperation);

    List<Facture> findBySocieteSourceIceAndAnneeAndTypeOperationLibelle(String ice, double annee,String typeoperation);
    List<Facture> findByAnnee(double annee);
    List<Facture> findBySocieteSourceIce(String ice);
    List<Facture> findByDemandeRef(String reference);
    List<Facture> findByDemandeRefAndDemandeTrimestre(String reference, Integer trim);
    List<Facture> findByDemandeRefAndTypeOperationLibelle(String reference, String type);

    @Query("SELECT f FROM Facture f where f.compteComptable.sousClasseComptable.libelle=:type and f.annee <:thisDate and f.annee > :thatDate ")
    List<Facture> bringFact(@Param("type") String type, @Param("thisDate") Double thisDate, @Param("thatDate") Double thatDate );
    
}