package thed3er.matchsaver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import thed3er.matchsaver.domain.Category;
import thed3er.matchsaver.domain.Match;
import thed3er.matchsaver.domain.Season;
import thed3er.matchsaver.domain.Tournament;
import thed3er.matchsaver.model.TeamStats;
import thed3er.matchsaver.repository.CategoryRepository;
import thed3er.matchsaver.repository.SeasonRepository;
import thed3er.matchsaver.repository.TeamRepository;
import thed3er.matchsaver.repository.TournamentRepository;
import thed3er.matchsaver.utility.TournamentCalculator;

import java.util.*;


@Controller
@RequestMapping("/team")
public class TeamController {

    private final CategoryRepository categoryRepository;
    private final SeasonRepository seasonRepository;
    private final TournamentRepository tournamentRepository;

    public TeamController(CategoryRepository categoryRepository, SeasonRepository seasonRepository, TournamentRepository tournamentRepository) {
        this.categoryRepository = categoryRepository;
        this.seasonRepository = seasonRepository;
        this.tournamentRepository = tournamentRepository;
    }

    @GetMapping("/stats")
    public String stats(Model model, @RequestParam("category") Long categoryId, @RequestParam("season") Long seasonId) {
        Category category = categoryRepository.findById(categoryId).orElse(null);
        Season season = seasonRepository.findById(seasonId).orElse(null);
        Set<Tournament> tournaments = tournamentRepository.findBySeason_IdAndCategory_Id(seasonId, categoryId);
        Map<String, TeamStats> teamStats = new HashMap<>();
        if (!tournaments.isEmpty()) {
            List<Match> matchesInSeasonAndCategory = tournaments.stream()
                    .flatMap(tournament -> tournament.getMatches().stream())
                    .toList();
            teamStats = TournamentCalculator.vypocitejBodyTymu(matchesInSeasonAndCategory);
        }
        model.addAttribute("category", category);
        model.addAttribute("season", season);
        model.addAttribute("teamStats", teamStats);
        return "pages/stats";
    }

}
