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
            <div class="bg-white rounded-lg shadow-md p-6">
                <ul class="divide-y divide-gray-200">
                    @for(Match match : matches)
                        <li class="py-4 first:pt-0 last:pb-0">
                            <div class="flex flex-col space-y-2 md:flex-row md:items-center md:justify-between md:space-y-0">
                                <div class="flex items-center justify-between">
                                    <div class="flex flex-col items-center">
                                        <span class="font-medium text-blue-800">${match.getHomeTeam().getName()}</span>
                                        <span class="text-lg font-bold">${match.getHomeTeamScore()}</span>
                                    </div>

                                    <div class="mx-4 text-gray-500">
                                        vs
                                    </div>

                                    <div class="flex flex-col items-center">
                                        <span class="font-medium text-red-800">${match.getAwayTeam().getName()}</span>
                                        <span class="text-lg font-bold">${match.getAwayTeamScore()}</span>
                                    </div>
                                </div>

                                <div class="text-sm text-gray-500">
                                    <span class="bg-gray-100 px-2 py-1 rounded">
                                        ${match.getTournament().getName()}
                                    </span>
                                </div>
                            </div>
                        </li>
                    @endfor
                </ul>
            </div>

            <h2 class="text-xl font-semibold text-center mt-6 mb-4 text-gray-700">Mini tabulka výsledků</h2>
            <div class="bg-white rounded-lg shadow-md p-6">
                <ul class="divide-y divide-gray-200">
                    @for(Map.Entry<String, TeamStats> entry : teamStats.entrySet())
                        <li class="py-3 flex justify-between items-center">
                            <span class="font-medium">${entry.getKey()}</span>
                            <span class="bg-blue-100 text-blue-800 px-2 py-1 rounded font-bold">${entry.getValue().getTotalPoints()} bodů</span>
                        </li>
                    @endfor
                </ul>
            </div>

        @endif
    </div>
`
)
