$ids = @(7, 59, 48, 98, 64, 99, 102, 137, 150, 159, 189, 190, 210, 209, 212, 239, 240, 241, 287, 285, 282, 295, 321, 323, 327, 331, 339, 347, 356, 360, 379, 383, 395, 398, 400, 415)

$titles = @(
    "как испортить вечеринку", "еби меня, малышка", "кажется, в аду прикольно", "cupsizeholic",
    "опианариум", "chance", "кабуу", "сборник хуйни и картинки", "8 способов бросить дрочить",
    "научи меня курить", "11:11", "они устали", "лёд", "кургазацкий варенник", "ветмо инвокер",
    "не забирай меня домой", "неуравновешеннолетниепесни пт1", "ты принадлежишь мне",
    "спасибо что живой", "every time", "дабл ар", "ярче звезд", "опианариум (старый)",
    "арима", "характер", "mudada", "королевский", "crystal castles", "sewerslvt",
    "дробовик", "дели на два", "сематари", "в моих легких выросли цветы",
    "типичная вечеринка с бассейном", "пламени языки", "дабл терапия"
)

$template = [System.IO.File]::ReadAllText("grid.html", [System.Text.Encoding]::UTF8)

for ($i = 0; $i -lt $ids.Length; $i++) {
    $id = $ids[$i]
    $title = $titles[$i]
    $filename = "grid-$id.html"
    
    # Меняем ID в скрипте
    $content = $template -replace "currentGridId = urlParams.get\('id'\);", "currentGridId = '$id';"
    
    # Формируем теги (используем двойные кавычки и обратный апостроф ` для экранирования)
    $tagTitle = "<meta property=`"og:title`" content=`"Сетка: $title | W1NFY`">"
    $tagDesc = "<meta property=`"og:description`" content=`"Скачай сетку '$title' для Dota 2 от W1NFY.`">"
    $tagImage = "<meta property=`"og:image`" content=`"https://w1nfyart-site.layero.app/images/$id-2.jpg`">"
    $tagUrl = "<meta property=`"og:url`" content=`"https://w1nfyart-site.layero.app/$filename`">"

    # Заменяем старые теги на новые
    $content = $content -replace '<meta id="og-title" property="og:title" content="[^"]*">', $tagTitle
    $content = $content -replace '<meta id="og-desc" property="og:description" content="[^"]*">', $tagDesc
    $content = $content -replace '<meta id="og-image" property="og:image" content="[^"]*">', $tagImage
    $content = $content -replace '<meta id="og-url" property="og:url" content="[^"]*">', $tagUrl

    [System.IO.File]::WriteAllText($filename, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Создан файл: $filename"
}
Write-Host "Все файлы готовы!"