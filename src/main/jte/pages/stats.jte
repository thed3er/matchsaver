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
            <div class="bg-white rounded-lg shadow-md p-6">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Tým</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Výhry</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prohry</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Remízy</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Výhry v prodloužení</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prohry v prodloužení</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Body</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        @for(Map.Entry<String, TeamStats> entry : teamStats.entrySet())
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-medium text-gray-900">${entry.getKey()}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">${entry.getValue().getWins()}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">${entry.getValue().getLosses()}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">${entry.getValue().getDraws()}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">${entry.getValue().getOvertimeWins()}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">${entry.getValue().getOvertimeLosses()}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-bold text-blue-800">${entry.getValue().getTotalPoints()}</div>
                                </td>
                            </tr>
                        @endfor
                    </tbody>
                </table>
            </div>
        @endif
    </div>
`
)