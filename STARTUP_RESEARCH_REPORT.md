# STARTUP_RESEARCH_REPORT

Снимок данных: **2026-11-20**. Исследовательский экспорт создаётся scripts/import-research-sources.ps1; он не публикует записи PENDING в каталоге.

## Результаты

| Показатель | Значение |
|---|---:|
| Уникальных записей опубликовано | 67 |
| Статус VERIFIED | 0 |
| Статус PARTIALLY_VERIFIED | 67 |
| Кандидатов PENDING, скрыты из каталога | 228 |
| Всего обнаружено, после дедупликации по имени | 295 |
| AI Core / Enabled / Applied вместе | 41 |
| DeepTech | 5 |
| FinTech | 6 |
| EdTech | 9 |
| HealthTech | 9 |
| Проекты с подтверждённой связью с Казахстаном | 9 |
| Международные проекты с казахстанскими корнями | 3 |
| Центральная Азия | 2 |
| СНГ | 9 |

### География по явно записанному полю `country`

| Значение из карточки | Количество |
|---|---:|
| Не указана | 58 |
| Казахстан | 5 |
| Казахстан (происхождение; международная деятельность) | 1 |
| Казахстан / Центральная Азия | 1 |
| Казахстанская связь · международная компания | 1 |
| Таджикистан / Центральная Азия | 1 |

У 58 карточек страна не опубликована в портфельной карточке; в статистике эти записи не приписываются Казахстану. Поля страны происхождения и регистрации считаются отдельно и остаются пустыми, если нет явного источника.

Опубликованные записи содержат 62 строки исследовательского импорта: 59 карточек портфеля Astana Hub Ventures и 3 проекта, добавленные по отдельным источникам (Soup, CITIX, Biometric.kz). В исходном каталоге уже было 6 записей; Zypl.ai совпал по имени и не задублирован, поэтому опубликовано 67 уникальных записей. Из них 62 типа Startup и 5 типа Technology Company. Страна, регистрация и происхождение оставлены пустыми, если источник их не указывает.

Все 67 карточек пока помечены PARTIALLY_VERIFIED: официальный сайт или каталог подтверждает существование/описание, но это не подтверждает автоматически каждое поле — происхождение, юрисдикцию, стадию и географию. Для VERIFIED требуется отдельная проверка ключевых полей. Контакты и сведения об основателях не добавлялись.

## Источники и охват

| Источник | Наблюдаемое количество | Использование |
|---|---:|---|
| [Astana Hub Ventures portfolio](https://astanahub.vc/portfolio.html) | 59 карточек | Публичный портфель и ссылки на сайты компаний; частично подтверждённые записи |
| [RAEM Startup Radar](https://raem.kz/startup-radar/) | 195 профилей обнаружено | Discovery; оставшиеся неподтверждённые кандидаты не считаются стартапами |
| [AI Qazaqstan registry](https://aiqazaqstan.com/ru/startups) | 64 заголовков | Discovery; среди заголовков могут быть организации и поставщики |
| [RISE Kazakhstan Startup Landscape 2026](https://www.rise.com.kz/reports/kazakhstan-startup-landscape-2026) | Исследование использовано как контекст | Не импортировались заявленные в исследовании 1 500 компаний как карточки платформы |
| Официальные страницы Soup, CITIX и Biometric.kz | 3 ручные записи | Краткое описание, профиль деятельности и ссылки на источники |

RAEM и AI Qazaqstan дали 233 уникальных заголовка/профиля после дедупликации между двумя источниками. Пять совпадений с уже опубликованным базовым каталогом исключены из очереди; осталось 228 PENDING:

- AI Qazaqstan registry: 50
- RAEM Startup Radar: 178

Кандидаты не показываются в публичном каталоге и не включаются в статистику опубликованных стартапов. Имена ниже требуют классификации record type и поиска первичного источника.

## Распределение опубликованных карточек по категориям

| Категория | Карточек |
|---|---:|
| AI & Machine Learning | 40 |
| EdTech | 9 |
| HealthTech | 9 |
| MedTech | 9 |
| SaaS & B2B | 7 |
| FinTech | 6 |
| Logistics & Mobility | 6 |
| DeepTech | 5 |
| Other Technology | 4 |
| Cybersecurity | 4 |
| GovTech | 3 |
| E-commerce | 3 |
| Generative AI | 2 |
| MarTech | 1 |
| Robotics & Hardware | 1 |

AI relevance в текущем каталоге: AI Core 37, AI Enabled 3, AI Applied 1, Non-AI Technology 26. Категория и AI relevance классифицируются отдельно; технология может быть не-AI стартапом, обнаруженным теми же источниками.
Для 59 карточек портфеля первичное тематическое распределение сделано по описанию отрасли и продукта, извлечённому из открытой карточки; это редакционная классификация, а не независимый технический аудит. Поэтому эти записи остаются PARTIALLY_VERIFIED.

## Обязательные компании из задания

| Компания | Результат |
|---|---|
| Higgsfield AI | В каталоге · PARTIALLY_VERIFIED |
| Soup | В каталоге · PARTIALLY_VERIFIED |
| Zypl.ai | В каталоге · PARTIALLY_VERIFIED |
| Cerebra AI | В каталоге · PARTIALLY_VERIFIED |
| Cotype AI | Кандидат PENDING · в публичный каталог не добавлен |
| KazLLM | Кандидат PENDING · в публичный каталог не добавлен |
| CITIX | В каталоге · PARTIALLY_VERIFIED |
| Biometric.kz | В каталоге · PARTIALLY_VERIFIED |
| Target AI | Кандидат PENDING · в публичный каталог не добавлен |
| Datanomix | Кандидат PENDING · в публичный каталог не добавлен |
| Senim | Кандидат PENDING · в публичный каталог не добавлен |
| Mirai Tech | В каталоге · PARTIALLY_VERIFIED |
| Perceptis | В каталоге · PARTIALLY_VERIFIED |
| PanDev Metrics | Кандидат PENDING · в публичный каталог не добавлен |
| Surfaice | В каталоге · PARTIALLY_VERIFIED |
| Rette | В каталоге · PARTIALLY_VERIFIED |
| Alma | В каталоге · PARTIALLY_VERIFIED |
| Axellero | В каталоге · PARTIALLY_VERIFIED |
| Luwo | В каталоге · PARTIALLY_VERIFIED |
| Gro.Now | В каталоге · PARTIALLY_VERIFIED |
| AVM.AI | В каталоге · PARTIALLY_VERIFIED |
| Moon AI | В каталоге · PARTIALLY_VERIFIED |
| Finflow | В каталоге · PARTIALLY_VERIFIED |
| QazTWIN | В каталоге · PARTIALLY_VERIFIED |
| Tilmoch | В каталоге · PARTIALLY_VERIFIED |
| OQ.AI | В каталоге · PARTIALLY_VERIFIED |
| Macdent | В каталоге · PARTIALLY_VERIFIED |
| Arlan Biotech | Кандидат PENDING · в публичный каталог не добавлен |

Higgsfield AI сохранён в исходном каталоге проекта и описан как компания с казахстанскими корнями и инженерным центром в Алматы; зарубежная штаб-квартира не является причиной исключения. Soup добавлен отдельно: официальный [about](https://trysoup.dev/about) описывает продукт и команду в Астане; корпоративная регистрация MePlay Inc. указана отдельно и не приписана Казахстану.

## Непроверенные записи и причины

Для каждой записи ниже статус PENDING. Профили обнаружены через RAEM или AI Qazaqstan, но нет установленного первичного источника и/или record type ещё не классифицирован. Если каталог может включать организацию, фонд, исследовательскую лабораторию или поставщика, его нельзя считать стартапом до классификации. Основание и discovery URL хранятся в `data/startup-research.json`.

| Название | Тип источника | URL профиля / списка | Причина |
|---|---|---|---|
| 1fit | RAEM Startup Radar | [https://raem.kz/startup/1fit/](https://raem.kz/startup/1fit/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| атыраутехинвест | RAEM Startup Radar | [https://raem.kz/startup/atyrautehinvest/](https://raem.kz/startup/atyrautehinvest/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Казахтелеком | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| тата | RAEM Startup Radar | [https://raem.kz/startup/tata/](https://raem.kz/startup/tata/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| учёт.kz (гк «учёт») | RAEM Startup Radar | [https://raem.kz/startup/uchet-kz/](https://raem.kz/startup/uchet-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| aether system & co. | RAEM Startup Radar | [https://raem.kz/startup/aether-system/](https://raem.kz/startup/aether-system/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| AI Solutions KZ | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| ai startify | RAEM Startup Radar | [https://raem.kz/startup/ai-startify/](https://raem.kz/startup/ai-startify/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| aidan | RAEM Startup Radar | [https://raem.kz/startup/aidan/](https://raem.kz/startup/aidan/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| aidentis | RAEM Startup Radar | [https://raem.kz/startup/aidentis/](https://raem.kz/startup/aidentis/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| AIFC Fintech Hub | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| aim high technology | RAEM Startup Radar | [https://raem.kz/startup/aim-high-technology/](https://raem.kz/startup/aim-high-technology/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| aimris (чк «its partner ltd.») | RAEM Startup Radar | [https://raem.kz/startup/aimris/](https://raem.kz/startup/aimris/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| aiutante | RAEM Startup Radar | [https://raem.kz/startup/aiutante/](https://raem.kz/startup/aiutante/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| alaqan technologies | RAEM Startup Radar | [https://raem.kz/startup/alaqan-technologies/](https://raem.kz/startup/alaqan-technologies/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| aldente ai | RAEM Startup Radar | [https://raem.kz/startup/aldente-ai/](https://raem.kz/startup/aldente-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Alem.AI (International AI Center) | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| Almaty Datacenter (ADC) | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| ams | RAEM Startup Radar | [https://raem.kz/startup/ams/](https://raem.kz/startup/ams/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Anthropic | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| apartx | RAEM Startup Radar | [https://raem.kz/startup/apartx/](https://raem.kz/startup/apartx/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| aparu (апару / aparu.kz) | RAEM Startup Radar | [https://raem.kz/startup/aparu/](https://raem.kz/startup/aparu/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| arbuz.kz | RAEM Startup Radar | [https://raem.kz/startup/arbuz-kz/](https://raem.kz/startup/arbuz-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| arctera | RAEM Startup Radar | [https://raem.kz/startup/arctera/](https://raem.kz/startup/arctera/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Arlan Biotech | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| armeta ai | RAEM Startup Radar | [https://raem.kz/startup/armeta-ai/](https://raem.kz/startup/armeta-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| arts.me | RAEM Startup Radar | [https://raem.kz/startup/arts-me/](https://raem.kz/startup/arts-me/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| arystun (тоо «game asset holdings») | RAEM Startup Radar | [https://raem.kz/startup/arystun/](https://raem.kz/startup/arystun/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Astana Hub | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| atlanti | RAEM Startup Radar | [https://raem.kz/startup/atlanti/](https://raem.kz/startup/atlanti/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| auasense | RAEM Startup Radar | [https://raem.kz/startup/auasense/](https://raem.kz/startup/auasense/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| autocheck | RAEM Startup Radar | [https://raem.kz/startup/autocheck/](https://raem.kz/startup/autocheck/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| aviata / freedom travel и chocotravel | RAEM Startup Radar | [https://raem.kz/startup/aviata-chocotravel/](https://raem.kz/startup/aviata-chocotravel/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Baiterek Venture Fund | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| Beeline Kazakhstan | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| behype | RAEM Startup Radar | [https://raem.kz/startup/behype/](https://raem.kz/startup/behype/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| beksar | RAEM Startup Radar | [https://raem.kz/startup/beksar/](https://raem.kz/startup/beksar/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| best vision (best vision technologies) | RAEM Startup Radar | [https://raem.kz/startup/best-vision/](https://raem.kz/startup/best-vision/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| beyim.ai (beyimtech) | RAEM Startup Radar | [https://raem.kz/startup/beyim-ai/](https://raem.kz/startup/beyim-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| bilimland | RAEM Startup Radar | [https://raem.kz/startup/bilimland/](https://raem.kz/startup/bilimland/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| biodrop | RAEM Startup Radar | [https://raem.kz/startup/biodrop/](https://raem.kz/startup/biodrop/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| biometric.vision | RAEM Startup Radar | [https://raem.kz/startup/biometric-vision/](https://raem.kz/startup/biometric-vision/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Birge.kz | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| BotTech | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| brainpatch | RAEM Startup Radar | [https://raem.kz/startup/brainpatch/](https://raem.kz/startup/brainpatch/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| bugbase | RAEM Startup Radar | [https://raem.kz/startup/bugbase/](https://raem.kz/startup/bugbase/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| call2action.ai | RAEM Startup Radar | [https://raem.kz/startup/call2action-ai/](https://raem.kz/startup/call2action-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Cerebras Systems | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| choco (chocolife) | RAEM Startup Radar | [https://raem.kz/startup/choco-chocolife/](https://raem.kz/startup/choco-chocolife/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| clicki | RAEM Startup Radar | [https://raem.kz/startup/clicki/](https://raem.kz/startup/clicki/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| clockster | RAEM Startup Radar | [https://raem.kz/startup/clockster/](https://raem.kz/startup/clockster/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| codiplay | RAEM Startup Radar | [https://raem.kz/startup/codiplay/](https://raem.kz/startup/codiplay/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Cotype | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| Cotype AI | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| cr drive | RAEM Startup Radar | [https://raem.kz/startup/cr-drive/](https://raem.kz/startup/cr-drive/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| ctogram | RAEM Startup Radar | [https://raem.kz/startup/ctogram/](https://raem.kz/startup/ctogram/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| cuba iot | RAEM Startup Radar | [https://raem.kz/startup/cuba-iot/](https://raem.kz/startup/cuba-iot/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| cyberpack.ai | RAEM Startup Radar | [https://raem.kz/startup/cyberpack-ai/](https://raem.kz/startup/cyberpack-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| data pulse | RAEM Startup Radar | [https://raem.kz/startup/data-pulse/](https://raem.kz/startup/data-pulse/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| DataLab KZ | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| Datanomix | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| datavera | RAEM Startup Radar | [https://raem.kz/startup/datavera/](https://raem.kz/startup/datavera/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| deepinfra | RAEM Startup Radar | [https://raem.kz/startup/deepinfra/](https://raem.kz/startup/deepinfra/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| DeepSeek | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| defect ai (rette) | RAEM Startup Radar | [https://raem.kz/startup/defect-ai/](https://raem.kz/startup/defect-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Digital Al-Farabi | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| dodo brands (додо пицца / drinkit / dodo is) | RAEM Startup Radar | [https://raem.kz/startup/dodo-brands/](https://raem.kz/startup/dodo-brands/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| doq.kz | RAEM Startup Radar | [https://raem.kz/startup/doq-kz/](https://raem.kz/startup/doq-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| dreamlight | RAEM Startup Radar | [https://raem.kz/startup/dreamlight/](https://raem.kz/startup/dreamlight/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| e-knot | RAEM Startup Radar | [https://raem.kz/startup/eknot/](https://raem.kz/startup/eknot/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| easycoins | RAEM Startup Radar | [https://raem.kz/startup/easycoins/](https://raem.kz/startup/easycoins/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| easyspeak | RAEM Startup Radar | [https://raem.kz/startup/easyspeak/](https://raem.kz/startup/easyspeak/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| edoox | RAEM Startup Radar | [https://raem.kz/startup/edoox/](https://raem.kz/startup/edoox/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| EduLab KZ | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| egistic | RAEM Startup Radar | [https://raem.kz/startup/egistic/](https://raem.kz/startup/egistic/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| eGov (электронное правительство) | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| emdeu ai+ | RAEM Startup Radar | [https://raem.kz/startup/emdeu-ai/](https://raem.kz/startup/emdeu-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| epiq ai | RAEM Startup Radar | [https://raem.kz/startup/epiq-ai/](https://raem.kz/startup/epiq-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| esai | RAEM Startup Radar | [https://raem.kz/startup/esai/](https://raem.kz/startup/esai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| evospace | RAEM Startup Radar | [https://raem.kz/startup/evospace/](https://raem.kz/startup/evospace/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| factory builder ai | RAEM Startup Radar | [https://raem.kz/startup/factory-builder-ai/](https://raem.kz/startup/factory-builder-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| flection.ai | RAEM Startup Radar | [https://raem.kz/startup/flection-ai/](https://raem.kz/startup/flection-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| flip.kz | RAEM Startup Radar | [https://raem.kz/startup/flip-kz/](https://raem.kz/startup/flip-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| flowsell.me | RAEM Startup Radar | [https://raem.kz/startup/flowsell/](https://raem.kz/startup/flowsell/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Freedom Finance AI | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| garderob | RAEM Startup Radar | [https://raem.kz/startup/garderob-2/](https://raem.kz/startup/garderob-2/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| geometry (тоо geometry) | RAEM Startup Radar | [https://raem.kz/startup/geometry/](https://raem.kz/startup/geometry/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| godays | RAEM Startup Radar | [https://raem.kz/startup/godays/](https://raem.kz/startup/godays/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Google Cloud Kazakhstan | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| grand mobile | RAEM Startup Radar | [https://raem.kz/startup/grand-mobile/](https://raem.kz/startup/grand-mobile/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| grantfield.kz | RAEM Startup Radar | [https://raem.kz/startup/grantfield-kz/](https://raem.kz/startup/grantfield-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Halyk AI Lab | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| heily ai | RAEM Startup Radar | [https://raem.kz/startup/heily-ai/](https://raem.kz/startup/heily-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| hemo.labs (umaia) | RAEM Startup Radar | [https://raem.kz/startup/hemo-labs/](https://raem.kz/startup/hemo-labs/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| hero study | RAEM Startup Radar | [https://raem.kz/startup/hero-study/](https://raem.kz/startup/hero-study/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| hero’s journey | RAEM Startup Radar | [https://raem.kz/startup/heros-journey-2/](https://raem.kz/startup/heros-journey-2/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| hi doctor | RAEM Startup Radar | [https://raem.kz/startup/hi-doctor/](https://raem.kz/startup/hi-doctor/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| hr messenger | RAEM Startup Radar | [https://raem.kz/startup/hr-messenger/](https://raem.kz/startup/hr-messenger/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Huawei Cloud KZ | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| i-teka (тоо «единая справочная служба i-teka») | RAEM Startup Radar | [https://raem.kz/startup/i-teka/](https://raem.kz/startup/i-teka/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| idos games | RAEM Startup Radar | [https://raem.kz/startup/idos-games/](https://raem.kz/startup/idos-games/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| igps tech | RAEM Startup Radar | [https://raem.kz/startup/igps-tech/](https://raem.kz/startup/igps-tech/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| impactx / ifx (тоо «impact finance») | RAEM Startup Radar | [https://raem.kz/startup/impactx-ifx/](https://raem.kz/startup/impactx-ifx/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| indrive | RAEM Startup Radar | [https://raem.kz/startup/indrive/](https://raem.kz/startup/indrive/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Intellicrafter | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| introdex | RAEM Startup Radar | [https://raem.kz/startup/introdex/](https://raem.kz/startup/introdex/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| investbanq / paladigm | RAEM Startup Radar | [https://raem.kz/startup/investbanq-paladigm/](https://raem.kz/startup/investbanq-paladigm/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| ISAI (Institute of Smart Systems and Artificial Intelligence) | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| jet (jet sharing) | RAEM Startup Radar | [https://raem.kz/startup/jet-sharing/](https://raem.kz/startup/jet-sharing/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| jobescape | RAEM Startup Radar | [https://raem.kz/startup/jobescape/](https://raem.kz/startup/jobescape/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| jude | RAEM Startup Radar | [https://raem.kz/startup/jude/](https://raem.kz/startup/jude/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| jumbaq | RAEM Startup Radar | [https://raem.kz/startup/jumbaq/](https://raem.kz/startup/jumbaq/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Jusan Analytics | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| Jusan Digital | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| Kaspi.kz AI Lab | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| KazLLM | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| Kcell | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| kenesai | RAEM Startup Radar | [https://raem.kz/startup/kenesai/](https://raem.kz/startup/kenesai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| kenisai | RAEM Startup Radar | [https://raem.kz/startup/kenisai/](https://raem.kz/startup/kenisai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| kense | RAEM Startup Radar | [https://raem.kz/startup/kense/](https://raem.kz/startup/kense/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| keysora education | RAEM Startup Radar | [https://raem.kz/startup/keysora-education/](https://raem.kz/startup/keysora-education/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| klok | RAEM Startup Radar | [https://raem.kz/startup/klok/](https://raem.kz/startup/klok/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| kolesa group | RAEM Startup Radar | [https://raem.kz/startup/kolesa-group/](https://raem.kz/startup/kolesa-group/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| kompra.kz | RAEM Startup Radar | [https://raem.kz/startup/kompra-kz/](https://raem.kz/startup/kompra-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| kuanfy | RAEM Startup Radar | [https://raem.kz/startup/kuanfy/](https://raem.kz/startup/kuanfy/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| kuicktech / avoloan | RAEM Startup Radar | [https://raem.kz/startup/avoloan/](https://raem.kz/startup/avoloan/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| kwaaka | RAEM Startup Radar | [https://raem.kz/startup/kwaaka/](https://raem.kz/startup/kwaaka/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| labhelp.me | RAEM Startup Radar | [https://raem.kz/startup/labhelp-me/](https://raem.kz/startup/labhelp-me/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| leaping ai | RAEM Startup Radar | [https://raem.kz/startup/leaping-ai/](https://raem.kz/startup/leaping-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| leo parts | RAEM Startup Radar | [https://raem.kz/startup/leo-parts/](https://raem.kz/startup/leo-parts/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| m3triq | RAEM Startup Radar | [https://raem.kz/startup/m3triq/](https://raem.kz/startup/m3triq/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| med365 | RAEM Startup Radar | [https://raem.kz/startup/med365/](https://raem.kz/startup/med365/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| metaclinic.kz | RAEM Startup Radar | [https://raem.kz/startup/metaclinic-kz/](https://raem.kz/startup/metaclinic-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Microsoft Azure (KZ) | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| migrahelp! | RAEM Startup Radar | [https://raem.kz/startup/migrahelp/](https://raem.kz/startup/migrahelp/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| mineral intelligence | RAEM Startup Radar | [https://raem.kz/startup/mineral-intelligence/](https://raem.kz/startup/mineral-intelligence/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| mssp.global | RAEM Startup Radar | [https://raem.kz/startup/mssp-global/](https://raem.kz/startup/mssp-global/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| mycar.kz (тоо «mycar») | RAEM Startup Radar | [https://raem.kz/startup/mycar-kz/](https://raem.kz/startup/mycar-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| myupgrade | RAEM Startup Radar | [https://raem.kz/startup/myupgrade/](https://raem.kz/startup/myupgrade/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| nace.ai | RAEM Startup Radar | [https://raem.kz/startup/nace-ai/](https://raem.kz/startup/nace-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| naimi.kz | RAEM Startup Radar | [https://raem.kz/startup/naimi-kz/](https://raem.kz/startup/naimi-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| NCI (Национальные информационные технологии) | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| ncspeech | RAEM Startup Radar | [https://raem.kz/startup/ncspeech/](https://raem.kz/startup/ncspeech/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| nedra.kz | RAEM Startup Radar | [https://raem.kz/startup/nedra-kz/](https://raem.kz/startup/nedra-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| neuroglove | RAEM Startup Radar | [https://raem.kz/startup/neuroglove/](https://raem.kz/startup/neuroglove/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| nex | RAEM Startup Radar | [https://raem.kz/startup/nex/](https://raem.kz/startup/nex/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| nozomio | RAEM Startup Radar | [https://raem.kz/startup/nozomio/](https://raem.kz/startup/nozomio/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| odd meter | RAEM Startup Radar | [https://raem.kz/startup/odd-meter/](https://raem.kz/startup/odd-meter/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| oki (ранее aleem) | RAEM Startup Radar | [https://raem.kz/startup/aleem/](https://raem.kz/startup/aleem/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| olymp studio | RAEM Startup Radar | [https://raem.kz/startup/olymp-studio/](https://raem.kz/startup/olymp-studio/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| onorta | RAEM Startup Radar | [https://raem.kz/startup/onorta/](https://raem.kz/startup/onorta/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| OpenAI | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| openrbt | RAEM Startup Radar | [https://raem.kz/startup/openrbt/](https://raem.kz/startup/openrbt/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| pandev metrics | RAEM Startup Radar | [https://raem.kz/startup/pandev-metrics/](https://raem.kz/startup/pandev-metrics/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| parqour | RAEM Startup Radar | [https://raem.kz/startup/parqour/](https://raem.kz/startup/parqour/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| partners pay | RAEM Startup Radar | [https://raem.kz/startup/partners-pay/](https://raem.kz/startup/partners-pay/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| pearlingo | RAEM Startup Radar | [https://raem.kz/startup/pearlingo/](https://raem.kz/startup/pearlingo/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| phorm | RAEM Startup Radar | [https://raem.kz/startup/phorm/](https://raem.kz/startup/phorm/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| porte | RAEM Startup Radar | [https://raem.kz/startup/porte/](https://raem.kz/startup/porte/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| prosper pay / prosper group | RAEM Startup Radar | [https://raem.kz/startup/prosper-pay/](https://raem.kz/startup/prosper-pay/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| protector ai (тоо «protector ai») | RAEM Startup Radar | [https://raem.kz/startup/protector-ai/](https://raem.kz/startup/protector-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| PS Cloud Services | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| pulsar ai (pulsar.ai) | RAEM Startup Radar | [https://raem.kz/startup/pulsar-ai/](https://raem.kz/startup/pulsar-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| qala ai | RAEM Startup Radar | [https://raem.kz/startup/qala-ai/](https://raem.kz/startup/qala-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| qalam ai | RAEM Startup Radar | [https://raem.kz/startup/qalam-ai/](https://raem.kz/startup/qalam-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| qalan (qalan.kz) | RAEM Startup Radar | [https://raem.kz/startup/qalan-kz/](https://raem.kz/startup/qalan-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| qazbot technologies | RAEM Startup Radar | [https://raem.kz/startup/qazbot-technologies/](https://raem.kz/startup/qazbot-technologies/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| QazCloud (МЦРИАП) | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| QazDatacenter | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| QazVenture | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| qdata (kepler vision) | RAEM Startup Radar | [https://raem.kz/startup/qdata/](https://raem.kz/startup/qdata/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Quantum AI KZ | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| qvet ai | RAEM Startup Radar | [https://raem.kz/startup/qvet-ai/](https://raem.kz/startup/qvet-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| re:kassa (тоо «comrun») | RAEM Startup Radar | [https://raem.kz/startup/rekassa/](https://raem.kz/startup/rekassa/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Rekogn | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| rekreate ai (ранее re:create ai) | RAEM Startup Radar | [https://raem.kz/startup/recreate-ai/](https://raem.kz/startup/recreate-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| relog | RAEM Startup Radar | [https://raem.kz/startup/relog/](https://raem.kz/startup/relog/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| remofirst | RAEM Startup Radar | [https://raem.kz/startup/remofirst/](https://raem.kz/startup/remofirst/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| resti | RAEM Startup Radar | [https://raem.kz/startup/resti/](https://raem.kz/startup/resti/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| rixt.ai | RAEM Startup Radar | [https://raem.kz/startup/rixt-ai/](https://raem.kz/startup/rixt-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| robio | RAEM Startup Radar | [https://raem.kz/startup/robio/](https://raem.kz/startup/robio/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| s1lkpay | RAEM Startup Radar | [https://raem.kz/startup/s1lkpay/](https://raem.kz/startup/s1lkpay/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| salesbox | RAEM Startup Radar | [https://raem.kz/startup/salesbox/](https://raem.kz/startup/salesbox/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Senim | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| sensei | RAEM Startup Radar | [https://raem.kz/startup/sensei/](https://raem.kz/startup/sensei/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| set24 | RAEM Startup Radar | [https://raem.kz/startup/set24/](https://raem.kz/startup/set24/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| shai | RAEM Startup Radar | [https://raem.kz/startup/shai/](https://raem.kz/startup/shai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Silkroad Innovation Hub | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| sino ai | RAEM Startup Radar | [https://raem.kz/startup/sino-ai/](https://raem.kz/startup/sino-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| skillpass | RAEM Startup Radar | [https://raem.kz/startup/skillpass/](https://raem.kz/startup/skillpass/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Smart Aqmola | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| smart satu | RAEM Startup Radar | [https://raem.kz/startup/smart-satu/](https://raem.kz/startup/smart-satu/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Smart Ustaz | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| SmartVision | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| sonotiv | RAEM Startup Radar | [https://raem.kz/startup/sonotiv/](https://raem.kz/startup/sonotiv/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| sowita | RAEM Startup Radar | [https://raem.kz/startup/sowita/](https://raem.kz/startup/sowita/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| spacelab | RAEM Startup Radar | [https://raem.kz/startup/spacelab/](https://raem.kz/startup/spacelab/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| squares.kz | RAEM Startup Radar | [https://raem.kz/startup/squares-kz/](https://raem.kz/startup/squares-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| stiker.ai | RAEM Startup Radar | [https://raem.kz/startup/stiker-ai/](https://raem.kz/startup/stiker-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| suretter software | RAEM Startup Radar | [https://raem.kz/startup/suretter-software/](https://raem.kz/startup/suretter-software/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| taisan | RAEM Startup Radar | [https://raem.kz/startup/taisan/](https://raem.kz/startup/taisan/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| tanys | RAEM Startup Radar | [https://raem.kz/startup/tanys/](https://raem.kz/startup/tanys/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Target AI | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| Target AI (KazDream) | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| tastamat | RAEM Startup Radar | [https://raem.kz/startup/tastamat/](https://raem.kz/startup/tastamat/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| taxexpress | RAEM Startup Radar | [https://raem.kz/startup/taxexpress/](https://raem.kz/startup/taxexpress/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| taylor.kz | RAEM Startup Radar | [https://raem.kz/startup/taylor-kz/](https://raem.kz/startup/taylor-kz/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| tayyab | RAEM Startup Radar | [https://raem.kz/startup/tayyab/](https://raem.kz/startup/tayyab/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| Tele2 Kazakhstan | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| tendoo | RAEM Startup Radar | [https://raem.kz/startup/tendoo/](https://raem.kz/startup/tendoo/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| tevvoice (tev technologies) | RAEM Startup Radar | [https://raem.kz/startup/tevvoice/](https://raem.kz/startup/tevvoice/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| the fashion people / garderob | RAEM Startup Radar | [https://raem.kz/startup/garderob/](https://raem.kz/startup/garderob/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| tomo24 | RAEM Startup Radar | [https://raem.kz/startup/tomo24/](https://raem.kz/startup/tomo24/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| trustexam ai | RAEM Startup Radar | [https://raem.kz/startup/trustexam-ai/](https://raem.kz/startup/trustexam-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| trustme | RAEM Startup Radar | [https://raem.kz/startup/trustme/](https://raem.kz/startup/trustme/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| TSARKA (Центр анализа и расследования кибератак) | AI Qazaqstan registry | [https://aiqazaqstan.com/ru/startups](https://aiqazaqstan.com/ru/startups) | Запись обнаружена в реестре AI Qazaqstan; организация/стартап и первичный источник требуют классификации. |
| tsarka / webtotem | RAEM Startup Radar | [https://raem.kz/startup/tsarka-webtotem/](https://raem.kz/startup/tsarka-webtotem/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| typipay | RAEM Startup Radar | [https://raem.kz/startup/typipay/](https://raem.kz/startup/typipay/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| ustaz ai | RAEM Startup Radar | [https://raem.kz/startup/ustaz-ai/](https://raem.kz/startup/ustaz-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| uvu (uvu shuttle) | RAEM Startup Radar | [https://raem.kz/startup/uvu/](https://raem.kz/startup/uvu/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| vbox social | RAEM Startup Radar | [https://raem.kz/startup/vbox-social/](https://raem.kz/startup/vbox-social/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| verigram | RAEM Startup Radar | [https://raem.kz/startup/verigram/](https://raem.kz/startup/verigram/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| voiceclinic.ai (тоо «voiceclinic ai») | RAEM Startup Radar | [https://raem.kz/startup/voiceclinic-ai/](https://raem.kz/startup/voiceclinic-ai/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| wispy | RAEM Startup Radar | [https://raem.kz/startup/wispy/](https://raem.kz/startup/wispy/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| wonder | RAEM Startup Radar | [https://raem.kz/startup/wonder/](https://raem.kz/startup/wonder/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| wonk | RAEM Startup Radar | [https://raem.kz/startup/wonk/](https://raem.kz/startup/wonk/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| wooppay | RAEM Startup Radar | [https://raem.kz/startup/wooppay/](https://raem.kz/startup/wooppay/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |
| zebraeye | RAEM Startup Radar | [https://raem.kz/startup/zebraeye/](https://raem.kz/startup/zebraeye/) | Обнаружен в каталоге RAEM; первичный источник ещё не добавлен. |

### Причины не включать запись в публичную статистику

- Discovery-каталог не является подтверждением описания или текущей деятельности компании.
- Некоторые записи ещё могут оказаться фондами, организациями, акселераторами, университетскими проектами или поставщиками, а не стартапами.
- У непроверенных кандидатов не публикуются личные контакты, основатели, возраст, инвестиционные данные и неподтверждённые сведения.
- Данные исследования RISE не превращаются в 1 500 карточек; в отчёт попадают только локально описанные записи.

## Категории каталога

В платформе заведены 22 категории: AI & Machine Learning, Generative AI, DeepTech, FinTech, EdTech, HealthTech, MedTech, AgriTech, GovTech, SaaS & B2B, Cybersecurity, Robotics & Hardware, Logistics & Mobility, E-commerce, GameDev, MarTech, LegalTech, PropTech, IndustrialTech, ClimateTech, SpaceTech и Other Technology. Одна компания может иметь несколько категорий.

## Повторное получение снимка

`./scripts/import-research-sources.ps1` обновляет источник и экспортирует компании/кандидатов. Откройте diff JSON и этот отчёт после обновления; автоматическое обновление не присваивает кандидатам статус VERIFIED. Описание источника и дата проверки хранятся в каждой карточке.

Сопутствующие источники: [RISE 2026](https://www.rise.com.kz/reports/kazakhstan-startup-landscape-2026), [Digital Bridge finalists](https://astanahub.com/ru/article/na-ai-digital-bridge-2026-14-startapov-vyshli-v-final-astana-hub-battle1790945325), [Digital Almaty](https://www.gov.kz/org/maidd/press/news/details/929058?lang=ru), [Soup](https://trysoup.dev/about), [CITIX](https://citix.me/), [Biometric.kz](https://biometric.kz/).
