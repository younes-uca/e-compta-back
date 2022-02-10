package stage.sir.gestioncomptabilite.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stage.sir.gestioncomptabilite.Security.repository.UserRepository;
import stage.sir.gestioncomptabilite.bean.Demande;
import stage.sir.gestioncomptabilite.bean.EtatDemande;
import stage.sir.gestioncomptabilite.bean.Facture;
import stage.sir.gestioncomptabilite.bean.Societe;
import stage.sir.gestioncomptabilite.dao.DemandeDao;
import stage.sir.gestioncomptabilite.util.StringUtil;
import stage.sir.gestioncomptabilite.vo.*;

import javax.persistence.EntityManager;

import java.io.IOException;
import java.util.*;

@Service
public class DemandeService {

    @Autowired
    UserRepository userDao;
    @Autowired
    DemandeDao demandeDao;
    @Autowired
    SocieteService societeService;
    @Autowired
    EtatDemandeService etatDemandeService;
    @Autowired
    EntityManager entityManager;
    @Autowired
    FactureService factureService;


    public List<Demande> findBySocieteIce(String ice) {
        return demandeDao.findBySocieteIce(ice);
    }

    public List<Demande> findBycomptableValidateurCode(String code) {
        return demandeDao.findBycomptableValidateurCode(code);
    }

    public List<Demande> findBycomptableTraiteurCode(String code) {
        return demandeDao.findBycomptableTraiteurCode(code);
    }

    public Demande findByRef(String ref) {
        return demandeDao.findByRef(ref);
    }

    @Transactional
    public int deleteByRef(String ref) {
        return demandeDao.deleteByRef(ref);
    }

    public List<Demande> findByOperation(String operation) {
        return demandeDao.findByOperation(operation);
    }

    public Integer findTrimestre(Integer mois) {
        if (mois >= 1 && mois <= 3) {
            return 1;
        }
        if (mois >= 4 && mois <= 6) {
            return 2;
        }
        if (mois >= 7 && mois <= 9) {
            return 3;
        } else {
            return 4;
        }
    }

    public List<Demande> searchCriteria(DemandeVo demandeVo) {

        String query = "SELECT d FROM Demande d WHERE 1=1";
        if (StringUtil.isNotEmpty(demandeVo.getRef())) {
            query += " AND d.ref LIKE '%" + demandeVo.getRef() + "%'";
        }
        if (StringUtil.isNotEmpty(demandeVo.getOperation())) {
            query += " AND d.operation LIKE '%" + demandeVo.getOperation() + "%'";
        }
        if (StringUtil.isNotEmpty(demandeVo.getComptableTraiteurCode())) {

            query += " AND d.comptableTraiteur.code LIKE '%" + demandeVo.getComptableTraiteurCode() + "%'";
        }
        if (StringUtil.isNotEmpty(demandeVo.getComptableValidateurCode())) {
            query += " AND d.comptableValidateur.code LIKE '%" + demandeVo.getComptableValidateurCode() + "%'";
        }
        if (StringUtil.isNotEmpty(demandeVo.getSociete())) {
            query += " AND d.societe.ice LIKE '%" + demandeVo.getSociete() + "%'";
        }
        if (StringUtil.isNotEmpty(demandeVo.getAnnee())) {
            query += " AND d.annee = '" + demandeVo.getAnnee() + "'";
        }
        if (StringUtil.isNotEmpty(demandeVo.getMoisMin())) {
            query += " AND d.mois >= '" + demandeVo.getMoisMin() + "'";
        }
        if (StringUtil.isNotEmpty(demandeVo.getMoisMax())) {
            query += " AND d.mois <= '" + demandeVo.getMoisMax() + "'";
        }
        if (StringUtil.isNotEmpty(demandeVo.getEtatDemande())) {
            query += " AND d.etatDemande.libelle LIKE '%" + demandeVo.getEtatDemande() + "%'";
        }
        return entityManager.createQuery(query).getResultList();
    }

    public List<Demande> findAll() {
        return demandeDao.findAll();
    }

    public int edit(Demande demande) {
        System.out.println("Hahiyaa"+ demande.getRef());
        Societe societe = societeService.findByIce(demande.getSociete().getIce());
        demande.setSociete(societe);
        String etatFront = demande.getEtatDemande().getLibelle();
        EtatDemande etatDemande = etatDemandeService.findByLibelle(etatFront);
        if (societe == null) {
            return -1;
        } else {
            demande.setEtatDemande(etatDemande);
            Date dateDemande = new Date();
            demande.setDateDemande(dateDemande);
            if (demande.getComptableTraiteur() == null){
                demande.setComptableTraiteur(null);
            }
            if (demande.getComptableValidateur() == null){
                demande.setComptableValidateur(null);
            }

            demandeDao.save(demande);
            return 1;
        }
    }

    public int save(Demande demande) {
        Societe societe = societeService.findByIce(demande.getSociete().getIce());
        demande.setSociete(societe);
        EtatDemande etatDemande = etatDemandeService.findByLibelle("en attente de réponse");
        if (findByRef(demande.getRef()) != null) {
            return -1;
        } else if (demande.getOperation() == null) {
            return -2;
        } else if (societe == null) {
            return -3;
        } else {
            if (demande.getMois() != null) {
                demande.setTrimestre(findTrimestre(demande.getMois()));
            }

            Date dateDemande = new Date();
            demande.setDateDemande(dateDemande);
            demande.setComptableTraiteur(null);
            demande.setComptableValidateur(null);
            demande.setEtatDemande(etatDemande);
            demandeDao.save(demande);
            return 1;
        }
    }

    public Demande saveDemande(Demande demande, List<Facture> factures)  {
        Societe societe = societeService.findByIce(demande.getSociete().getIce());
        demande.setSociete(societe);

        EtatDemande etatDemande = etatDemandeService.findByLibelle("Initialisée par société");

        if (findByRef(demande.getRef()) != null) {
            return null;
        } else if (demande.getOperation() == null) {
            return null;
        } else if (societe == null) {
            return null;
        } else {
            if (demande.getMois() != null) {
                demande.setTrimestre(findTrimestre(demande.getMois()));
            }
            Date dateDemande = new Date();
            demande.setDateDemande(dateDemande);
            demande.setRef(System.currentTimeMillis()+"");
            demande.setComptableTraiteur(null);
            demande.setComptableValidateur(null);
            demande.setEtatDemande(etatDemande);
            demande.setEnableBtn(true);
            demandeDao.save(demande);
            System.out.println(demande.getRef());
            try {
                factureService.saveFactureDemande(demande, factures);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return demande;
        }
    }

    public List<Demande>  findByEtatDemandeLibelleAndOperation(String libelle, String operation){
        return demandeDao.findByEtatDemandeLibelleAndOperation( libelle,  operation);
    }

    public List<Demande> findByEtatDemandeLibelle(String libelle){
        return demandeDao.findByEtatDemandeLibelle(libelle);
    }

    public List<Demande> findBySocieteIceAAndEtatDemandeLibelle(String ice, String etat){
        return demandeDao.findBySocieteIceAndEtatDemandeLibelle(ice, etat);
    }


    public List<Demande>  findBySocieteIceAndOperation(String ice, String operation){
        return demandeDao.findBySocieteIceAndOperation(ice, operation);
    }

    public List<Demande> findBySocieteIceAndEtatDemandeLibelleAndOperation(String ice, String etat, String operation){
        return demandeDao.findBySocieteIceAndEtatDemandeLibelleAndOperation(ice, etat, operation);
    }

    public Map<String, List<StatistiqueVo>> countByIperation(){
        List<String> etatDesire = Arrays.asList("e1","e2","e3","e4","e5","e6","e7");
        List<String> operationDesire = Arrays.asList("Declaration TVA","Declaration IR","Declaration IS");
        Map<String, List<StatistiqueVo>> res = new HashMap<>();
        for(String operation: operationDesire){
            List<StatistiqueVo> statVos = new ArrayList<>();
            for (int i=0; i<etatDesire.size();i++) {
                Long count = countByEtatDemandeRefAndOperation(etatDesire.get(i), operation);
                StatistiqueVo statVo = new StatistiqueVo();
                statVo.setNbrEtatDemande(count);
                statVo.setEtatDemande(etatDesire.get(i));
                statVos.add(statVo);
            }
            res.put(operation, statVos);
        }
        return res;
    }

    public Long countByEtatDemandeRefAndOperation(String etatDemande, String operation) {
        return demandeDao.countDemandeByEtatDemandeRefAndOperation(etatDemande, operation);
    }

    public List<Demande> findByEtatDemandeLibelleAndOperationAndComptableTraiteurCode(String libelle, String operation , String code){
	    return demandeDao.findByEtatDemandeLibelleAndOperationAndComptableTraiteurCode(libelle,operation, code);
    }
    public List<Demande> findByOperationAndComptableTraiteurCode(String operation, String code){
	    return demandeDao.findByOperationAndComptableTraiteurCode(operation, code);

    }
    public List<Demande> findByEtatDemandeLibelleAndOperationAndComptableValidateurCode(String libelle, String operation , String code){
        return demandeDao.findByEtatDemandeLibelleAndOperationAndComptableValidateurCode(libelle,operation, code);
    }
    public List<Demande> findByOperationAndComptableValidateurCode(String operation, String code){
        return demandeDao.findByOperationAndComptableValidateurCode(operation, code);

    }
    public int save2(Demande demande) {
        Societe societe = societeService.findByIce(demande.getSociete().getIce());
        demande.setSociete(societe);
        EtatDemande etatDemande = etatDemandeService.findByLibelle("initialisé par client");
        if (findByRef(demande.getRef()) != null){ return -1; }
        else if (societe == null){ return -3; }
        else {
            Date dateDemande = new Date();
            demande.setDateDemande(dateDemande);
            demande.setComptableTraiteur(null);
            demande.setComptableValidateur(null);
            demande.setEtatDemande(etatDemande);
            demande.setEnableBtn(true);
            demande.setTrimestre(null);
            demande.setRef(societe.getNomSociete());
            demande.setMois(null);
            demande.setOperation("Création Société");
            demandeDao.save(demande);
            return 1;
        }
    }
    private Long countByEtatDemandeLibelle(String etat){
	    return demandeDao.countByEtatDemandeLibelle(etat);
    }
 
    public Map<String, Long> countByEtatDemandeLibelle(){
	    List<String> etatDesire = Arrays.asList("ect","ear","ips","tf","brt","bcv","vf");
	    List<EtatDemande> etatDemandes = etatDemandeService.findAll();
	    Map<String, Long> res = new HashMap<>();

        for (EtatDemande etatDemande: etatDemandes) {
            if (etatDesire.contains(etatDemande.getRef())) {
                res.put(etatDemande.getLibelle(), countByEtatDemandeLibelle(etatDemande.getLibelle()));
            }
        }
        return res;
    }
    
    
}



