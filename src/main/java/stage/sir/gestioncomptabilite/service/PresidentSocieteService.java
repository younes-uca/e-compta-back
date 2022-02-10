package stage.sir.gestioncomptabilite.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import stage.sir.gestioncomptabilite.bean.PresidentSociete;
import stage.sir.gestioncomptabilite.dao.PresidentSocieteDao;

import java.util.List;
import java.util.Optional;

@Service
public class PresidentSocieteService {
    @Autowired
    PresidentSocieteDao presidentSocieteDao;

    public List<PresidentSociete> findAll(){
        return presidentSocieteDao.findAll();
    }
    public Optional<PresidentSociete> findById(Long id){
        return presidentSocieteDao.findById(id);
    }
    public PresidentSociete findByCin(String cin){
        return presidentSocieteDao.findByCin(cin);
    }

    public PresidentSociete save(PresidentSociete presidentSociete){
        PresidentSociete foundedPrésident = presidentSocieteDao.findByCin(presidentSociete.getCin());
        if(foundedPrésident != null){
            return null;
        }
        else{
            presidentSocieteDao.save(presidentSociete);
            return presidentSociete;
        }
    }

}
