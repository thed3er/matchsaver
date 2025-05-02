@import thed3er.matchsaver.domain.Tournament
@import java.util.Set

@param Set<Tournament> tournaments
@param Long seasonId
@param Long categoryId

<div class="bg-white rounded-lg shadow-md p-6">
    <h3 class="text-lg font-semibold text-blue-700 mb-4">Turnaje</h3>

    @if(tournaments.isEmpty())
        <p class="text-gray-600 italic">V této kategorii nejsou žádné turnaje.</p>
    @else
        <input type="hidden" value="${seasonId}" name="season" id="season">
        <input type="hidden" value="${categoryId}" name="category" id="category">
        <ul class="space-y-2">
            @for(Tournament tournament : tournaments)
                <li>
                    <a href="/tournament/${tournament.getId()}" 
                       class="block px-4 py-3 bg-gray-50 hover:bg-gray-100 text-gray-800 rounded-md transition-colors duration-200 flex items-center justify-between">
                        <span>${tournament.getName()}</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-600" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
                        </svg>
                    </a>
                </li>
            @endfor
        </ul>
        <a  href="/team/stats?season=${seasonId}&category=${categoryId}"
            class="btn space-y-2 px-4 py-3 bg-blue-100 hover:bg-blue-300 text-gray-800 rounded-md">
            Zobraz bodovou tabulku ze všech turnajů
        </a>
    @endif
</div>
