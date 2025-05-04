package thed3er.matchsaver.domain;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Setter
@Getter
@ToString(exclude = {"tournaments", "teams"})
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @OneToMany(mappedBy = "category")
    private List<Tournament> tournaments;

    @OneToMany(mappedBy = "category")
    private List<Team> teams;

}
