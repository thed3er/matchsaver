@import thed3er.matchsaver.domain.Tournament
@import java.util.List

@param List<Tournament> tournaments


@if(tournaments.isEmpty())
    <div class="bg-white rounded-lg shadow-md p-6 text-center">
        <p class="text-gray-600 italic">Žádné turnaje nebyly nalezeny.</p>
    </div>
@else
    <div class="space-y-4">
        @for(Tournament tournament : tournaments)
            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-lg font-bold text-gray-800">${tournament.getName()}</h2>
                <p class="text-gray-600">Sezóna: ${tournament.getSeason().getName()}</p>
                <p class="text-gray-600">Kategorie: ${tournament.getCategory().getName()}</p>
            </div>
        @endfor
    </div>
@endif