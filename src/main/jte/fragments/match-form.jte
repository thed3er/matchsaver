@import thed3er.matchsaver.domain.Team
@import java.util.List

@param List<Team> teams
@param Integer index

<div class="match-item mb-2 flex items-center space-x-2">
    <select name="matches[${index}].homeTeam"
            class="flex-1 px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        <option value="" disabled selected>Vyberte domácí tým</option>
        @for(Team team : teams)
            <option value="${team.getId()}">${team.getName()}</option>
        @endfor
    </select>
    <input type="number"
           name="homeTeamScore"
           class="w-20 px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
    >
    <span class="text-gray-500"> : </span>
    <input type="number"
           name="awayTeamScore"
           class="w-20 px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
    >
    <select name="matches[${index}].awayTeam"
            class=" flex-1 px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        <option value="" disabled selected>Vyberte hostující tým</option>
        @for(Team team : teams)
            <option value="${team.getId()}">${team.getName()}</option>
        @endfor
    </select>
</div>