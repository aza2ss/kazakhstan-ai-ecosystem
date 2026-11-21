param(
  [string]$OutputPath = "data/startup-research.json"
)

$ErrorActionPreference = 'Stop'
$portfolioUrl = 'https://astanahub.vc/portfolio.html'
$raemUrl = 'https://raem.kz/startup-radar/'
$aiqUrl = 'https://aiqazaqstan.com/ru/startups'
$portfolioHtml = (Invoke-WebRequest -Uri $portfolioUrl -UseBasicParsing).Content
$raemHtml = (Invoke-WebRequest -Uri $raemUrl -UseBasicParsing).Content
$aiqHtml = (Invoke-WebRequest -Uri $aiqUrl -UseBasicParsing).Content

function Get-Attr([string]$text, [string]$name) {
  $m = [regex]::Match($text, "\b$name=`"([^`"]*)`"", 'IgnoreCase')
  if ($m.Success) { return [System.Net.WebUtility]::HtmlDecode($m.Groups[1].Value) }
  return ''
}
function Get-Tag([string]$text, [string]$pattern) {
  $m = [regex]::Match($text, $pattern, 'IgnoreCase, Singleline')
  if ($m.Success) { return [System.Net.WebUtility]::HtmlDecode(([regex]::Replace($m.Groups[1].Value, '<[^>]+>', '')).Trim()) }
  return ''
}
function Get-Slug([string]$text) {
  $v = $text.ToLowerInvariant().Normalize([Text.NormalizationForm]::FormD)
  $v = [regex]::Replace($v, '\p{Mn}', '')
  $v = [regex]::Replace($v, '[^a-z0-9]+', '-')
  $slug = $v.Trim('-')
  if (!$slug) { $hash = [System.Security.Cryptography.SHA256]::HashData([Text.Encoding]::UTF8.GetBytes($text)); $slug = 'company-' + [Convert]::ToHexString($hash).Substring(0,8).ToLowerInvariant() }
  return $slug
}
function Get-Categories([string]$industry, [string]$description) {
  $s = ($industry + ' ' + $description).ToLowerInvariant()
  $out = [System.Collections.Generic.List[string]]::new()
  if ($s -match '\bai\b|machine.learning|generative|llm|нейросет') { $out.Add('ai-ml') }
  if ($s -match 'generative|genai|llm') { $out.Add('generative-ai') }
  if ($s -match 'deeptech|robot|drone|hardware|wearable|industrial') { $out.Add('deeptech') }
  if ($s -match 'fintech|finance|bank|financial|credit') { $out.Add('fintech') }
  if ($s -match 'edtech|education|school|learning|language|обучен') { $out.Add('edtech') }
  if ($s -match 'health|medical|clinic|doctor|rehab|therapy') { $out.Add('healthtech') }
  if ($s -match 'medtech|medical|clinical|health') { $out.Add('medtech') }
  if ($s -match 'agri|farm|livestock') { $out.Add('agritech') }
  if ($s -match 'government|gov.?tech|e-government') { $out.Add('govtech') }
  if ($s -match 'saas|software|platform|business|devtool|crm|automation|b2b') { $out.Add('saas-b2b') }
  if ($s -match 'security|cyber|safety|biometric|identity') { $out.Add('cybersecurity') }
  if ($s -match 'robot|hardware|drone|iot|sensor') { $out.Add('robotics-hardware') }
  if ($s -match 'logistic|fleet|freight|mobility|transport|airport') { $out.Add('logistics-mobility') }
  if ($s -match 'retail|commerce|e-commerce|marketplace|shopping|payment') { $out.Add('ecommerce') }
  if ($s -match 'game|gaming') { $out.Add('gamedev') }
  if ($s -match 'marketing|advertis|adtech') { $out.Add('martech') }
  if ($s -match 'legal|immigration') { $out.Add('legaltech') }
  if ($s -match 'property|real estate|rental') { $out.Add('proptech') }
  if ($s -match 'industrial|construction|manufactur|digital twin') { $out.Add('industrialtech') }
  if ($s -match 'climate|green|environment|energy|sustain') { $out.Add('climatetech') }
  if ($s -match 'space|satellite|aerospace') { $out.Add('spacetech') }
  if ($out.Count -eq 0) { $out.Add('other-technology') }
  return @($out | Select-Object -Unique)
}

$cards = [regex]::Matches($portfolioHtml, '(?s)<a\b(?=[^>]*class="vh-portfolio-card")[^>]*>.*?</a>')
$published = [System.Collections.Generic.List[object]]::new()
foreach ($m in $cards) {
  $html = $m.Value
  $name = Get-Tag $html 'class="vh-portfolio-card-name">(.*?)</h3>'
  if (!$name) { continue }
  $website = Get-Attr $html 'href'
  $industry = Get-Attr $html 'data-industry'
  $stage = Get-Tag $html 'class="vh-badge-stage">(.*?)</span>'
  $description = Get-Attr $html 'data-ru'
  if (!$description) { $description = Get-Tag $html 'class="vh-portfolio-card-desc"[^>]*>(.*?)</p>' }
  $image = Get-Attr $html 'src'
  if ($image -and $image -notmatch '^https?://') { $image = 'https://astanahub.vc/' + $image.TrimStart('/') }
  $categories = Get-Categories $industry $description
  $ai = if ($categories -contains 'ai-ml') { 'AI Core' } else { 'Non-AI Technology' }
  $tagline = $description.Trim()
  $published.Add([ordered]@{
    id = Get-Slug $name; name = $name; tagline = $tagline
    description = "$tagline Astana Hub Ventures lists this company in its public technology portfolio."
    industry = $industry; city = ''; country = ''; stage = $stage
    website = $website; source = $portfolioUrl; source_label = 'Astana Hub Ventures · публичный портфель'
    mark = $name.Substring(0,1).ToUpperInvariant(); color = '#e8eee8'
    country_of_origin = ''; country_of_registration = ''; team_location = ''; activity_geography = ''
    record_type = 'startup'; category_slugs = $categories; geography_tags = @('astana-hub-ventures-portfolio')
    ai_relevance = $ai; verification_status = 'PARTIALLY_VERIFIED'; logo_url = $image
    official_socials = @(); public_contact = ''; primary_source = $website
    secondary_source = $portfolioUrl; discovery_source = $portfolioUrl
    checked_at = '2026-11-20'
  }) | Out-Null
}

$manual = @(
  [ordered]@{id='soup';name='Soup';tagline='Открытый CLI для fine-tuning и post-training языковых моделей на локальном оборудовании.';description='Soup — открытый инструмент для post-training и дообучения языковых моделей с layer streaming, чтобы работать с моделью даже при ограниченной видеопамяти. Официальный сайт указывает, что продукт выпускает MePlay, Inc., а команда работает в Астане.';industry='AI & Machine Learning';city='Астана';country='Казахстан';stage='';website='https://trysoup.dev/';source='https://raem.kz/startup/soup/';source_label='RAEM Startup Radar · официальная страница продукта';mark='S';color='#e8eee8';country_of_origin='Казахстанские корни — по редакционному профилю RAEM';country_of_registration='США (Delaware, MePlay, Inc. — по официальной странице)';team_location='Астана, Казахстан';activity_geography='Международная';record_type='startup';category_slugs=@('ai-ml','generative-ai','deeptech','saas-b2b');geography_tags=@('kazakhstan-founded-international','kazakhstan-based-team');ai_relevance='AI Core';verification_status='PARTIALLY_VERIFIED';logo_url='';official_socials=@('https://github.com/MakazhanAlpamys/Soup');public_contact='';primary_source='https://trysoup.dev/about';secondary_source='https://digitalbusiness.kz/2026-11-10/18-letniy-kazahstanets-privlek-2-mln-ot-kompanii-bitfury-i-pervogo-investora-zoom/';discovery_source='https://raem.kz/startup/soup/';checked_at='2026-11-20'},
  [ordered]@{id='citix';name='CITIX';tagline='Технологическая компания на стыке Smart City и AdTech.';description='CITIX разрабатывает цифровые городские решения, включая собственную платформу EYWA и умные городские экраны. Публичное описание организации указывает, что компания создана в Казахстане и работает в сегментах Smart City и AdTech.';industry='Smart City & AdTech';city='Алматы';country='Казахстан';stage='';website='https://citix.me/';source='https://aaca.com.kz/members/citix';source_label='Центрально-Азиатская рекламная ассоциация · профиль компании';mark='C';color='#e8eee8';country_of_origin='Казахстан';country_of_registration='';team_location='Алматы, Казахстан';activity_geography='Казахстан и международные рынки';record_type='technology-company';category_slugs=@('martech','govtech','saas-b2b');geography_tags=@('founded-in-kazakhstan','kazakhstan-based-team');ai_relevance='Non-AI Technology';verification_status='PARTIALLY_VERIFIED';logo_url='';official_socials=@('https://www.instagram.com/citix_me');public_contact='';primary_source='https://citix.me/';secondary_source='https://aaca.com.kz/members/citix';discovery_source='https://aiqazaqstan.com/ru/startups';checked_at='2026-11-20'},
  [ordered]@{id='biometric-kz';name='Biometric.kz';tagline='Биометрическая идентификация и проверка цифровой личности для бизнеса.';description='Biometric разрабатывает биометрические решения для идентификации, проверки документов и контроля доступа. Сведения о компании и домене подтверждаются публичным реестром поставщиков Казахстана; отраслевой обзор AIFC описывает её применение компьютерного зрения и машинного обучения.';industry='FinTech & Cybersecurity';city='Алматы';country='Казахстан';stage='';website='https://biometric.kz/';source='https://tech.aifc.kz/files/pages/2025/documents/9/aa-54-20-88_-k-0_d8-b5e_ab0-b0-2_-070eab0-0.pdf';source_label='AIFC FinTech Industry Landscape';mark='B';color='#e8eee8';country_of_origin='Казахстан';country_of_registration='Казахстан';team_location='Казахстан';activity_geography='Казахстан';record_type='technology-company';category_slugs=@('ai-ml','fintech','cybersecurity');geography_tags=@('founded-in-kazakhstan','kazakhstan-based-team');ai_relevance='AI Enabled';verification_status='PARTIALLY_VERIFIED';logo_url='';official_socials=@();public_contact='';primary_source='https://biometric.kz/';secondary_source='https://tech.aifc.kz/files/pages/2025/documents/9/aa-54-20-88_-k-0_d8-b5e_ab0-b0-2_-070eab0-0.pdf';discovery_source='https://aiqazaqstan.com/ru/startups';checked_at='2026-11-20'}
)
foreach ($p in $manual) {
  if ($published.name -notcontains $p.name) { $published.Add($p) | Out-Null }
}

$known = @{}
foreach ($p in $published) { $known[(Get-Slug $p.name).Replace('-', '')] = $true }
$baseCatalog = Get-Content -Raw -LiteralPath 'data/catalog.json' | ConvertFrom-Json
foreach ($p in $baseCatalog.projects) { $known[(Get-Slug $p.name).Replace('-', '')] = $true }
$candidates = @{}
$profileCards = [regex]::Matches($raemHtml, '(?is)<a\s+class="rs2-card"\s+href="([^"]*/startup/([^"]+))"([^>]*)>')
foreach ($m in $profileCards) {
  $href = [System.Net.WebUtility]::HtmlDecode($m.Groups[1].Value)
  $attrs = $m.Groups[3].Value
  $name = Get-Attr $attrs 'data-name'
  if (!$name) { continue }
  $key = (Get-Slug $name).Replace('-', '')
  if ($known.ContainsKey($key)) { continue }
  if (!$candidates.ContainsKey($key)) {
    $candidates[$key] = [ordered]@{id=$key;name=$name;source_url=$href;source_type='RAEM Startup Radar';record_type='unclassified';category_hint=(Get-Attr $attrs 'data-sec');city_hint=(Get-Attr $attrs 'data-city');status='PENDING';notes='Обнаружен в каталоге RAEM; первичный источник ещё не добавлен.';discovery_sources=@($href)}
  }
}

$h3 = [regex]::Matches($aiqHtml, '(?is)<h3\b[^>]*>(.*?)</h3>')
foreach ($m in $h3) {
  $name = Get-Tag $m.Value '<h3\b[^>]*>(.*?)</h3>'
  if (!$name) { continue }
  $key = (Get-Slug $name).Replace('-', '')
  if ($known.ContainsKey($key)) { continue }
  if ($candidates.ContainsKey($key)) {
    if ($candidates[$key].discovery_sources -notcontains $aiqUrl) { $candidates[$key].discovery_sources += $aiqUrl }
  } else {
    $candidates[$key] = [ordered]@{id=$key;name=$name;source_url=$aiqUrl;source_type='AI Qazaqstan registry';record_type='unclassified';category_hint='';city_hint='';status='PENDING';notes='Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации.';discovery_sources=@($aiqUrl)}
  }
}

$result = [ordered]@{
  generated_at = '2026-11-20'
  sources = @($portfolioUrl,$raemUrl,$aiqUrl,'https://www.rise.com.kz/reports/kazakhstan-startup-landscape-2026')
  published = @($published)
  candidates = @($candidates.Values)
  source_metrics = [ordered]@{ astana_hub_ventures_cards=$cards.Count; raem_profile_cards=$profileCards.Count; ai_qazaqstan_headings=$h3.Count }
}
$json = $result | ConvertTo-Json -Depth 12
$output = Join-Path (Get-Location) $OutputPath
$json | Set-Content -LiteralPath $output -Encoding utf8
"Published candidates: $($published.Count); discovery candidates: $($candidates.Count); RAEM cards: $($profileCards.Count); AIQ headings: $($h3.Count); saved: $output"
