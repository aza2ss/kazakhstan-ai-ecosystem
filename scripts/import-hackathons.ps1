param([string]$OutputPath = 'data/hackathons.json')
$ErrorActionPreference = 'Stop'
$base = 'https://api.hackathon.kz/api/events?period=2026&limit=100&offset='
$events = @((Invoke-RestMethod ($base + '0'))) + @((Invoke-RestMethod ($base + '100')))
$facets = Invoke-RestMethod 'https://api.hackathon.kz/api/events/facets'
$today = [TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([DateTime]::UtcNow, 'Central Asia Standard Time').ToString('yyyy-MM-dd')
$hackathons = @($events | Where-Object { $_.type -eq 'хакатон' })
$active = @($hackathons | Where-Object { $_.end -ge $today } | Sort-Object start, title)
$past = @($hackathons | Where-Object { $_.end -lt $today } | Sort-Object @{Expression='end';Descending=$true}, title | Select-Object -First (40 - $active.Count))
$selected = @($active) + @($past)
if ($selected.Count -ne 40) { throw "Expected 40 source hackathons, found $($selected.Count)." }

$coordinates = @{
  'Астана'=@(51.1282,71.4304); 'Астана / Алматы'=@($null,$null); 'Алматы'=@(43.2383,76.9455); 'Актобе'=@(50.2839,57.1670); 'Аркалык'=@(50.2490,66.9200); 'Атырау'=@(47.0945,51.9238); 'Другой город'=@($null,$null); 'Жезказган'=@(47.7833,67.7667); 'Караганда'=@(49.8060,73.0850); 'Кокшетау'=@(53.2833,69.3833); 'Конаев'=@(43.8833,77.0667); 'Костанай'=@(53.2144,63.6246); 'Кызылорда'=@(44.8488,65.4823); 'Лисаковск'=@(52.5369,62.4936); 'Павлодар'=@(52.2873,76.9674); 'Петропавловск'=@(54.8667,69.1500); 'Семей'=@(50.4111,80.2275); 'Талдыкорган'=@(45.0156,78.3739); 'Тараз'=@(42.9000,71.3667); 'Туркестан'=@(43.3019,68.2697); 'Уральск'=@(51.2278,51.3865); 'Усть-Каменогорск'=@(49.9483,82.6275); 'Шымкент'=@(42.3417,69.5901)
}
function Slug([string]$s) { $t=$s.ToLowerInvariant().Normalize([Text.NormalizationForm]::FormD);$t=[regex]::Replace($t,'\p{Mn}','');$t=[regex]::Replace($t,'[^a-z0-9а-яё]+','-');return $t.Trim('-') }
function FixImage([string]$path) { if(!$path){return ''};if($path -match '^https?://'){return $path};if($path.StartsWith('/media/')){return 'https://api.hackathon.kz'+$path};return 'https://hackathon.kz/'+$path.TrimStart('/') }
function ConvertEvent($e) {
  $city=if($e.online){''}else{[string]$e.city};$coord=$coordinates[$city];$themes=@($e.themes|Where-Object{$_});$cats=@($themes|ForEach-Object{Slug $_}|Select-Object -Unique)
  $audience=@()
  $address=[string]$e.venue
  $summary=[string]$e.summary
  $description=if($e.who){$summary+"`n`n"+[string]$e.who}else{$summary}
  $fmt=if($e.online){'online'}else{'offline'}
  $gallery=@($e.gallery|Where-Object{$_}|ForEach-Object{[ordered]@{url=(FixImage ([string]$_.url));caption=[string]$_.caption}})
  return [ordered]@{id=[string]$e.slug;slug=[string]$e.slug;name=[string]$e.title;event_type=[string]$e.type;summary=$summary;description=$description;organizer=[string]$e.org;organizer_url='';official_url=[string]$e.url;registration_url=[string]$e.url;start_at=[string]$e.start;end_at=[string]$e.end;registration_deadline=if($e.deadline){[string]$e.deadline}else{$null};country='Казахстан';city=$city;address=$address;format=$fmt;audience=$audience;tracks=$themes;eligibility=[string]$e.who;team_size='';participation_cost='';prize_pool=if($e.prize -and $e.prize -ne '—'){[string]$e.prize}else{''};program=@();latitude=if($coord -and $null -ne $coord[0]){$coord[0]}else{$null};longitude=if($coord -and $null -ne $coord[1]){$coord[1]}else{$null};location_precision=if($coord -and $null -ne $coord[0]){'city'}else{'none'};source_url="https://hackathon.kz/hackathon?slug=$($e.slug)";source_label='hackathon.kz · публичная карточка';image_url=(FixImage ([string]$e.image));original_gallery=$gallery;last_verified_at=[TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([DateTime]::UtcNow, 'Central Asia Standard Time').ToString('yyyy-MM-dd');verification_status='verified';status='published';cancellation_note='';category_slugs=$cats}
}
$mapped=@($selected|ForEach-Object{ConvertEvent $_})
$themes=@($facets.themes|Where-Object{$_}|Select-Object -Unique)
$categories=@($themes|ForEach-Object{$label=[string]$_;[ordered]@{slug=(Slug $label);label=$label}})
foreach($c in @('AI for Digital Economy & Smart Business','AI for Smart Campus','AI for Green Technologies')){if($categories.slug -notcontains (Slug $c)){$categories+=,[ordered]@{slug=(Slug $c);label=$c}}}
$result=[ordered]@{generated_at=[TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([DateTime]::UtcNow, 'Central Asia Standard Time').ToString('yyyy-MM-dd');source_url='https://hackathon.kz/events';source_period=2026;source_total_events=$events.Count;source_total_hackathons=$hackathons.Count;source_upcoming_hackathons=$active.Count;events=$mapped;categories=$categories;cities=@($facets.cities|Where-Object{$_}|Select-Object -Unique);note='40 hackathons directly from hackathon.kz: every active/upcoming 2026 hackathon plus the most recently ended records to fill the snapshot.'}
$out=Join-Path (Get-Location) $OutputPath;$result|ConvertTo-Json -Depth 12|Set-Content -LiteralPath $out -Encoding utf8
"Saved $($mapped.Count) records, all from hackathon.kz; source catalog reports $($events.Count) 2026 events / $($hackathons.Count) hackathons."

