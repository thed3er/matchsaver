package thed3er.matchsaver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class HomeController {

    public HomeController() {
    }

    @RequestMapping("")
    public ModelAndView home(Model model) {

        return new ModelAndView("redirect:/seasons");
    }
}
