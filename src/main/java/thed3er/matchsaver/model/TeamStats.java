package thed3er.matchsaver.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TeamStats {
    private int wins;
    private int losses;
    private int draws;
    private int overtimeWins;
    private int overtimeLosses;
    
    // Calculate total points based on the stats
    public int getTotalPoints() {
        // Points calculation based on the constants in TournamentCalculator
        return (wins * 3) + (overtimeWins * 2) + (overtimeLosses);
    }
}