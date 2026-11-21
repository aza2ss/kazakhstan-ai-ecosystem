# Starttup Hub — технологическая экосистема Казахстана

Платформа объединяет каталог стартапов и технологических компаний Казахстана и Центральной Азии с каталогом хакатонов, картой, календарём и архивом. На опубликованных карточках видны ссылки на источники, география и статус полноты проверки.

## Возможности

- Каталог стартапов с поиском, категориями, географией, направлением и AI relevance.
- Динамическая статистика: опубликованные, проверенные/частично проверенные, кандидаты, AI, DeepTech и региональные компании.
- Отдельные страницы проектов с происхождением, юрисдикцией, расположением команды, открытыми источниками и датой проверки.
- Очередь discovery-кандидатов PENDING, скрытая из публичной статистики до классификации и проверки.
- Каталог хакатонов с фильтрами, избранным, оригинальными афишами, пагинацией, картой, календарём, карточками и архивом.
- Даты и статусы хакатонов учитывают `Asia/Almaty`; даты без времени остаются календарными.
- Формы предложить стартап или событие и защищённая панель модерации.
- SQLite миграции и журнал действий администратора.
- Адаптивный интерфейс, на главной странице виден раздел «Хакатоны» и меню с разделами.
- Шрифт выбирается из SamsungOne / Samsung Sharp Sans при наличии в системе; иначе используется Roboto и системные sans-serif fallback. Проприетарные файлы Samsung не включены.

## Технологии и структура

- Node.js 22.13+; используется встроенный `node:sqlite`, внешние npm-зависимости не требуются.
- `server.mjs` — REST API и статический сервер.
- `migrations/` — схема SQLite и миграции каталога.
- `data/catalog.json` — исходные записи каталога; `data/startup-research.json` — опубликованные источники и discovery-кандидаты.
- `data/hackathons.json` — импортированный снимок событий hackathon.kz и MITU.
- `src/` — клиентские приложения и стили.
- `scripts/` — PowerShell импортеры и генератор исследовательского отчёта.

## Запуск на Windows

Из PowerShell в корне проекта:

```powershell
node --version
$env:PORT = '4173'
node server.mjs
```

Откройте [http://localhost:4173](http://localhost:4173). Не запускайте HTML через `file://`, потому что каталог загружает данные из API.

## Обновление наборов

```powershell
./scripts/import-hackathons.ps1
./scripts/import-research-sources.ps1
./scripts/generate-startup-report.ps1
```

Первый скрипт получает публичный каталог и facets hackathon.kz и записывает снимок с 39 событиями источника плюс MITU. Второй обновляет портфель Astana Hub Ventures, discovery-кандидатов RAEM и AI Qazaqstan. Непроверенные кандидаты остаются PENDING и не попадают в публичную выдачу.

Подробный разбор: [HACKATHONS_IMPORT_REPORT.md](HACKATHONS_IMPORT_REPORT.md), [HACKATHONS_MODULE.md](HACKATHONS_MODULE.md), [STARTUP_RESEARCH_REPORT.md](STARTUP_RESEARCH_REPORT.md).

## Администратор

Создайте первую учётную запись в отдельном PowerShell:

```powershell
node server.mjs admin:create admin@example.kz "Ваш-длинный-пароль-не-короче-12"
```

После запуска войдите в `/admin.html`. Публичной регистрации администраторов нет. Пароль хранится как salted scrypt hash, сессия — HttpOnly/SameSite cookie.

## Production

Production требует `SESSION_SECRET`; задайте переменные в окружении процесса. TLS завершайте на доверенном reverse proxy. Не публикуйте SQLite файл и `.env`: база может содержать заявки и деловые email.

```powershell
$env:SESSION_SECRET = [Convert]::ToHexString([Security.Cryptography.RandomNumberGenerator]::GetBytes(32))
$env:NODE_ENV = 'production'
$env:PORT = '4173'
node server.mjs
```

## API

- `GET /api/startups`, `GET /api/startups/:id`, `GET /api/startup-stats`
- `GET /api/events`, `GET /api/events/:id`
- `GET /api/hackathons/events`, `GET /api/hackathons/archive`, `GET /api/hackathons/events/:slug`
- `GET /api/hackathons/categories`, `GET /api/hackathons/stats`
- `POST /api/submissions`, `POST /api/hackathons/submissions`
- `/api/auth/*` и `/api/admin/*` требуют авторизации в соответствии с маршрутом.

Фильтры хакатонов включают поиск, период, год, город, тему, формат, тип, аудиторию, дату и сортировку; пагинация не ограничивает число записей в базе.

## Тестирование

```powershell
npm test
```

Integration suite использует временную SQLite базу и проверяет поиск/фильтры каталога стартапов, динамические счётчики, 40 хакатонов, города и темы, изображения и галерею события, статусы MITU, архив, публичные страницы, submissions, авторизацию и CRUD админ-панели.

## База и Git

При запуске автоматически применяются SQL-файлы из `migrations/`; база `data/kazai.sqlite` создаётся рядом с проектом и исключена из Git. Репозиторий имеет настроенный remote `origin` на GitHub `aza2ss/kazakhstan-ai-ecosystem`.
