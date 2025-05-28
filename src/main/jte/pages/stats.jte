@import java.util.Map
@import thed3er.matchsaver.domain.Category
@import thed3er.matchsaver.domain.Season
@import thed3er.matchsaver.model.TeamStats

@param Map<String, TeamStats> teamStats
@param Category category
@param Season season


@template.layout.default(
content = @`
    <div class="space-y-6">
        <h1 class="text-2xl font-bold text-center mb-6 text-blue-700 md:text-3xl">Statistiky týmů (${category.getName()}, ${season.getName()})</h1>

        @if(teamStats.isEmpty())
            <div class="bg-white rounded-lg shadow-md p-6 text-center">
                <p class="text-gray-600 italic">Žádné zápasy nebyly nalezeny.</p>
            </div>
        @else
            <div class="bg-white rounded-lg shadow-md p-2">
                <div class="overflow-x-auto">
                    <table class="w-full divide-y divide-gray-200 table-fixed rounded-lg overflow-hidden">
                        <thead class="bg-gray-50">
                            <tr>
                                <th scope="col" class="w-1/3 px-3 py-2 text-xs font-medium text-gray-500 uppercase tracking-wider">Tým</th>
                                <th scope="col" class="w-1/8 px-2 py-2 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    <span class="hidden md:inline">Výhry</span>
                                    <span class="md:hidden">V</span>
                                </th>
                                <th scope="col" class="w-1/8 px-2 py-2 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    <span class="hidden md:inline">Prohry</span>
                                    <span class="md:hidden">P</span>
                                </th>
                                <th scope="col" class="w-1/8 px-2 py-2 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    <span class="hidden md:inline">Remízy</span>
                                    <span class="md:hidden">R</span>
                                </th>
                                <th scope="col" class="w-1/8 px-2 py-2 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    <span class="hidden md:inline">Výhry v prodl.</span>
                                    <span class="md:hidden">VVP</span>
                                </th>
                                <th scope="col" class="w-1/8 px-2 py-2 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    <span class="hidden md:inline">Prohry v prodl.</span>
                                    <span class="md:hidden">PVP</span>
                                </th>
                                <th scope="col" class="w-1/8 px-2 py-2 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    <span class="hidden md:inline">Body</span>
                                    <span class="md:hidden">B</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            @for(Map.Entry<String, TeamStats> entry : teamStats.entrySet())
                                <tr class="whitespace-nowrap py-4">
                                    <td class="px-3 py-4">
                                        <div class="text-sm font-medium text-gray-900 whitespace-normal">${entry.getKey()}</div>
                                    </td>
                                    <td class="px-2 py-4">
                                        <div class="text-sm text-center text-gray-900">${entry.getValue().getWins()}</div>
                                    </td>
                                    <td class="px-2 py-4">
                                        <div class="text-sm text-center text-gray-900">${entry.getValue().getLosses()}</div>
                                    </td>
                                    <td class="px-2 py-4">
                                        <div class="text-sm text-center text-gray-900">${entry.getValue().getDraws()}</div>
                                    </td>
                                    <td class="px-2 py-4">
                                        <div class="text-sm text-center text-gray-900">${entry.getValue().getOvertimeWins()}</div>
                                    </td>
                                    <td class="px-2 py-4">
                                        <div class="text-sm text-center text-gray-900">${entry.getValue().getOvertimeLosses()}</div>
                                    </td>
                                    <td class="px-2 py-4">
                                        <div class="text-sm text-center font-bold text-blue-800">${entry.getValue().getTotalPoints()}</div>
                                    </td>
                                </tr>
                            @endfor
                        </tbody>
                    </table>
                </div>
            </div>
        @endif
    <div class="mt-8 text-center">
        <a href="/seasons?season=${season.getId()}&category=${category.getId()}"
           class="block w-full px-6 py-3 bg-blue-100 hover:bg-blue-300 text-gray-800 rounded-md transition-colors duration-200">
            Zpět na výběr kategorie
        </a>
    </div>
    </div>
`
)