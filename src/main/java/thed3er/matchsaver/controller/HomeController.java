package thed3er.matchsaver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import thed3er.matchsaver.repository.CategoryRepository;

@Controller
@RequestMapping("/")
public class HomeController {

    public HomeController(CategoryRepository categoryRepository) {
    }

    @RequestMapping("")
    public String home(Model model) {
        return "pages/index";
    }
}
