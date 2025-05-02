package thed3er.matchsaver.utility;

import thed3er.matchsaver.domain.Match;
import thed3er.matchsaver.model.TeamStats;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TournamentCalculator {

    private static final int BODY_ZA_VYHRU = 3;
    private static final int BODY_ZA_VYHRU_V_PRODLOUZENI = 2;
    private static final int BODY_ZA_REMIZU = 1;
    private static final int BODY_ZA_PROHRU = 0;

    public static Map<String, TeamStats> vypocitejBodyTymu(List<Match> zapasy) {
        Map<String, TeamStats> teamStatsMap = new HashMap<>();

        // Zpracování každého zápasu
        for (Match zapas : zapasy) {
            String domaciTym = zapas.getHomeTeam().getName();
            String hostujiciTym = zapas.getAwayTeam().getName();
            int skoreDomaciho = zapas.getHomeTeamScore();
            int skoreHostujiciho = zapas.getAwayTeamScore();
            boolean overtime = zapas.isOverTime();

            // Inicializace týmů v mapě, pokud ještě nejsou
            teamStatsMap.putIfAbsent(domaciTym, new TeamStats());
            teamStatsMap.putIfAbsent(hostujiciTym, new TeamStats());

            TeamStats domaciStats = teamStatsMap.get(domaciTym);
            TeamStats hostujiciStats = teamStatsMap.get(hostujiciTym);

            // Výpočet statistik podle výsledku zápasu
            if (skoreDomaciho > skoreHostujiciho) {
                setStatsIfOverTime(overtime, domaciStats, hostujiciStats);
            } else if (skoreDomaciho < skoreHostujiciho) {
                setStatsIfOverTime(overtime, hostujiciStats, domaciStats);
            }
        }

        return teamStatsMap;
    }

    private static void setStatsIfOverTime(boolean overtime, TeamStats domaciStats, TeamStats hostujiciStats) {
        if (overtime) {
            // Výhra domácího týmu v prodloužení
            domaciStats.setOvertimeWins(domaciStats.getOvertimeWins() + 1);
            domaciStats.setDraws(domaciStats.getDraws() + 1);
            hostujiciStats.setOvertimeLosses(hostujiciStats.getOvertimeLosses() + 1);
            hostujiciStats.setDraws(hostujiciStats.getDraws() + 1);
        } else {
            // Výhra domácího týmu
            domaciStats.setWins(domaciStats.getWins() + 1);
            hostujiciStats.setLosses(hostujiciStats.getLosses() + 1);
        }
    }
}
