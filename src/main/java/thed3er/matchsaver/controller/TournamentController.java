package thed3er.matchsaver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import thed3er.matchsaver.domain.Match;
import thed3er.matchsaver.domain.Tournament;
import thed3er.matchsaver.model.TeamStats;
import thed3er.matchsaver.repository.*;
import thed3er.matchsaver.utility.TournamentCalculator;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/tournament")
public class TournamentController {

    private final TournamentRepository tournamentRepository;
    private final MatchRepository matchRepository;
    private final SeasonRepository seasonRepository;
    private final CategoryRepository categoryRepository;
    private final TeamRepository teamRepository;

    public TournamentController(TournamentRepository tournamentRepository, MatchRepository matchRepository, SeasonRepository seasonRepository, CategoryRepository categoryRepository, TeamRepository teamRepository) {
        this.tournamentRepository = tournamentRepository;
        this.matchRepository = matchRepository;
        this.seasonRepository = seasonRepository;
        this.categoryRepository = categoryRepository;
        this.teamRepository = teamRepository;
    }

    @GetMapping("/{tournamentId}")
    public String listMatchesInTournament(Model model, @PathVariable("tournamentId") Long tournamentId) {
        List<Match> matches = matchRepository.findAllByTournament_Id(tournamentId);
        if (!matches.isEmpty()) {
            Map<String, TeamStats> teamStats = TournamentCalculator.vypocitejBodyTymu(matches);
            model.addAttribute("teamStats", teamStats);
            model.addAttribute("matches", matches);
            return "pages/matches-in-tournament";
        } else {
            return "redirect:/seasons}";
        }
    }

    @GetMapping("/add")
    public String saveTournament(Model model) {
        model.addAttribute("tournament", new Tournament());
        model.addAttribute("seasons", seasonRepository.findAll());
        model.addAttribute("categories", categoryRepository.findAll());
        return "pages/save-tournament-with-matches";
    }

    @PostMapping("/save")
    public String saveTournament(@ModelAttribute Tournament tournament, Model model) {
        for (Match match : tournament.getMatches()) {
            match.setTournament(tournament);
        }
        Tournament savedTournament = tournamentRepository.save(tournament);
        return "";
    }

    @GetMapping("/match-form")
    public String getMatchForm(@RequestParam Long seasonId, @RequestParam Long categoryId, @RequestParam Integer index, Model model) {
        model.addAttribute("teams", teamRepository.findAllByCategory_Id(categoryId));
        model.addAttribute("index", index);
        return "fragments/match-form";
    }
}
