@import thed3er.matchsaver.domain.Tournament
@import java.util.List
@import java.util.Set

@param Set<Tournament> tournaments


@if(tournaments.isEmpty())
    <div class="bg-white rounded-lg shadow-md p-6 text-center">
        <p class="text-gray-600 italic">Žádné turnaje nebyly nalezeny.</p>
    </div>
@else
    <div class="space-y-4">
        @for(Tournament tournament : tournaments)
            <div class="bg-white rounded-lg shadow-md p-6">
                <div class="flex items-center">
                    <div class="flex-1">
                        <h2 class="text-lg font-bold text-gray-800">${tournament.getName()}</h2>
                        <p class="text-gray-600">Sezóna: ${tournament.getSeason().getName()}</p>
                        <p class="text-gray-600">Kategorie: ${tournament.getCategory().getName()}</p>
                    </div>
                    <div class="flex-1">
<%--                        Vytvor button pro odstraneni daneho turnaje - pouzij ikonu--%>
                        <button class="w-full"
                                hx-delete="/admin/delete/tournament/${tournament.getId()}"
                        >
<%--                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" xml:space="preserve"><path fill="#282828" d="M119.032 145.698h-37.4c-6.2 0-11.3-5.1-11.3-11.3v-50.7c0-1.1.9-2 2-2h56c1.1 0 2 .9 2 2v50.7c0 6.2-5.1 11.3-11.3 11.3zm-44.7-60v48.7c0 4 3.3 7.3 7.3 7.3h37.3c4 0 7.3-3.3 7.3-7.3v-48.7h-51.9zM138.332 73.598h-76c-1.1 0-2-.9-2-2s.9-2 2-2h76c1.1 0 2 .9 2 2s-.9 2-2 2z"/><path fill="#282828" d="M138.332 85.598h-76c-1.1 0-2-.9-2-2s.9-2 2-2h76c1.1 0 2 .9 2 2s-.9 2-2 2zM112.332 73.698h-24c-1.1 0-2-.9-2-2v-6c0-6.6 5.4-12 12-12h4c6.6 0 12 5.4 12 12v6c0 1.1-.9 2-2 2zm-22-4h20v-4c0-4.4-3.6-8-8-8h-4c-4.4 0-8 3.6-8 8v4zM88.732 131.698c-1.1 0-2-.9-2-2v-32c0-1.1.9-2 2-2s2 .9 2 2v32c0 1.1-.9 2-2 2zM100.732 131.698c-1.1 0-2-.9-2-2v-32c0-1.1.9-2 2-2s2 .9 2 2v32c0 1.1-.9 2-2 2zM112.732 131.698c-1.1 0-2-.9-2-2v-32c0-1.1.9-2 2-2s2 .9 2 2v32c0 1.1-.9 2-2 2z"/></svg>--%>
                            Smazat
                        </button>
                    </div>
                </div>
            </div>
        @endfor
    </div>
@endif