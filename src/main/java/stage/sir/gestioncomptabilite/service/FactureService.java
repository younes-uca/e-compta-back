package stage.sir.gestioncomptabilite.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import stage.sir.gestioncomptabilite.bean.*;
import stage.sir.gestioncomptabilite.dao.FactureDao;
import stage.sir.gestioncomptabilite.dao.FacturePieceJointeDao;
import stage.sir.gestioncomptabilite.vo.FactureVo;


import javax.persistence.EntityManager;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;


@Service
public class FactureService extends AbstractFacade<Facture>{
    @Autowired
    private FactureDao factureDao;
    @Autowired
    private SocieteService societeService;
    @Autowired
    private TvaService tvaService;
    @Autowired
    private CompteComptableService comptComptableService;
    @Autowired
    private DeclarationISService declarationISService;
    @Autowired
    private DeclarationIRService declarationIRService;
    @Autowired
    private  DeclarationTvaService declarationTvaService;
    @Autowired
    private EntityManager entityManager;
    @Autowired
    private EtatFactureService etatFactureService;
    @Autowired
    private EtatPaiementService etatPaiementService;
    @Autowired
    private TypeOperationFactureService typeOperationService;
    @Autowired
    FacturePieceJOinteService facturePieceJointeService;
    @Autowired
    ClassComptableService classComptableService;
    @Autowired
    DemandeService demandeService;


    public Facture findByRef(String ref) {
        return factureDao.findByRef(ref);
    }

    @Transactional
    public int deleteByRef(String ref) {
        return factureDao.deleteByRef(ref);
    }

    public List<Facture> findBySocieteSourceIceAndAnneeAndTrim(String ice, double annee, double trim) {
        return factureDao.findBySocieteSourceIceAndAnneeAndTrim(ice, annee, trim);
    }

    public List<Facture> findBySocieteSourceIceAndAnneeAndMois(String ice, double annee, double mois) {
        return factureDao.findBySocieteSourceIceAndAnneeAndMois(ice, annee, mois);
    }


    public List<Facture> findBySocieteSourceIceAndAnneeAndTrimAndTypeOperation(String ice, double annee, double trim, String typeoperation) {
        System.out.println(ice + annee + trim + typeoperation);
        return factureDao.findBySocieteSourceIceAndAnneeAndTrimAndTypeOperationLibelle(ice, annee, trim, typeoperation);
    }

    public List<Facture> findBySocieteSourceIceAndAnneeAndMoisAndTypeOperation(String ice, double annee, double mois, String typeoperation) {
        return factureDao.findBySocieteSourceIceAndAnneeAndMoisAndTypeOperationLibelle(ice, annee, mois, typeoperation);
    }

    public List<Facture> findBySocieteSourceIceAndTypeOperation(String ice, String typeoperation) {
        return factureDao.findBySocieteSourceIceAndTypeOperation(ice, typeoperation);
    }

    public List<Facture> findAll() {
        return factureDao.findAll();
    }
    /*public void update(Facture facture){
        factureDao.save(facture);
    }*/

    public int save(Facture facture) {
        String etatCredit,etatDebit;
        Societe societeS = societeService.findByIce(facture.getSocieteSource().getIce());
        System.out.println(facture.getSocieteSource().getIce());
        facture.setSocieteSource(societeS);
        Societe societeD = societeService.findByIce(facture.getSocieteDistination().getIce());
        facture.setSocieteDistination(societeD);
        Tva tv = tvaService.findByRef(facture.getTva().getRef());
        facture.setTva(tv);
        TypeOperationFacture typeOperationFacture = typeOperationService.findByLibelle(facture.getTypeOperation().getLibelle());
        facture.setTypeOperation(typeOperationFacture);
        Demande demande = demandeService.findByRef(facture.getDemande().getRef());
        facture.setDemande(demande);

        EtatPaiement etatPaiment = new EtatPaiement();
        EtatFacture etatFacture = new EtatFacture();
        ClasseComptable classeComptable = new ClasseComptable();  


        if(facture.getEtatFacture() == null){
            facture.setEtatFacture(null);
        }
        else{
            etatFacture = etatFactureService.findByCode(facture.getEtatFacture().getCode());
            System.out.println(etatFacture.getLibelle());
            facture.setEtatFacture(etatFacture);
        }

        if(facture.getEtatPaiement() == null){
            facture.setEtatPaiement(null);
        }
        else{
            etatPaiment = etatPaiementService.findByCode(facture.getEtatFacture().getCode());
            System.out.println(etatPaiment.getLibelle());
            facture.setEtatPaiement(etatPaiment);
        }
        
        if(facture.getClasseComptable() == null){
            facture.setClassComptable(null);
        }
        else{
            classeComptable = classComptableService.findByNumero(facture.getClasseComptable().getNumero());
            facture.setClassComptable(classeComptable);

        }
      
        facture.setCompteComptable(null);

        Facture facture1 = factureDao.findByRef(facture.getRef());

        if ((facture1 != null) &&(facture1.getSocieteSource().getIce() == facture.getSocieteSource().getIce())  ) {
            System.out.println("-1");
            return -1;
        } else if (societeS == null) {
            System.out.println("-2");
            return -2;
        } else if (societeD == null || societeD == societeS) {
            System.out.println("-3");
            return -3;
        } else if (tv == null) {
            System.out.println("-4");
            return -4;
        }
        else{


            facture.setDeclarationIR(null);
            facture.setDeclarationIS(null);
            facture.setDeclarationTva(null);
            facture.setFacturePieceJointe(null);
            facture.setMontantTVA((facture.getMontantHorsTaxe() * facture.getTva().getValeur()) /100);
            facture.setMontantTTC(facture.getMontantHorsTaxe() + facture.getMontantTVA());
            facture.setTrim(Trouvertrim(facture.getDateOperation()));
            facture.setMois(facture.getDateOperation().getMonth() +1);
            facture.setAnnee(facture.getDateOperation().getYear() + 1900);
            facture.setDemande(facture.getDemande());

            if(facture.getTypeOperation().getLibelle().equals("CREDIT")){

                etatCredit = String.valueOf(facture.getMontantTTC())+" DH";

                etatCredit = String.valueOf(facture.getMontantTTC()) +" DH";
                etatDebit = "-";
                facture.setCredit(etatCredit);
                facture.setDebit(etatDebit);
            }
            if(facture.getTypeOperation().getLibelle().equals("DEBIT")){

                etatDebit = String.valueOf(facture.getMontantTTC()) + " DH";

                etatCredit = "-";
                facture.setCredit(etatCredit);
                facture.setDebit(etatDebit);
            }


            factureDao.save(facture);
            return 1;
        }



    }

    public int save(FactureVo factureVO) throws IOException {
        Facture facture = new Facture();

        String etatCredit,etatDebit;
        Societe societeS = societeService.findByIce(factureVO.getSocieteSource().getIce());
        facture.setSocieteSource(societeS);
        Societe societeD = societeService.findByIce(factureVO.getSocieteDistination().getIce());
        facture.setSocieteDistination(societeD);
        Tva tv = tvaService.findByRef(factureVO.getTva().getRef());
        facture.setTva(tv);
        EtatFacture etatFacture = etatFactureService.findByCode(factureVO.getEtatFacture().getCode());
        facture.setEtatFacture(etatFacture);
        EtatPaiement etatPaiement = etatPaiementService.findByCode(factureVO.getEtatPaiement().getCode());
        facture.setEtatPaiement(etatPaiement);

        CompteComptable cpt = comptComptableService.findByCode(factureVO.getCompteComptable().getCode());
        facture.setCompteComptable(cpt);

        Facture facture1 = factureDao.findByRef(facture.getRef());

        if ((facture1 != null) &&(facture1.getSocieteSource().getIce() == facture.getSocieteSource().getIce())  ) {
            return -1;
        } else if (societeS == null) {
            return -2;
        } else if (societeD == null || societeD == societeS) {
            return -3;
        } else if (tv == null) {
            return -4;
        }  else if (etatFacture == null) {
            return -5;
        }  else if (etatPaiement == null) {
            return -6;
        }

        else{
            facture.setDeclarationIR(null);
            facture.setDeclarationIS(null);
            facture.setDeclarationTva(null);
            facture.setCompteComptable(null);
            facture.setRef(factureVO.getReference());
            facture.setMontantHorsTaxe(factureVO.getMontantHorsTaxe());
            facture.setDateOperation(factureVO.getDateOperation());
            facture.setMontantTVA((facture.getMontantHorsTaxe() * facture.getTva().getValeur()) /100);
            facture.setMontantTTC(facture.getMontantHorsTaxe() + facture.getMontantTVA());
            facture.setTrim(Trouvertrim(facture.getDateOperation()));
            facture.setMois(facture.getDateOperation().getMonth() +1);
            facture.setAnnee(facture.getDateOperation().getYear() + 1900);
            facture.setTypeOperation(factureVO.getTypeOperation());

            if(facture.getTypeOperation().equals("CRÉDIT")){

                etatCredit = String.valueOf(facture.getMontantTTC())+" DH";

                etatCredit = String.valueOf(facture.getMontantTTC()) +" DH";
                etatDebit = "-";
                facture.setCredit(etatCredit);
                facture.setDebit(etatDebit);
            }
            if(facture.getTypeOperation().equals("DÉBIT")){

                etatDebit = String.valueOf(facture.getMontantTTC()) + " DH";

                etatCredit = "-";
                facture.setCredit(etatCredit);
                facture.setDebit(etatDebit);
            }

            factureDao.save(facture);


            return 1;
        }



    }
    public double Trouvertrim(Date date){
        if((date.getMonth() +1) <= 3){
            return 1;
        }
        else if((date.getMonth() +1) > 3 && (date.getMonth() +1) <= 6){
            return 2;
        }
        else if((date.getMonth() +1) > 6 && (date.getMonth() +1) <= 9){
            return 3;
        }

        else {
            return 4;
        }

    }
    public List<Facture>  Journal(FactureVo factureVo){


        String request = "SELECT f FROM Facture f WHERE 1=1";
        request += " AND f.societeSource.ice = '" + factureVo.getReference() + "' ";


        request+=addConstraintMinMaxDate("f","dateOperation",factureVo.getDmin(),factureVo.getDmax());
        return entityManager.createQuery(request).getResultList();

    }
    public int update(Facture facture){
        String etatCredit,etatDebit;
        Societe societeS = societeService.findByIce(facture.getSocieteSource().getIce());
        facture.setSocieteSource(societeS);
        Societe societeD = societeService.findByIce(facture.getSocieteDistination().getIce());
        facture.setSocieteDistination(societeD);
        Tva tv = tvaService.findByRef(facture.getTva().getRef());
        EtatPaiement etatPaiment = new EtatPaiement();
        EtatFacture etatFacture = new EtatFacture();
        CompteComptable compteComptable = new CompteComptable();
        ClasseComptable classeComptable = new ClasseComptable();     

        facture.setTva(tv);
        if(facture.getEtatFacture() == null){
            facture.setEtatFacture(null);
        }
        else{
            etatFacture = etatFactureService.findByCode(facture.getEtatFacture().getCode());
            System.out.println(etatFacture.getLibelle());
            facture.setEtatFacture(etatFacture);
        }

        if(facture.getEtatPaiement() == null){
            facture.setEtatPaiement(null);
        }
        else{
            etatPaiment = etatPaiementService.findByCode(facture.getEtatPaiement().getCode());
            System.out.println(etatPaiment.getLibelle());
            facture.setEtatPaiement(etatPaiment);
        }

        if (facture.getCompteComptable() == null){
            facture.setCompteComptable(null);
            facture.setClassComptable(null);
        }
        else{
            compteComptable = comptComptableService.findByCode(facture.getCompteComptable().getCode());
            facture.setCompteComptable(compteComptable);
            int classeComptableNum = Character.getNumericValue(compteComptable.getCode().charAt(0));
            classeComptable = classComptableService.findByNumero(classeComptableNum);
            facture.setClassComptable(classeComptable);
        }
        
        Facture facture1 = factureDao.findByRef(facture.getRef());

        if (societeS == null) {
            return -1;
        } else if (societeD == null || societeD == societeS) {
            return -2;
        } else if (tv == null) {
            return -3;
        }

        else{
            facture.setMontantTVA((facture.getMontantHorsTaxe() * facture.getTva().getValeur()) /100);
            facture.setMontantTTC(facture.getMontantHorsTaxe() + facture.getMontantTVA());
            facture.setTrim(Trouvertrim(facture.getDateOperation()));
            facture.setMois(facture.getDateOperation().getMonth() +1);
            facture.setAnnee(facture.getDateOperation().getYear() + 1900);
            facture.setLibelle(facture.getLibelle());
            if(facture.getTypeOperation().equals("CREDIT")){
                etatCredit = String.valueOf(facture.getMontantTTC()) +" DH";
                etatDebit = "-";
                facture.setCredit(etatCredit);
                facture.setDebit(etatDebit);
            }
            if(facture.getTypeOperation().equals("DEBIT")){
                etatDebit = String.valueOf(facture.getMontantTTC()) +" DH";
                etatCredit = "-";
                facture.setCredit(etatCredit);
                facture.setDebit(etatDebit);
            }
            factureDao.save(facture);
            return 1;
        }


    }


    public List<Facture> findBySocieteSourceIceAndAnnee(String ice, double annee) {
        return factureDao.findBySocieteSourceIceAndAnnee(ice, annee);
    }

    public List<Facture> findBySocieteSourceIceAndAnneeAndTypeOperation(String ice, double annee, String typeoperation) {
        return factureDao.findBySocieteSourceIceAndAnneeAndTypeOperationLibelle(ice, annee, typeoperation);
    }

    public List<Facture> findBySocieteSourceIce(String ice) {
        return factureDao.findBySocieteSourceIce(ice);
    }

    public int saveFacturesIS(DeclarationIS declarationIS, List<Facture> listFactures){
        double gain = 0;
        double charge = 0;
        for (Facture f: listFactures){
            f.setDeclarationIS(declarationIS);
            Societe societeS = societeService.findByIce(f.getSocieteSource().getIce());
            f.setSocieteSource(societeS);
            Societe societeD = societeService.findByIce(f.getSocieteDistination().getIce());
            f.setSocieteDistination(societeD);
            Tva tv = tvaService.findByRef(f.getTva().getRef());
            f.setTva(tv);
            CompteComptable cpt = comptComptableService.findByCode(f.getCompteComptable().getCode());
            f.setCompteComptable(cpt);
            Facture facture1 = factureDao.findByRef(f.getRef());

            if ((facture1 != null) &&(facture1.getSocieteSource().getIce() == f.getSocieteSource().getIce()) && (facture1.getSocieteDistination().getIce() == f.getSocieteDistination().getIce()) ) {
                return -1;
            } else if (societeS == null) {
                return -2;
            } else if (societeD == null) {
                return -3;
            } else if (tv == null) {
                return -4;
            } else if (cpt == null) {
                return -5;
            }else {
                factureDao.save(f);
                return 1;
            }
        }
        return 0;
    }

    

    public void updateFacture(Facture facture){
        factureDao.save(facture);
    }


    public int saveFactureDemande(Demande demande, List<Facture> factures) throws IOException {

        
        for (Facture facture : factures) {
            String etatCredit, etatDebit;

            Societe societeS = societeService.findByIce(facture.getSocieteSource().getIce());
            facture.setSocieteSource(societeS);

            Societe societeD = societeService.findByIce(facture.getSocieteDistination().getIce());
            if (societeD == null){
                societeService.save2(facture.getSocieteDistination());
            }else{
                facture.setSocieteDistination(societeD);
            }

            Tva tv = tvaService.findByRef(facture.getTva().getRef());
            facture.setTva(tv);

            TypeOperationFacture typeOperationFacture = typeOperationService.findByLibelle(facture.getTypeOperation().getLibelle());
            facture.setTypeOperation(typeOperationFacture);

            CompteComptable cpt = comptComptableService.findByCode(facture.getCompteComptable().getCode());
            facture.setCompteComptable(cpt);

            Facture facture1 = factureDao.findByRef(facture.getRef());

            if ((facture1 != null) && (facture1.getSocieteSource().getIce() == facture.getSocieteSource().getIce())) {
                return -1;
            } else if (societeS == null) {
                return -2;
            } else if (societeD == societeS) {
                return -3;
            } else if (tv == null) {
                return -4;
            }
        else {

                facture.setEtatFacture(null);
                facture.setEtatPaiement(null);
                facture.setDeclarationIR(null);
                facture.setDeclarationIS(null);
                facture.setDeclarationTva(null);
                facture.setCompteComptable(null);
                facture.setClassComptable(null);
                facture.setDemande(demande);
                facture.setMontantTVA((facture.getMontantHorsTaxe() * facture.getTva().getValeur()) / 100);
                facture.setTrim(Trouvertrim(facture.getDateOperation()));
                facture.setMois(facture.getDateOperation().getMonth() + 1);
                facture.setAnnee(facture.getDateOperation().getYear() + 1900);
                facture.setFacturePieceJointe(null);

                if (facture.getTypeOperation().getLibelle().equals("CREDIT")) {

                    etatCredit = String.valueOf(facture.getMontantTTC()) + " DH";

                    etatCredit = String.valueOf(facture.getMontantTTC()) + " DH";
                    etatDebit = "-";
                    facture.setCredit(etatCredit);
                    facture.setDebit(etatDebit);
                }
                if (facture.getTypeOperation().getLibelle().equals("DEBIT")) {

                    etatDebit = String.valueOf(facture.getMontantTTC()) + " DH";

                    etatCredit = "-";
                    facture.setCredit(etatCredit);
                    facture.setDebit(etatDebit);
                }
                factureDao.save(facture);
            }

        }
        return 1;
    }

    public void uploadFile(MultipartFile file, String factureRef, String libelle){
        Facture facture = new Facture();
        facture = factureDao.findByRef(factureRef);

        FacturePieceJointe facturePieceJointe = new FacturePieceJointe();

        String path = System.getProperty("user.home") + "\\facture-pieces-jointes\\";
        String fileName = System.currentTimeMillis()+"."+file.getOriginalFilename().split("\\.")[1];
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdir();
		}

        try {
            Files.write(Paths.get(path + fileName), file.getBytes());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        facture.setRef(factureRef);
        facturePieceJointe.setName(fileName);
        facturePieceJointe.setPath(path + fileName);
        FacturePieceJointe savedFacturePieceJointe = facturePieceJointeService.save(facturePieceJointe);
        facture.setLibelle(libelle);

        facture.setFacturePieceJointe(savedFacturePieceJointe);
        factureDao.save(facture);
    }

    public List<Facture> findByDemandeRef(String reference){
        return factureDao.findByDemandeRef(reference);
    }

    public List<Facture> findByDemandeRefAndTrimestre(String reference, Integer trim){
        return factureDao.findByDemandeRefAndDemandeTrimestre(reference, trim);
    }

    public List<Facture> findByDemandeRefAndTypeOperationLibelle(String reference, String type){
        System.out.print("ref: "+ reference + "type: " + type);
        return factureDao.findByDemandeRefAndTypeOperationLibelle(reference, type);
    }
}