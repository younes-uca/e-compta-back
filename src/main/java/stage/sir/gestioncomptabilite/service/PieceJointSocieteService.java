package stage.sir.gestioncomptabilite.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import stage.sir.gestioncomptabilite.bean.Facture;
import stage.sir.gestioncomptabilite.bean.FacturePieceJointe;
import stage.sir.gestioncomptabilite.bean.PieceJointSociete;
import stage.sir.gestioncomptabilite.bean.Societe;
import stage.sir.gestioncomptabilite.dao.FacturePieceJointeDao;
import stage.sir.gestioncomptabilite.dao.PieceJointSocieteDao;
import stage.sir.gestioncomptabilite.dao.SocieteDao;

import java.io.File;
import java.io.IOException;

@Service
public class PieceJointSocieteService {

    @Autowired
    PieceJointSocieteDao pieceJointSocieteDao;


    public PieceJointSociete save(PieceJointSociete pieceJointSociete){
        return pieceJointSocieteDao.save(pieceJointSociete);
    }

}
