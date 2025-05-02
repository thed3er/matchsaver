package thed3er.matchsaver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import thed3er.matchsaver.domain.Category;
import thed3er.matchsaver.repository.CategoryRepository;
import thed3er.matchsaver.repository.TournamentRepository;

import java.util.List;

@Controller
@RequestMapping("/categories")
public class CategoryController {

    private final CategoryRepository categoryRepository;
    private final TournamentRepository tournamentRepository;

    public CategoryController(CategoryRepository categoryRepository, TournamentRepository tournamentRepository) {
        this.categoryRepository = categoryRepository;
        this.tournamentRepository = tournamentRepository;
    }

    @GetMapping("/")
    public String listCategories(Model model) {
        List<Category> teams = categoryRepository.findAll();
        model.addAttribute("teams", teams);
        return "categories/list";
    }



}
