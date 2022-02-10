package stage.sir.gestioncomptabilite.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import stage.sir.gestioncomptabilite.bean.TypeOperationFacture;
import stage.sir.gestioncomptabilite.dao.TypeOperationFactureDao;

import java.util.List;

@Service
public class TypeOperationFactureService {
    @Autowired
    TypeOperationFactureDao typeOperationFactureDao;

    public List<TypeOperationFacture> findAll(){
        return typeOperationFactureDao.findAll();
    }

    public TypeOperationFacture findByLibelle(String libelle) {
        return typeOperationFactureDao.findByLibelle(libelle);
    }
}
