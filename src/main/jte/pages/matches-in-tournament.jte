@import java.util.List
@import java.util.Map
@import thed3er.matchsaver.domain.Match
@import thed3er.matchsaver.model.TeamStats

@param List<Match> matches
@param Map<String, TeamStats> teamStats

@template.layout.default(
content = @`
    <div class="space-y-6">
        <h1 class="text-2xl font-bold text-center mb-6 text-blue-700 md:text-3xl">Zápasy</h1>

        @if(matches.isEmpty())
            <div class="bg-white rounded-lg shadow-md p-6 text-center">
                <p class="text-gray-600 italic">Žádné zápasy nebyly nalezeny.</p>
            </div>
        @else
            <div class="bg-white rounded-lg shadow-md p-4 md:p-6">
                <ul class="divide-y divide-gray-200">
                    @for(Match match : matches)
                        <li class="py-4 first:pt-0 last:pb-0">
                            <div class="flex items-center justify-between">
                                <div class="w-[40%] text-center">
                                    <span class="font-medium text-blue-800">${match.getHomeTeam().getName()}</span>
                                    <span class="text-lg font-bold block">${match.getHomeTeamScore()}</span>
                                </div>

                                <div class="w-[20%] text-center text-gray-500">
                                    vs
                                    @if(match.isOverTime())
                                        <div class="text-md font-bold mt-1">
                                            <span class="bg-gray-200 px-2 py-1 rounded inline-block">P</span>
                                        </div>
                                    @endif
                                    <div class="text-sm mt-1">
                                        <span class="bg-gray-100 px-3 py-1 rounded-full inline-block">
                                            ${match.getTournament().getName()}
                                        </span>
                                    </div>
                                </div>

                                <div class="w-[40%] text-center">
                                    <span class="font-medium text-red-800">${match.getAwayTeam().getName()}</span>
                                    <span class="text-lg font-bold block">${match.getAwayTeamScore()}</span>
                                </div>
                            </div>
                        </li>
                    @endfor
                </ul>
            </div>

            <h2 class="text-xl font-semibold text-center mt-8 mb-4 text-gray-700">Mini tabulka výsledků</h2>
            <div class="bg-white rounded-lg shadow-md p-4 md:p-6">
                <ul class="divide-y divide-gray-200">
                    @for(Map.Entry<String, TeamStats> entry : teamStats.entrySet())
                        <li class="py-3 flex justify-between items-center">
                            <span class="font-medium">${entry.getKey()}</span>
                            <span class="bg-blue-100 text-blue-800 px-3 py-1 rounded-full font-bold">${entry.getValue().getTotalPoints()} bodů</span>
                        </li>
                    @endfor
                </ul>
            </div>
        @endif

        <div class="mt-8 text-center">
            <a href="/seasons?season=${matches.getFirst().getTournament().getSeason().getId()}&category=${matches.getFirst().getTournament().getCategory().getId()}"
               class="block w-full px-6 py-3 bg-blue-100 hover:bg-blue-300 text-gray-800 rounded-md transition-colors duration-200">
                Zpět na výběr kategorie
            </a>
        </div>
    </div>
`
)
