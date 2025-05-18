

@param String successMessage = null

@template.layout.admin-layout(
content = @`
    @if(successMessage != null)
        <div class="bg-green-500 rounded-lg p-6 mb-5">${successMessage}</div>
    @endif

    <h2>Vítejte v admin sekci</h2>
    <p>Vyberte akci z menu nahoře</p>
`)