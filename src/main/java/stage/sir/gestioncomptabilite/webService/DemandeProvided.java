package stage.sir.gestioncomptabilite.webService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import stage.sir.gestioncomptabilite.bean.Demande;
import stage.sir.gestioncomptabilite.service.DemandeService;
import stage.sir.gestioncomptabilite.vo.DemandeVo;
import stage.sir.gestioncomptabilite.vo.StatistiqueVo;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "gestion-comptabilite/demande")
public class DemandeProvided {

    @Autowired
    DemandeService demandeService;

    @GetMapping("/societe/ice/{ice}")
	public List<Demande> findBySocieteIce(@PathVariable String ice) {
		return demandeService.findBySocieteIce(ice);
	}

	@GetMapping("/comptableValidateur/code/{code}")
	public List<Demande> findBycomptableValidateurCode(@PathVariable String code) {
		return demandeService.findBycomptableValidateurCode(code);
	}

	@GetMapping("/comptableTraiteur/code/{code}")
    public List<Demande> findBycomptableTraiteurCode(@PathVariable String code) {
		return demandeService.findBycomptableTraiteurCode(code);
	}

	@GetMapping("/ref/{ref}")
    public Demande findByRef(@PathVariable String ref) {
        return demandeService.findByRef(ref);
    }

    @DeleteMapping("/ref/{ref}")
    public int deleteByRef(@PathVariable String ref) {
        return demandeService.deleteByRef(ref);
    }

    @GetMapping("/operation/{operation}")
    public List<Demande> findByOperation(@PathVariable String operation) {
        return demandeService.findByOperation(operation);
    }

    @GetMapping("/")
    public List<Demande> findAll() {
        return demandeService.findAll();
    }

    @PostMapping("/recherche-multi-critere/")
    public List<Demande> searchCriteria(@RequestBody DemandeVo demandeVo) {
        return demandeService.searchCriteria(demandeVo);
    }

    @PutMapping("/")
    public int edit(@RequestBody Demande demande) {
        return demandeService.edit(demande);
    }

    @PostMapping("/")
    public int save(@RequestBody Demande demande) {
        return demandeService.save(demande);
    }

    @PostMapping("/save")
    public Demande saveDF(@RequestBody Demande demande) {
        return demandeService.saveDemande(demande, demande.getFactures());
    }

    @GetMapping("/etatDemande/libelle/{libelle}/operation/{operation}")
    List<Demande>  findByEtatDemandeLibelleAndOperation(@PathVariable String libelle,@PathVariable String operation){
        return demandeService. findByEtatDemandeLibelleAndOperation(libelle, operation);
    }

    @GetMapping("/etatDemande/libelle/{libelle}")
    public List<Demande> findByEtatDemandeLibelle(@PathVariable String libelle) {
        return demandeService.findByEtatDemandeLibelle(libelle);
    }
    @GetMapping("/etatDemande/societe/{ice}/etat/{etat}")
    public List<Demande> findBySocieteIceAAndEtatDemandeLibelle(@PathVariable String ice, @PathVariable String etat) {
        return demandeService.findBySocieteIceAAndEtatDemandeLibelle(ice, etat);
    }

    @GetMapping("/societe/ice/{ice}/operation/{operation}")
    List<Demande>  findBySocieteIceAndOperation(@PathVariable String ice,@PathVariable String operation){
        return demandeService.findBySocieteIceAndOperation(ice, operation);
    }

    @GetMapping("/societe/ice/{ice}/etat/{etat}/operation/{operation}")
    public List<Demande> findBySocieteIceAndEtatDemandeLibelleAndOperation(@PathVariable String ice, @PathVariable String etat, @PathVariable String operation) {
        return demandeService.findBySocieteIceAndEtatDemandeLibelleAndOperation(ice, etat, operation);
    }

    @GetMapping("/count/etat-demande/{etatDemande}/operation/{operation}")
    public Long countByEtatDemandeRefAndOperation(@PathVariable String etatDemande, @PathVariable String operation){
        return demandeService.countByEtatDemandeRefAndOperation(etatDemande, operation);
    }

    @GetMapping("/statistique")
    public Map<String, List<StatistiqueVo>> countByIperation(){
        return demandeService.countByIperation();
    }

    @GetMapping("/etatDemande/libelle/{libelle}/operation/{operation}/comptable/traitant/code/{code}")
    public List<Demande> findByEtatDemandeLibelleAndOperationAndComptableTraiteurCode(@PathVariable String libelle,@PathVariable  String operation ,@PathVariable  String code){
	    return demandeService.findByEtatDemandeLibelleAndOperationAndComptableTraiteurCode(libelle, operation, code);
    }
    @GetMapping("/operation/{operation}/comptable/code/{code}")
    List<Demande> findByOperationAndComptableTraiteurCode(@PathVariable String operation,@PathVariable String code){
	    return demandeService.findByOperationAndComptableTraiteurCode(operation,code);
    }
    @GetMapping("/etatDemande/libelle/{libelle}/operation/{operation}/comptable/validateur/code/{code}")
    public List<Demande> findByEtatDemandeLibelleAndOperationAndComptableValidateurCode(@PathVariable String libelle,@PathVariable  String operation ,@PathVariable  String code){
        return demandeService.findByEtatDemandeLibelleAndOperationAndComptableValidateurCode(libelle, operation, code);
    }
    @GetMapping("/operation/{operation}/comptable/validateur/code/{code}")
    List<Demande> findByOperationAndComptableValidateurCode(@PathVariable String operation,@PathVariable String code){
        return demandeService.findByOperationAndComptableValidateurCode(operation,code);
    }



  
    @PostMapping("/save2")
    public int save2(@RequestBody Demande demande) {
        return demandeService.save2(demande);
    }
 
    /*@GetMapping("/countStatistique/operation/{operation}")
    public Map<String, Long> countByEtatDemandeLibelle(@PathVariable String operation){
	    return demandeService.countByEtatDemandeLibelle(operation);
    }*/
   

    @GetMapping("/countStatistique")
    public Map<String,Long> countByEtatDemande(){
        return demandeService.countByEtatDemandeLibelle();}
    @GetMapping("/countStatistique/operation")
    public Map<String, List<StatistiqueVo>> countByOperation(){
        return demandeService.countByIperation();}
  
  



}
