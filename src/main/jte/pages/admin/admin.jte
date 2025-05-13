

@param String succesMessage = null

@template.layout.admin-layout(
content = @`
    @if(succesMessage != null)
        <div class="bg-green-500 rounded-lg p-6 mb-5">${succesMessage}</div>
    @endif

    <h2>Vítejte v admin sekci</h2>
    <p>Vyberte akci z menu nahoře</p>
`)