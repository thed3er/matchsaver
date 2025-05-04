@import thed3er.matchsaver.domain.Season
@import java.util.List

@param List<Season> seasons

@template.layout.default(
content = @`
    <div class="space-y-6">
        <h1 class="text-2xl font-bold text-center mb-6 text-blue-700 md:text-3xl">Vyberte sezónu</h1>

        @if(seasons.isEmpty())
            <div class="bg-white rounded-lg shadow-md p-6 text-center">
                <p class="text-gray-600 italic">Žádné sezóny nebyly nalezeny.</p>
            </div>
        @else
            <form class="bg-white rounded-lg shadow-md p-6 mb-6">
                <div class="mb-4">
                    <label for="season" class="block text-sm font-medium text-gray-700 mb-2">Sezóna:</label>
                    <select
                            id="season"
                            name="season"
                            hx-get="/seasons/categoriesBySeason"
                            hx-trigger="change"
                            hx-target="#categories-container"
                            hx-include="[name='season']"
                            class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 text-base"
                    >
                        <option> Vyberte sezónu</option>
                        @for(Season season : seasons)
                            <option value="${season.getId()}">${season.getName()}</option>
                        @endfor
                    </select>
                </div>
            </form>
            <div id="categories-container" class="mt-4">
                <!-- Sem se načtou kategorie -->
            </div>
        @endif
    </div>
`
)
