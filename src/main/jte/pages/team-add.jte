@import java.util.List
@import thed3er.matchsaver.domain.Category

@param List<Category> categories

@template.layout.admin-layout(
content = @`

<div class="max-w-2xl mx-auto mt-10">
    <h1 class="text-2xl font-bold mb-6">Přidat nový tým</h1>
    <form action="/admin/save/team" method="post" class="space-y-4">
        <div>
            <label for="name" class="block text-sm font-medium text-gray-700">Název týmu</label>
            <input type="text" id="name" name="name" required
                   class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
        </div>
        <div>
            <label for="category" class="block text-sm font-medium text-gray-700">Kategorie</label>
            @for(Category category : categories)
                <div class="flex items-center">
                    <input type="checkbox" id="category-${category.getId()}" name="category" value="${category.getId()}"
                           class="h-4 w-4 text-indigo-600 border-gray-300 rounded focus:ring-indigo-500">
                    <label for="category-${category.getId()}" class="ml-2 block text-sm text-gray-700">
                        ${category.getName()}
                    </label>
                </div>
            @endfor
        </div>
        <div class="flex justify-end">
            <button type="submit"
                    class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                Přidat tým
            </button>
        </div>
    </form>
</div>
`
)))