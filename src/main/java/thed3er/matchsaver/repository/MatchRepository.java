package thed3er.matchsaver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import thed3er.matchsaver.domain.Match;

@Repository
public interface MatchRepository extends JpaRepository<Match, Long> {

}
