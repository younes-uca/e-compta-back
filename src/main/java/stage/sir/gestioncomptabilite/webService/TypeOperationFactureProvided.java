package stage.sir.gestioncomptabilite.webService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import stage.sir.gestioncomptabilite.bean.TypeOperationFacture;
import stage.sir.gestioncomptabilite.service.TypeOperationFactureService;

import java.util.List;

@RestController
@RequestMapping(value = "gestion-comptabilite/type-operation")
public class TypeOperationFactureProvided {

    @Autowired
    TypeOperationFactureService typeOperationFactureService;

    @GetMapping("/")
    public List<TypeOperationFacture> findAll() {
        return typeOperationFactureService.findAll();
    }

}
