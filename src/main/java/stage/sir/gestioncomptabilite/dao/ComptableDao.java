package stage.sir.gestioncomptabilite.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import stage.sir.gestioncomptabilite.bean.Comptable;

@Repository
public interface ComptableDao extends JpaRepository<Comptable,Long> {
    public Comptable findByCode(String code);
    public int deleteByCode(String code);
    public List<Comptable>  findByType(String type);
}
