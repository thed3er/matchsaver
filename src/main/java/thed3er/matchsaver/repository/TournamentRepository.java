package thed3er.matchsaver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import thed3er.matchsaver.domain.Tournament;

@Repository
public interface TournamentRepository extends JpaRepository<Tournament, Long> {

}
