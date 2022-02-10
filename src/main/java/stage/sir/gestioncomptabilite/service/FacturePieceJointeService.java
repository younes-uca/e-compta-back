package stage.sir.gestioncomptabilite.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stage.sir.gestioncomptabilite.bean.FacturePieceJointe;
import stage.sir.gestioncomptabilite.dao.FacturePieceJointeDao;

@Service
public class FacturePieceJOinteService {
    
    @Autowired
    FacturePieceJointeDao facturePieceJointeDao;

    public FacturePieceJointe findByName(String name){
        return facturePieceJointeDao.findByName(name);
    }

    public FacturePieceJointe findById(Long id) {
		return facturePieceJointeDao.findById(id).get();
	}

	public FacturePieceJointe save(FacturePieceJointe facturePieceJointe){
        return facturePieceJointeDao.save(facturePieceJointe);
    }

}
