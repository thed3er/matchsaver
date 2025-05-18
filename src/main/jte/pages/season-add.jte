@import thed3er.matchsaver.model.CategoryEnum
@import java.util.List

@param List<CategoryEnum> categories

@template.layout.default(
content = @`

    <h1 class="text-2xl font-bold mb-4">Nová sezóna</h1>
    <form action="/seasons/create" method="post" class="space-y-4 max-w-sm mx-auto">

        <div>
            <label for="name" class="block mb-1 font-semibold">Název sezóny:</label>
            <input id="name" name="name" type="text" class="border border-gray-300 rounded p-2 w-full" required>
        </div>

<%--        <div>--%>
<%--            <label class="block mb-1 font-semibold">Přidat kategorie</label>--%>
<%--            <select name="categories" multiple class="border border-gray-300 rounded p-2 w-full" required>--%>
<%--                @for(CategoryEnum category : categories)--%>
<%--                    <option value="${category.name}">${category.name}</option>--%>
<%--                @endfor--%>
<%--            </select>--%>
<%--        </div>--%>

        <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
            Uložit sezónu
        </button>
    </form>
`
))