@import thed3er.matchsaver.domain.Category
@import thed3er.matchsaver.domain.Season
@import java.util.Set

@param Set<Category> categories
@param Season season

@param Category selectedCategory = null

<div class="bg-white rounded-lg shadow-md p-6 mb-6">
    <h2 class="text-xl font-semibold text-blue-700 mb-4">Kategorie v sezóně ${season.getName()}</h2>

    @if(categories.isEmpty())
        <p class="text-gray-600 italic">V této sezóně nejsou žádné kategorie.</p>
    @else
        <input type="hidden" value="${season.getId()}" name="seasonIdInput" id="seasonIdInput">
        <ul class="space-y-2">
            @for(Category category : categories)
                <li>
                    <button id="category${category.getId()}"
                            name="category"
                            hx-get="/seasons/tournamentsByCategory"
                            hx-trigger="click,load[${selectedCategory != null && selectedCategory.getId().equals(category.getId())}]"
                            hx-include="this,#seasonIdInput"
                            hx-target="#tournaments-container"
                            value="${category.getId()}"
                            class="w-full text-left px-4 py-3 bg-blue-50 hover:bg-blue-100 text-blue-800 rounded-md transition-colors duration-200 flex items-center justify-between"
                    >
                        <span>${category.getName()}</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-blue-600" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
                        </svg>
                    </button>
                </li>
            @endfor
        </ul>
    @endif
</div>

<div id="tournaments-container" class="mt-4">
</div>
