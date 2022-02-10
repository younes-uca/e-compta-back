package stage.sir.gestioncomptabilite.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import stage.sir.gestioncomptabilite.bean.Demande;
import stage.sir.gestioncomptabilite.bean.Employe;
import stage.sir.gestioncomptabilite.bean.PieceJointSociete;
import stage.sir.gestioncomptabilite.bean.PresidentSociete;
import stage.sir.gestioncomptabilite.bean.Societe;
import stage.sir.gestioncomptabilite.config.DateUtil;
import stage.sir.gestioncomptabilite.dao.EmployeDao;
import stage.sir.gestioncomptabilite.dao.SocieteDao;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

@Service
public class SocieteService {

    @Autowired
    SocieteDao societeDao;
    @Autowired
    EmployeDao employeDao;
    
    @Autowired
    PresidentSocieteService presidentSocieteService;
    @Autowired
    DemandeService demandeService;
    @Autowired
    PieceJointSocieteService pieceJointSocieteService;

    
    
    
    
    
   /* 
    public Societe findByLoginAndPassword(String login, String password) {
		return societeDao.findByLoginAndPassword(login, password);
	}
    
    
    public Societe loginSociete(Societe societe) throws Exception {
    	String log=societe.getLogin();
    	String password=societe.getPassword();
    	Societe userSociete=null;
    	if (log!=null && password!=null) {
    		
			userSociete=fetchLoginByLogAndPassword(log, password);
		}
    	if (userSociete==null) {
    		
			throw new Exception("login is too bad");
		}
    	
    	return userSociete;
    	
    	
    }
    
    
    public Societe fetchLoginByLogAndPassword(String login,String password) {
    	return societeDao.findByLoginAndPassword(login, password);
    }*/

	//public Societe findByIce(String ice) {




    public Societe findByIce(String ice) {

        return societeDao.findByIce(ice);
    }

    @Transactional
    public int deleteByIce(String ice) {
        return societeDao.deleteByIce(ice);
    }

    public List<Societe> findAll() {
        return societeDao.findAll();
    }
    public List<Employe> findListEmployes(String ice){
    	List<Employe> employes=employeDao.findBySocieteEmpIce(ice);
    	return employes;	
    }

    public int save(Societe societe) {
        if(findByIce(societe.getIce()) != null){
            return -1;
        }
        else{
            Long days = DateUtil.diffDays(new Date(), societe.getDateCreation());
            Long agee = days/365;
            Double ageSociete = (double) agee;
            societe.setAge(ageSociete);
            societe.setEtatSociete(null);
            societe.setComptable(null);
            societeDao.save(societe);
            return 1;
        }
    }
    public int save2(Societe societe) {
        if(findByIce(societe.getIce()) != null){
            return -1;
        }
        else{
            societeDao.save(societe);
            return 1;
        }
    }
    public void update(Societe societe){
        societeDao.save(societe);
    }
    public void uploadFile(MultipartFile file, String societeIce, String name, String description){
        Societe societe = societeDao.findByIce(societeIce);
        PieceJointSociete societePieceJointe = new PieceJointSociete();
        String path = System.getProperty("user.home") + "\\societe-pieces-jointes\\";
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
        societe.setIce(societeIce);
        societePieceJointe.setName(name);
        societePieceJointe.setDescription(description);
        societePieceJointe.setPath(path + fileName);
        societePieceJointe.setSociete(societe);
        PieceJointSociete savedSocietePieceJointe = pieceJointSocieteService.save(societePieceJointe);
    }

    public int uploadFiles(List<MultipartFile> files, String societeIce, String name, String description) throws IOException {

        Societe societe = societeDao.findByIce(societeIce);
        PieceJointSociete societePieceJointe = new PieceJointSociete();
        String path = System.getProperty("user.home") + "\\societe-pieces-jointes\\";

        File dir = new File(path);
        if (!dir.exists()) {
            dir.mkdir();
        }
            for (MultipartFile file : files) {
                String fileName = System.currentTimeMillis()+"."+file.getOriginalFilename().split("\\.")[1];
                Files.write(Paths.get(path + fileName), file.getBytes());
                societe.setIce(societeIce);
                societePieceJointe.setName(name);
                societePieceJointe.setDescription(description);
                societePieceJointe.setPath(path + fileName);
                societePieceJointe.setSociete(societe);
                PieceJointSociete savedSocietePieceJointe = pieceJointSocieteService.save(societePieceJointe);
            }
            return 1;
    }


    public int save2(Societe societe,PresidentSociete presidentSociete) {
        Demande demande = new Demande();
        if(findByIce(societe.getIce()) != null){
            return -1;
        }
        else{
            Long days = DateUtil.diffDays(new Date(), societe.getDateCreation());
            Long agee = days/365;
            Double ageSociete = (double) agee;
            societe.setAge(ageSociete);
            societe.setAnneeExploitation(0);
            societe.setEtatSociete(null);
            societe.setComptable(null);
            PresidentSociete foundedPresidentSociete = presidentSocieteService.save(presidentSociete);
            societe.setPresidentSociete(foundedPresidentSociete);
            societeDao.save(societe);
            demande.setSociete(societe);
            demandeService.save2(demande);
            return 1;
        }
    }
    
    
    


	
	
}