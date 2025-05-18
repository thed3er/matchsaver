package thed3er.matchsaver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import thed3er.matchsaver.domain.Category;
import thed3er.matchsaver.domain.Season;
import thed3er.matchsaver.domain.Tournament;
import thed3er.matchsaver.repository.CategoryRepository;
import thed3er.matchsaver.repository.SeasonRepository;
import thed3er.matchsaver.repository.TournamentRepository;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/seasons")
public class SeasonController {

    private final SeasonRepository seasonRepository;
    private final CategoryRepository categoryRepository;
    private final TournamentRepository tournamentRepository;

    public SeasonController(SeasonRepository seasonRepository, CategoryRepository categoryRepository, TournamentRepository tournamentRepository) {
        this.seasonRepository = seasonRepository;
        this.categoryRepository = categoryRepository;
        this.tournamentRepository = tournamentRepository;
    }

    @RequestMapping("")
    public String listSeasons(@RequestParam(required = false) Season season, @RequestParam(required = false) Category category, Model model) {
        List<Season> seasons = seasonRepository.findAll();
        if (season != null) {
            model.addAttribute("selectedSeason", season);
        }
        if (category != null) {
            model.addAttribute("selectedCategory", category);
        }
        //model.addAttribute("selectedSeason", season);

        model.addAttribute("seasons", seasons);
        return "pages/seasons";
    }

    @GetMapping("/categoriesInSeason")
    public String listAllTournamentsInCategory(Model model, Long id) {
        Category category = categoryRepository.findById(id).orElse(null);
        if (category != null) {
            model.addAttribute("category", category);
            return "categories/tournaments";
        } else {
            return "redirect:/categories";
        }
    }

    @GetMapping("/tournamentsByCategory")
    public String listAllTournamentsInCategory(Model model, @RequestParam("category") Long categoryId, @RequestParam("seasonIdInput") Long seasonId) {
        Set<Tournament> tournaments = tournamentRepository.findBySeason_IdAndCategory_IdAndActive(seasonId, categoryId, true);

        model.addAttribute("categoryId", categoryId);
        model.addAttribute("seasonId", seasonId);
        model.addAttribute("tournaments", tournaments);
        return "pages/tournaments-by-category";

    }

    @GetMapping("/categoriesBySeason")
    public String getCategoriesBySeason(Model model, @RequestParam("season") Long seasonId, @RequestParam(required = false) Long categoryId) {
        Season season = seasonRepository.findById(seasonId).orElse(null);
        if (season != null) {
            Set<Tournament> tournaments = tournamentRepository.findBySeason(season);
            Set<Category> categories = tournaments.stream()
                    .map(Tournament::getCategory)
                    .collect(Collectors.toSet());

            model.addAttribute("categories", categories);
            if (categoryId != null) {
                model.addAttribute("selectedCategory", categoryRepository.getCategoriesById(categoryId));
            }
            model.addAttribute("season", season);
            return "pages/categories-by-season";
        } else {
            return "redirect:/seasons/";
        }
    }
}
