@param gg.jte.Content content

<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matchsaver</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/htmx.org@2.0.1"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-800">
<nav class="bg-gray-800 p-4">
    <div class="container mx-auto flex justify-between items-center">
        <a href="/" class="text-white text-lg font-bold">MatchSaver</a>
        <div class="space-x-4">
            <a href="/admin/add/season" class="text-gray-300 hover:text-white">Přidat sezónu</a>
            <a href="/admin/add/team" class="text-gray-300 hover:text-white">Přidat tým</a>
            <a href="/admin/tournaments" class="text-gray-300 hover:text-white">Seznam turnajů</a>
            <a href="/admin/add/tournament" class="text-gray-300 hover:text-white">Přidat turnaj</a>
            <a href="/admin/delete/tournament" class="text-gray-300 hover:text-white">Odstranit turnaj</a>
            <a href="/logout" class="text-gray-300 hover:text-white">Odhlásit se</a>
        </div>
    </div>
</nav>
<div class="container mx-auto px-4 py-6 max-w-md md:max-w-2xl lg:max-w-4xl">
    ${content}
</div>
</body>
</html>
