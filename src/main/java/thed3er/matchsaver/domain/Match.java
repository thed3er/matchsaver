package thed3er.matchsaver.domain;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Setter
@Getter
@ToString(exclude = {"tournament", "homeTeam", "awayTeam"})
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Match {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "tournament_id")
    private Tournament tournament;

    @ManyToOne
    @JoinColumn(name = "team_home_id")
    private Team homeTeam;

    @ManyToOne
    @JoinColumn(name = "team_away_id")
    private Team awayTeam;

    private int homeTeamScore;

    private int awayTeamScore;

    private boolean overTime = false;

}
