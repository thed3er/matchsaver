@import thed3er.matchsaver.domain.Category
@import thed3er.matchsaver.domain.Season
@import thed3er.matchsaver.domain.Tournament
@import thed3er.matchsaver.domain.Match
@import java.time.format.DateTimeFormatter
@import java.util.List

@param Tournament tournament
@param List<Season> seasons
@param List<Category> categories

@param String errorMessage = null

@template.layout.admin-layout(
content = @`

    @if(errorMessage != null)
        <div class="bg-red-500 rounded-lg p-6 text-white mb-5">${errorMessage}</div>
    @endif
    <form action="/admin/save/tournament" method="post" class="bg-white rounded-lg shadow-md p-6">
        <h3 class="text-lg font-semibold text-blue-700 mb-4">Přidat nový turnaj</h3>
    
        <div class="mb-4">
            <label for="name" class="block text-gray-700 font-medium mb-2">Název turnaje</label>
            <input type="text" 
                   id="name"
                   name="name"
                   value="${tournament.getName()}"
                   required
                   class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <div class="mb-4">
            <label for="date" class="block text-gray-700 font-medium mb-2">Datum konání</label>
            <input type="date"
                   id="date"
                   name="date"

                   required
                   class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <div class="mb-4">
            <label for="location" class="block text-gray-700 font-medium mb-2">Místo konání</label>
            <input type="text"
                   id="location"
                   name="location"
                   value="${tournament.getLocation()}"
                   required
                   class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>
    
        <div class="mb-4">
            <label for="season" class="block text-gray-700 font-medium mb-2">Sezóna</label>
            <select id="season"
                    name="season"
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                    required
            >
                <option value=""
                        disabled
                        selected="${tournament.getSeason() == null}"
                >
                    Vyberte sezónu
                </option>
                @for(Season season : seasons)
                    <option value="${season.getId()}"
                            selected="${tournament.getSeason() != null && tournament.getSeason().getId().equals(season.getId())}">
                        ${season.getName()}
                    </option>
                @endfor
            </select>
        </div>
    
        <div class="mb-4">
            <label for="category" class="block text-gray-700 font-medium mb-2">Kategorie</label>
            <select id="category"
                    name="category"
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                    required
            >
                <option value="" disabled selected>Vyberte kategorii</option>
                @for(Category category : categories)
                    <option value="${category.getId()}"
                            selected="${tournament.getCategory() != null && tournament.getCategory().getId().equals(category.getId())}"
                    >
                        ${category.getName()}
                    </option>
                @endfor
            </select>
        </div>
    
        <div class="mb-4">
            <h4 class="text-md font-semibold text-gray-700 mb-2">Zápasy</h4>
            <div id="matches-container">
                <!-- Dynamicky přidané zápasy -->
            </div>
            <button type="button"
                    hx-get="/tournament/match-form"
                    hx-target="#matches-container"
                    hx-swap="beforeend"
                    hx-vals='js:{"seasonId": document.getElementById("season").value,
                                "categoryId": document.getElementById("category").value,
                                "index": document.querySelectorAll(".match-item").length
                              }'
                    class="mt-2 bg-green-500 text-white py-1 px-3 rounded-md hover:bg-green-600 transition-colors">
                Přidat zápas
            </button>

            @if(tournament.getMatches() != null && !tournament.getMatches().isEmpty())
                @for(Match match : tournament.getMatches())
                    <input type="hidden"
                           hx-get="/tournament/match-form"
                           hx-target="#matches-container"
                           hx-trigger="load"
                           hx-swap="beforeend"
                           hx-vals='js:{"seasonId": document.getElementById("season").value,
                                "categoryId": document.getElementById("category").value,
                                "index": document.querySelectorAll(".match-item").length,

                              }'
                    >
                @endfor
            @endif
        </div>
    
        <button type="submit"
                class="w-full bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition-colors">
            Přidat turnaj
        </button>
    </form>
`
)