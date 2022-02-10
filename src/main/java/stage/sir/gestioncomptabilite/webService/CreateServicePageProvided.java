package stage.sir.gestioncomptabilite.webService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import stage.sir.gestioncomptabilite.bean.CreateSocietePage;
import stage.sir.gestioncomptabilite.service.CreateSocietePageService;

import java.util.List;

@RestController
@RequestMapping(value = "gestion-comptabilite/createSocietePage")
public class CreateServicePageProvided {

    @Autowired
    CreateSocietePageService createSocietePageService;

    @GetMapping("/")
    public List<CreateSocietePage> findAll() {
        return createSocietePageService.findAll();
    }
}
