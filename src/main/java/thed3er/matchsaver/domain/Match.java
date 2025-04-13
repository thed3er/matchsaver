package thed3er.matchsaver.domain;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Match {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Tournament tournament;

    @ManyToOne
    @JoinColumn(name = "team_id", nullable = false, insertable=false, updatable=false)
    private Team homeTeam;

    @ManyToOne
    @JoinColumn(name = "team_id", nullable = false, insertable=false, updatable=false)
    private Team awayTeam;

    private int homeTeamScore;

    private int awayTeamScore;

}
