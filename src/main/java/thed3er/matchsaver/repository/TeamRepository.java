package thed3er.matchsaver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import thed3er.matchsaver.domain.Team;

@Repository
public interface TeamRepository extends JpaRepository<Team, Long> {

}
