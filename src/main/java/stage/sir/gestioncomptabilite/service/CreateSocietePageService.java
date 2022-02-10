package stage.sir.gestioncomptabilite.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import stage.sir.gestioncomptabilite.bean.CreateSocietePage;
import stage.sir.gestioncomptabilite.dao.CreateSocietePageDao;

import java.util.List;

@Service
public class CreateSocietePageService {

    @Autowired
    CreateSocietePageDao createSocietePageDao;
    public List<CreateSocietePage> findAll() {
        return createSocietePageDao.findAll();
    }

}
