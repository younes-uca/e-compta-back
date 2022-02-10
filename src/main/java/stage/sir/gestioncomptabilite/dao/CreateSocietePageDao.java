package stage.sir.gestioncomptabilite.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import stage.sir.gestioncomptabilite.bean.CreateSocietePage;

@Repository
public interface CreateSocietePageDao extends JpaRepository<CreateSocietePage, Long> {
}
