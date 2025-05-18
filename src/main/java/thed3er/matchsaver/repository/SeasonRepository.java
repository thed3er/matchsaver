package thed3er.matchsaver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import thed3er.matchsaver.domain.Season;

import java.util.List;

@Repository
public interface SeasonRepository extends JpaRepository<Season, Long> {
    Season findByName(String name);

    List<Season> findAllByVisible(Boolean visible);
}
