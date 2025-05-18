@import thed3er.matchsaver.domain.Season

@param Season season

@template.layout.admin-layout(content = @`

    <h1 class="text-2xl font-bold text-center mb-6 text-blue-700 md:text-3xl">Přidat sezónu</h1>

    <form class="bg-white rounded-lg shadow-md p-6"
          method="post"
          action="/admin/save/season">

        <div class="mb-4">
            <label for="name" class="block text-gray-700 font-medium mb-2">Název sezóny</label>
            <input type="text"
                   id="name"
                   name="name"
                   value="${season.getName()}"
                   required
                   class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <div class="mb-4">
            <label for="name" class="block text-gray-700 font-medium mb-2">Nastavit sezónu jako aktivní</label>
            <input type="checkbox"
                   id="visible"
                   name="visible"
                   value="${season.getVisible()}"
                   required
                   class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <input type="submit"
               value="Přidat sezónu"
               class="bg-blue-500 text-white font-semibold py-2 px-4 rounded-md hover:bg-blue-600 transition duration-200">


    </form>
 `)