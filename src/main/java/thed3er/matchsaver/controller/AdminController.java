package thed3er.matchsaver.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import thed3er.matchsaver.domain.*;
import thed3er.matchsaver.repository.CategoryRepository;
import thed3er.matchsaver.repository.SeasonRepository;
import thed3er.matchsaver.repository.TeamRepository;
import thed3er.matchsaver.repository.TournamentRepository;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final TournamentRepository tournamentRepository;
    private final SeasonRepository seasonRepository;
    private final CategoryRepository categoryRepository;
    private final TeamRepository teamRepository;

    public AdminController(TournamentRepository tournamentRepository, SeasonRepository seasonRepository, CategoryRepository categoryRepository, TeamRepository teamRepository) {
        this.tournamentRepository = tournamentRepository;
        this.seasonRepository = seasonRepository;
        this.categoryRepository = categoryRepository;
        this.teamRepository = teamRepository;
    }

    @GetMapping("")
    public String adminPage(Model model) {
        model.addAttribute("tournaments", tournamentRepository.findAll());
        return "pages/admin/admin";
    }

    @GetMapping("/tournaments")
    public String listOfTournaments(Model model, @RequestParam(required = false) Season season, @RequestParam(required = false) Category category) {
        model.addAttribute("seasons", seasonRepository.findAll());
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("selectedSeasonId", season != null ? season.getId() : null);
        model.addAttribute("selectedCategoryId", category != null ? category.getId() : null);
        if (season != null || category != null) {
            if (season != null && category != null) {
                model.addAttribute("tournaments", tournamentRepository.findBySeason_IdAndCategory_IdAndActive(season.getId(), category.getId(), true));
            } else if (season != null) {
                model.addAttribute("tournaments", tournamentRepository.findBySeason(season));
            } else {
                model.addAttribute("tournaments", tournamentRepository.findByCategory(category));
            }
            return "fragments/tournament-list";
        }
        return "pages/admin/list-tournaments";
    }

    @GetMapping("/add/tournament")
    public String saveTournament(Model model) {
        model.addAttribute("tournament", new Tournament());
        model.addAttribute("seasons", List.of(seasonRepository.findAllByVisible(true)));
        model.addAttribute("categories", categoryRepository.findAll());
        return "pages/save-tournament-with-matches";
    }

    @PostMapping("/save/tournament")
    public String saveTournament(@ModelAttribute Tournament tournament, Model model) {
        model.addAttribute("seasons", List.of(seasonRepository.findAllByVisible(true)));
        model.addAttribute("categories", categoryRepository.findAll());
        if (tournament.getMatches() == null) {
            model.addAttribute("errorMessage", "Turnaj musí mít nějaké zápasy");
            return "pages/save-tournament-with-matches";
        }
        // Zkontrolovat zda nějaký zápas není proti stejnému týmu
        for (Match match : tournament.getMatches()) {
            if (match.getHomeTeam().equals(match.getAwayTeam())) {
                model.addAttribute("errorMessage", "Zápas nemůže být proti stejnému týmu");
                return "pages/save-tournament-with-matches";
            }
            if (match.isOverTime() && (match.getAwayTeamScore() == match.getHomeTeamScore())) {
                model.addAttribute("errorMessage", "Zápas nemůže skončit se stejným skóre pokud je nastavené prodloužení");
                return "pages/save-tournament-with-matches";
            }
        }
        tournament.setCreatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        tournament.setCreatedAt(LocalDate.now());
        for (Match match : tournament.getMatches()) {
            match.setTournament(tournament);
        }
        Tournament savedTournament = tournamentRepository.save(tournament);
        model.addAttribute("succesMessage", "Turnaj byl úspěšně uložen");
        return "pages/admin/admin";
    }

    @DeleteMapping("/delete/{tournamentId}")
    public String deleteTournament(Model model, @PathVariable("tournamentId") Long tournamentId) {
        Tournament tournament = tournamentRepository.findById(tournamentId).orElse(null);

        if (tournament != null) {
            tournamentRepository.delete(tournament);
        }
        return "redirect:/seasons";
    }

    @GetMapping("/add/team")
    public String addTeam(Model model) {
        model.addAttribute("categories", categoryRepository.findAll());
        return "pages/team-add";
    }

    @PostMapping("/save/team")
    public String saveTeam(@RequestParam("category") List<Category> categories, @RequestParam("name") String name) {
        for (Category category : categories) {
            if (category != null) {
                Team team = new Team();
                team.setName(name);
                team.setCategory(category);
                teamRepository.save(team);
            }
        }
        return "pages/admin/admin";
    }
}
