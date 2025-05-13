package thed3er.matchsaver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import thed3er.matchsaver.domain.Category;
import thed3er.matchsaver.domain.Season;
import thed3er.matchsaver.domain.Tournament;

import java.util.List;
import java.util.Set;

@Repository
public interface TournamentRepository extends JpaRepository<Tournament, Long> {

    Set<Tournament> findBySeason_IdAndCategory_IdAndActive(Long seasonId, Long categoryId, boolean active);

    List<Tournament> findBySeason(Season season);

    Tournament findByName(String name);

    List<Tournament> findByCategory(Category category);
}
