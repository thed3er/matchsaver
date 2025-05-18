package thed3er.matchsaver.domain;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Setter
@Getter
@ToString(exclude = "tournaments")
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Season {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    // Property to indicate if the season is active (latest season)
    private Boolean visible = false;

    @OneToMany(mappedBy = "season", fetch = FetchType.LAZY)
    private List<Tournament> tournaments = new ArrayList<>();

}
