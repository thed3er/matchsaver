package thed3er.matchsaver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import thed3er.matchsaver.domain.Category;
import thed3er.matchsaver.repository.CategoryRepository;

import java.util.List;

@Controller
@RequestMapping("/categories")
public class CategoryController {

    private final CategoryRepository categoryRepository;

    public CategoryController(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("/")
    public String listCategories(Model model) {
        List<Category> teams = categoryRepository.findAll();
        model.addAttribute("teams", teams);
        return "categories/list";
    }

    public String listAllTournamentsInCategory(Model model, Long id) {
        Category category = categoryRepository.findById(id).orElse(null);
        if (category != null) {
            model.addAttribute("category", category);
            return "categories/tournaments";
        } else {
            return "redirect:/categories";
        }
    }


}
