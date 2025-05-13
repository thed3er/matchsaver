@import thed3er.matchsaver.domain.Season
@import thed3er.matchsaver.domain.Category
@import java.util.List

@param List<Season> seasons
@param List<Category> categories
@param Long selectedSeasonId = null
@param Long selectedCategoryId = null

@template.layout.admin-layout(content =
@`
    <div class="space-y-6">
        <h1 class="text-2xl font-bold text-center mb-6 text-blue-700 md:text-3xl">Seznam turnajů</h1>

        <form class="bg-white rounded-lg shadow-md p-6 mb-6 flex space-x-4"
              hx-get="/admin/tournaments"
              hx-target="#tournaments"
              hx-trigger="change"
        >
            <div class="flex-1">
                <label for="season" class="block text-sm font-medium text-gray-700 mb-2">Sezóna:</label>
                <select
                        id="season"
                        name="season"
                        class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 text-base"
                >
                    <option value="">Vyberte sezónu</option>
                    @for(Season season : seasons)
                        <option value="${season.getId()}"
                                selected="${selectedSeasonId != null && selectedSeasonId.equals(season.getId())}">
                            ${season.getName()}
                        </option>
                    @endfor
                </select>
            </div>
            <div class="flex-1">
                <label for="category" class="block text-sm font-medium text-gray-700 mb-2">Kategorie:</label>
                <select
                        id="category"
                        name="category"
                        class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 text-base"
                >
                    <option value="">Vyberte kategorii</option>
                    @for(Category category : categories)
                        <option value="${category.getId()}" selected="${selectedCategoryId != null && selectedCategoryId.equals(category.getId())}">${category.getName()}</option>
                    @endfor
                </select>
            </div>
            <div class="flex items-end">
                <button type="submit" class="px-6 py-2 bg-blue-500 text-white rounded-md shadow-md hover:bg-blue-600 focus:outline-none">Filtrovat</button>
            </div>
        </form>

        <div id="tournaments">
        </div>
    </div>
`)