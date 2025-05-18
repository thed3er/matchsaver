@import thed3er.matchsaver.domain.Team
@import thed3er.matchsaver.domain.Match
@import java.util.List

@param Match match
@param List<Team> teams
@param Integer index

<div class="match-item mb-2 flex flex-wrap items-center space-x-2">
    <select name="matches[${index}].homeTeam"
            class="w-full md:w-auto px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        <option value="" disabled selected>Vyberte domácí tým</option>
        @for(Team team : teams)
            <option value="${team.getId()}">${team.getName()}</option>
        @endfor
    </select>
    <input type="number"
           min="0"
           name="matches[${index}].homeTeamScore"
           value="matches[${index}].homeTeamScore"
           class="w-20 px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
           required
           hx-preserve="true"
    >
    <span class="text-gray-500"> : </span>
    <input type="number"
           min="0"
           name="matches[${index}].awayTeamScore"
           class="w-20 px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
           required
    >
    <select name="matches[${index}].awayTeam"
            class="w-full md:w-auto px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        <option value="" disabled selected>Vyberte hostující tým</option>
        @for(Team team : teams)
            <option value="${team.getId()}">${team.getName()}</option>
        @endfor
    </select>
    <div class="flex-1 items-center space-x-2">
        <input type="checkbox" id="overtime-${index}" name="matches[${index}].overTime"
               class="w-4 h-4 text-blue-600 border-gray-300 rounded focus:ring-blue-500">
        <label for="overtime-${index}" class="text-gray-700 text-sm">Prodloužení</label>
    </div>
</div>