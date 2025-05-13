package thed3er.matchsaver.controller;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import thed3er.matchsaver.domain.Match;
import thed3er.matchsaver.domain.Tournament;
import thed3er.matchsaver.model.TeamStats;
import thed3er.matchsaver.repository.*;
import thed3er.matchsaver.utility.PdfGenerator;
import thed3er.matchsaver.utility.TemplateRenderer;
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


    private final TemplateRenderer templateRenderer;
    private final PdfGenerator pdfGenerator;

    public TournamentController(TournamentRepository tournamentRepository, MatchRepository matchRepository, SeasonRepository seasonRepository, CategoryRepository categoryRepository, TeamRepository teamRepository, TemplateRenderer templateRenderer, PdfGenerator pdfGenerator) {
        this.tournamentRepository = tournamentRepository;
        this.matchRepository = matchRepository;
        this.seasonRepository = seasonRepository;
        this.categoryRepository = categoryRepository;
        this.teamRepository = teamRepository;
        this.templateRenderer = templateRenderer;
        this.pdfGenerator = pdfGenerator;
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





    @GetMapping("/match-form")
    public String getMatchForm(@RequestParam Long seasonId, @RequestParam Long categoryId, @RequestParam Integer index, @RequestParam(required = false) Match match, Model model) {
        model.addAttribute("teams", teamRepository.findAllByCategory_Id(categoryId));
        model.addAttribute("match", match);
        model.addAttribute("index", index);
        return "fragments/match-form";
    }

    @GetMapping("/{tournamentId}/pdf")
    public void generatePdf(@PathVariable("tournamentId") Long tournamentId, HttpServletResponse response) throws Exception {
        Tournament tournament = tournamentRepository.findById(tournamentId).orElse(null);
        if (tournament != null) {
            List<Match> matches = matchRepository.findAllByTournament_Id(tournamentId);
            if (!matches.isEmpty()) {
                Map<String, TeamStats> teamStats = TournamentCalculator.vypocitejBodyTymu(matches);

                Map<String, Object> params = Map.of(
                        "teamStats", teamStats,
                        "matches", matches
                );
                String htmlContent = templateRenderer.render("template.jte", params);

                response.setContentType(MediaType.APPLICATION_PDF_VALUE);
                response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=generated.pdf");

                // Generování PDF
                String outputPath = "output.pdf";
                pdfGenerator.generatePdf(htmlContent, response.getOutputStream());
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        }
    }
}
