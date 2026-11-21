$ErrorActionPreference = 'Stop'
$research = Get-Content -Raw 'data/startup-research.json' | ConvertFrom-Json
$base = Get-Content -Raw 'data/catalog.json' | ConvertFrom-Json
$candidates = @($research.candidates)
$allNames = @($research.published + $base.projects)
$unique = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach ($p in $allNames) { [void]$unique.Add([string]$p.name) }
$overlap = $allNames.Count - $unique.Count
$publishedCount = $unique.Count
$api = $null
try { $api = Invoke-RestMethod 'http://127.0.0.1:4173/api/startup-stats' -TimeoutSec 2 } catch {}
$apiCatalog = $null
try { $apiCatalog = Invoke-RestMethod 'http://127.0.0.1:4173/api/startups' -TimeoutSec 2 } catch {}
$aiCount = if ($api) { $api.ai } else { @($research.published | Where-Object { $_.ai_relevance -ne 'Non-AI Technology' }).Count }
$verified = if ($api) { $api.verified } else { 0 }
$partial = if ($api) { $api.partially_verified } else { $publishedCount }
$deep = if ($api) { $api.deeptech } else { @($research.published | Where-Object { $_.category_slugs -contains 'deeptech' }).Count }
$fin = if ($api) { $api.fintech } else { @($research.published | Where-Object { $_.category_slugs -contains 'fintech' }).Count }
$edu = if ($api) { $api.edtech } else { @($research.published | Where-Object { $_.category_slugs -contains 'edtech' }).Count }
$health = if ($api) { $api.healthtech } else { @($research.published | Where-Object { $_.category_slugs -contains 'healthtech' }).Count }
$kz = if ($api) { $api.kazakhstan } else { 0 }
$roots = if ($api) { $api.kazakhstan_roots } else { 0 }
$ca = if ($api) { $api.central_asia } else { 0 }
$cis = if ($api) { $api.cis } else { 0 }
$discovered = $publishedCount + $candidates.Count
$bySource = $candidates | Group-Object source_type | Sort-Object Name
$rows = [System.Collections.Generic.List[string]]::new()
$rows.Add('# STARTUP_RESEARCH_REPORT')
$rows.Add('')
$rows.Add("Снимок данных: **$($research.generated_at)**. Исследовательский экспорт создаётся `scripts/import-research-sources.ps1`; он не публикует записи PENDING в каталоге.")
$rows.Add('')
$rows.Add('## Результаты')
$rows.Add('')
$rows.Add('| Показатель | Значение |')
$rows.Add('|---|---:|')
$rows.Add("| Уникальных записей опубликовано | $publishedCount |")
$rows.Add("| Статус VERIFIED | $verified |")
$rows.Add("| Статус PARTIALLY_VERIFIED | $partial |")
$rows.Add("| Кандидатов PENDING, скрыты из каталога | $($candidates.Count) |")
$rows.Add("| Всего записей обнаружено (имена нормализованы; без глобального entity resolution) | $discovered |")
$rows.Add("| AI Core / Enabled / Applied вместе | $aiCount |")
$rows.Add("| DeepTech | $deep |")
$rows.Add("| FinTech | $fin |")
$rows.Add("| EdTech | $edu |")
$rows.Add("| HealthTech | $health |")
$rows.Add("| Проекты с подтверждённой связью с Казахстаном | $kz |")
$rows.Add("| Международные проекты с казахстанскими корнями | $roots |")
$rows.Add("| Центральная Азия | $ca |")
$rows.Add("| СНГ | $cis |")
$rows.Add('')
$rows.Add('### География по явно записанному полю `country`')
$rows.Add('')
$rows.Add('| Значение из карточки | Количество |')
$rows.Add('|---|---:|')
$rows.Add('| Не указана | 58 |')
$rows.Add('| Казахстан | 5 |')
$rows.Add('| Казахстан (происхождение; международная деятельность) | 1 |')
$rows.Add('| Казахстан / Центральная Азия | 1 |')
$rows.Add('| Казахстанская связь · международная компания | 1 |')
$rows.Add('| Таджикистан / Центральная Азия | 1 |')
$rows.Add('')
$rows.Add('У 58 карточек страна не опубликована в портфельной карточке; в статистике эти записи не приписываются Казахстану. Поля страны происхождения и регистрации считаются отдельно и остаются пустыми, если нет явного источника.')
$rows.Add('')
$rows.Add('Опубликованные записи содержат 62 строки исследовательского импорта: 59 карточек портфеля Astana Hub Ventures и 3 проекта, добавленные по отдельным источникам (Soup, CITIX, Biometric.kz). В исходном каталоге уже было 6 записей; Zypl.ai совпал по имени и не задублирован, поэтому опубликовано 67 уникальных записей. Из них 62 типа Startup и 5 типа Technology Company. Страна, регистрация и происхождение оставлены пустыми, если источник их не указывает.')
$rows.Add('')
$rows.Add('Все 67 карточек пока помечены PARTIALLY_VERIFIED: официальный сайт или каталог подтверждает существование/описание, но это не подтверждает автоматически каждое поле — происхождение, юрисдикцию, стадию и географию. Для VERIFIED требуется отдельная проверка ключевых полей. Контакты и сведения об основателях не добавлялись.')
$rows.Add('')
$rows.Add('## Источники и охват')
$rows.Add('')
$rows.Add('| Источник | Наблюдаемое количество | Использование |')
$rows.Add('|---|---:|---|')
$rows.Add("| [Astana Hub Ventures portfolio](https://astanahub.vc/portfolio.html) | $($research.source_metrics.astana_hub_ventures_cards) карточек | Публичный портфель и ссылки на сайты компаний; частично подтверждённые записи |")
$rows.Add("| [RAEM Startup Radar](https://raem.kz/startup-radar/) | $($research.source_metrics.raem_profile_cards) профилей обнаружено | Discovery; оставшиеся неподтверждённые кандидаты не считаются стартапами |")
$rows.Add("| [AI Qazaqstan registry](https://aiqazaqstan.com/ru/startups) | $($research.source_metrics.ai_qazaqstan_headings) заголовков | Discovery; среди заголовков могут быть организации и поставщики |")
$rows.Add('| [RISE Kazakhstan Startup Landscape 2026](https://www.rise.com.kz/reports/kazakhstan-startup-landscape-2026) | Исследование использовано как контекст | Не импортировались заявленные в исследовании 1 500 компаний как карточки платформы |')
$rows.Add('| Официальные страницы Soup, CITIX и Biometric.kz | 3 ручные записи | Краткое описание, профиль деятельности и ссылки на источники |')
$rows.Add('')
$rows.Add('RAEM и AI Qazaqstan дали 233 заголовка/профиля после дедупликации по нормализованному имени между двумя источниками. Пять совпадений с базовым каталогом исключены из очереди; осталось 228 PENDING discovery-записей. Это число записей-кандидатов, не гарантия 228 отдельных юридических лиц: близкие названия и псевдонимы ещё требуют ручного объединения.')
$rows.Add('')
foreach ($g in $bySource) { $rows.Add("- $($g.Name): $($g.Count)") }
$rows.Add('')
$rows.Add('Кандидаты не показываются в публичном каталоге и не включаются в статистику опубликованных стартапов. Имена ниже требуют классификации record type и поиска первичного источника.')
$rows.Add('')
$rows.Add('## Распределение опубликованных карточек по категориям')
$rows.Add('')
if ($apiCatalog) {
  $categoryCounts = @{}
  foreach ($p in $apiCatalog.items) { foreach ($slug in @($p.category_slugs)) { $label = ($apiCatalog.categories | Where-Object slug -eq $slug | Select-Object -First 1).label; if (!$label) { $label = $slug }; if (!$categoryCounts.ContainsKey($label)) { $categoryCounts[$label] = 0 }; $categoryCounts[$label]++ } }
  $rows.Add('| Категория | Карточек |')
  $rows.Add('|---|---:|')
  foreach ($item in ($categoryCounts.GetEnumerator() | Sort-Object Value -Descending)) { $rows.Add("| $($item.Name) | $($item.Value) |") }
} else { $rows.Add('Статистика по категориям пересчитывается API из активной базы. Запустите `npm start` и снова выполните этот скрипт для таблицы актуальных значений.') }
$rows.Add('')
$rows.Add('AI relevance в текущем каталоге: AI Core 37, AI Enabled 3, AI Applied 1, Non-AI Technology 26. Категория и AI relevance классифицируются отдельно; технология может быть не-AI стартапом, обнаруженным теми же источниками.')
$rows.Add('Для 59 карточек портфеля первичное тематическое распределение сделано по описанию отрасли и продукта, извлечённому из открытой карточки; это редакционная классификация, а не независимый технический аудит. Поэтому эти записи остаются PARTIALLY_VERIFIED.')
$rows.Add('')
$rows.Add('## Обязательные компании из задания')
$rows.Add('')
$must = @('Higgsfield AI','Soup','Zypl.ai','Cerebra AI','Cotype AI','KazLLM','CITIX','Biometric.kz','Target AI','Datanomix','Senim','Mirai Tech','Perceptis','PanDev Metrics','Surfaice','Rette','Alma','Axellero','Luwo','Gro.Now','AVM.AI','Moon AI','Finflow','QazTWIN','Tilmoch','OQ.AI','Macdent','Arlan Biotech')
$rows.Add('| Компания | Результат |')
$rows.Add('|---|---|')
foreach ($name in $must) {
  $pub = @($allNames | Where-Object { $_.name -like "*$name*" } | Select-Object -First 1)
  $cand = @($candidates | Where-Object { $_.name -like "*$name*" } | Select-Object -First 1)
  if ($pub.Count) { $status = 'В каталоге · PARTIALLY_VERIFIED' } elseif ($cand.Count) { $status = 'Кандидат PENDING · в публичный каталог не добавлен' } else { $status = 'Не найдено в проверенных наборах; не добавлено' }
  $rows.Add("| $name | $status |")
}
$rows.Add('')
$rows.Add('Higgsfield AI сохранён в исходном каталоге проекта и описан как компания с казахстанскими корнями и инженерным центром в Алматы; зарубежная штаб-квартира не является причиной исключения. Soup добавлен отдельно: официальный [about](https://trysoup.dev/about) описывает продукт и команду в Астане; корпоративная регистрация MePlay Inc. указана отдельно и не приписана Казахстану.')
$rows.Add('')
$rows.Add('## Непроверенные записи и причины')
$rows.Add('')
$rows.Add('Для каждой записи ниже статус PENDING. Профили обнаружены через RAEM или AI Qazaqstan, но нет установленного первичного источника и/или record type ещё не классифицирован. Если каталог может включать организацию, фонд, исследовательскую лабораторию или поставщика, его нельзя считать стартапом до классификации. Основание и discovery URL хранятся в `data/startup-research.json`.')
$rows.Add('')
$rows.Add('| Название | Тип источника | URL профиля / списка | Причина |')
$rows.Add('|---|---|---|---|')
foreach ($c in ($candidates | Sort-Object name)) { $rows.Add("| $($c.name -replace '\|','/') | $($c.source_type) | [$($c.source_url)]($($c.source_url)) | $($c.notes -replace '\|','/') |") }
$rows.Add('')
$rows.Add('### Причины не включать запись в публичную статистику')
$rows.Add('')
$rows.Add('- Discovery-каталог не является подтверждением описания или текущей деятельности компании.')
$rows.Add('- Некоторые записи ещё могут оказаться фондами, организациями, акселераторами, университетскими проектами или поставщиками, а не стартапами.')
$rows.Add('- У непроверенных кандидатов не публикуются личные контакты, основатели, возраст, инвестиционные данные и неподтверждённые сведения.')
$rows.Add('- Данные исследования RISE не превращаются в 1 500 карточек; в отчёт попадают только локально описанные записи.')
$rows.Add('')
$rows.Add('## Категории каталога')
$rows.Add('')
$rows.Add('В платформе заведены 22 категории: AI & Machine Learning, Generative AI, DeepTech, FinTech, EdTech, HealthTech, MedTech, AgriTech, GovTech, SaaS & B2B, Cybersecurity, Robotics & Hardware, Logistics & Mobility, E-commerce, GameDev, MarTech, LegalTech, PropTech, IndustrialTech, ClimateTech, SpaceTech и Other Technology. Одна компания может иметь несколько категорий.')
$rows.Add('')
$rows.Add('## Повторное получение снимка')
$rows.Add('')
$rows.Add('`./scripts/import-research-sources.ps1` обновляет источник и экспортирует компании/кандидатов. Откройте diff JSON и этот отчёт после обновления; автоматическое обновление не присваивает кандидатам статус VERIFIED. Описание источника и дата проверки хранятся в каждой карточке.')
$rows.Add('')
$rows.Add('Сопутствующие источники: [RISE 2026](https://www.rise.com.kz/reports/kazakhstan-startup-landscape-2026), [Digital Bridge finalists](https://astanahub.com/ru/article/na-ai-digital-bridge-2026-14-startapov-vyshli-v-final-astana-hub-battle1790945325), [Digital Almaty](https://www.gov.kz/org/maidd/press/news/details/929058?lang=ru), [Soup](https://trysoup.dev/about), [CITIX](https://citix.me/), [Biometric.kz](https://biometric.kz/).')
$rows | Set-Content -LiteralPath 'STARTUP_RESEARCH_REPORT.md' -Encoding utf8
"Generated report: published=$publishedCount candidates=$($candidates.Count) discovered=$discovered"
