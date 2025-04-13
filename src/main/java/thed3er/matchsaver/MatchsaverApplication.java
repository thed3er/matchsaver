package thed3er.matchsaver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import thed3er.matchsaver.domain.Category;
import thed3er.matchsaver.domain.Season;
import thed3er.matchsaver.domain.Team;
import thed3er.matchsaver.domain.Tournament;
import thed3er.matchsaver.repository.*;

import java.time.LocalDate;
import java.util.List;

@SpringBootApplication
public class MatchsaverApplication {

	public static void main(String[] args) {
		SpringApplication.run(MatchsaverApplication.class, args);
	}

	@Autowired
	SeasonRepository seasonRepository;

	@Autowired
	CategoryRepository categoryRepository;

	@Autowired
	TournamentRepository tournamentRepository;

	@Autowired
	TeamRepository teamRepository;

	@Autowired
	MatchRepository matchRepository;

	@Bean
	public CommandLineRunner seedData() {
		return args -> {
			System.out.println("Matchsaver application started successfully!");
			//deleteData();

			// Seasons
			if (seasonRepository.count() == 0) {
				System.out.println("Season generation...");
				seasonRepository.saveAll(List.of(
						Season.builder().name("2023/2024").visible(true).build(),
						Season.builder().name("2022/2023").visible(false).build(),
						Season.builder().name("2021/2022").visible(false).build(),
						Season.builder().name("2020/2021").visible(false).build()
				));
			}

			// Categories
			if (categoryRepository.count() == 0) {
				System.out.println("Category generation...");
				categoryRepository.saveAll(List.of(
						Category.builder().name("Mladší žáci").build(),
						Category.builder().name("Starší žáci").build(),
						Category.builder().name("Dorost").build()
				));
			}

			// Tournaments
			if (tournamentRepository.count() == 0) {
				System.out.println("Tournament generation...");
				tournamentRepository.saveAll(List.of(
						Tournament.builder()
								.name("1.turnaj")
								.date(LocalDate.now().plusDays(15))
								.location("Třebíč")
								.category(categoryRepository.findByName("Mladší žáci"))
								.season(seasonRepository.findByName("2023/2024"))
								.build()
				));
			}

			// Teams
			if (teamRepository.count() == 0) {
				System.out.println("Team generation...");
				teamRepository.saveAll(List.of(
						Team.builder()
								.name("Tým A")
								.category(categoryRepository.findByName("Mladší žáci"))
								.build(),
						Team.builder()
								.name("Tým B")
								.category(categoryRepository.findByName("Mladší žáci"))
								.build()
				));
			}

		};
	}

	public void deleteData() {
		// Delete all data from the database
		tournamentRepository.deleteAll();
		teamRepository.deleteAll();
		categoryRepository.deleteAll();
		seasonRepository.deleteAll();
		matchRepository.deleteAll();

		System.out.println("All data deleted from the database.");
	}
}
