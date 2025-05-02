@import thed3er.matchsaver.domain.Category
@import thed3er.matchsaver.domain.Season
@import java.util.List

@param List<Season> seasons
@param List<Category> categories

@template.layout.default(
content = @`
    <form action="/tournament/save" method="post" class="bg-white rounded-lg shadow-md p-6">
        <h3 class="text-lg font-semibold text-blue-700 mb-4">Přidat nový turnaj</h3>
    
        <div class="mb-4">
            <label for="name" class="block text-gray-700 font-medium mb-2">Název turnaje</label>
            <input type="text" id="name" name="name" required
                   class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <div class="mb-4">
            <label for="date" class="block text-gray-700 font-medium mb-2">Datum konání</label>
            <input type="date" id="date" name="date" required
                   class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <div class="mb-4">
            <label for="location" class="block text-gray-700 font-medium mb-2">Místo konání</label>
            <input type="text" id="location" name="location" required
                   class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>
    
        <div class="mb-4">
            <label for="season" class="block text-gray-700 font-medium mb-2">Sezóna</label>
            <select id="season"
                    name="season"
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                    required
            >
                <option value="" disabled selected>Vyberte sezónu</option>
                @for(Season season : seasons)
                    <option value="${season.getId()}">${season.getName()}</option>
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
                    <option value="${category.getId()}">${category.getName()}</option>
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
        </div>
    
        <button type="submit"
                class="w-full bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition-colors">
            Přidat turnaj
        </button>
    </form>
`
))