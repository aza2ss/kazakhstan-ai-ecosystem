# Каталог хакатонов Startup Hub

## Страницы

- `/hackathons` — обзор, ближайшие события, карта и архив.
- `/hackathons/events` — список, типы, избранное, фильтры и страницы по 30 записей.
- `/hackathons/map` — кластерная карта OpenStreetMap, выбор города и переход в карточку.
- `/hackathons/calendar` — календарь по месяцам/неделям и дедлайнам.
- `/hackathons/archive` — завершившиеся события с фильтрами.
- `/hackathons/about` — методика импорта и источники.
- `/hackathons/organizers` и `/hackathons/submit` — форма предложения события.
- `/hackathons/registration` — помощь по регистрации.
- `/hackathons/:slug` — отдельная карточка события.

В шапке видна ссылка «Хакатоны» и меню с разделами; на узком экране меню открывается через значок ☰. Избранное хранится в localStorage текущего браузера.

## Импорт и обновление

`scripts/import-hackathons.ps1` получает публичный 2026 API hackathon.kz, facets и 2 страницы выдачи, затем пишет `data/hackathons.json`. Данные каталога обновляются при запуске сервера: опубликованные записи синхронизируются по slug; старые импортированные карточки источника, отсутствующие в новом снимке, скрываются.

Снимок содержит 40 карточек только из публичного каталога hackathon.kz: все активные/предстоящие на дату обновления и недавно завершившиеся до общего лимита 40. Буткемпы, питчи и конференции не смешиваются с хакатонами. Импорт и критерии выбора описаны в [HACKATHONS_IMPORT_REPORT.md](HACKATHONS_IMPORT_REPORT.md).

Фильтры берут города и темы из API facets, тип/даты/город/формат/темы используют одну таблицу `hackathon_events`. Все события питают список, архив, карту и календарь; координаты карты хранятся на записи с precision `city` и обозначают центр города. Точный адрес показывается только как текст источника.

## API

- `GET /api/hackathons/events` — фильтруемый каталог; параметры `q`, `period`, `year`, `city`, `topic`, `type`, `format`, `audience`, `from`, `to`, `sort`, `page`, `limit`.
- `GET /api/hackathons/archive` — прошедшие события.
- `GET /api/hackathons/events/:slug` — детальная карточка, обе status-группы, источники и изображения.
- `GET /api/hackathons/categories` — темы, полные города каталога и типы.
- `GET /api/hackathons/stats` — динамические счётчики.
- `POST /api/hackathons/submissions` — очередь заявок организаторов.

All-day source dates remain date-only in SQLite. The server interprets them as full calendar days in `Asia/Almaty`, including the ending day and registration deadline. Timestamps from source pages are preserved when present.

## Images and privacy

Карточки используют исходные афиши и изображения `hackathon.kz` по ссылкам, включая изображения из публичной галереи. Материалы не заменяются случайными фотографиями; если источник не публиковал image, интерфейс оставляет пустое нейтральное место. Точки карты приблизительные городские, персональные данные участников не импортируются.

## Local checks

`npm test` exercises server startup, startup catalog and stats, 40 hackathon records, filters, archive, API details, submissions, admin CRUD, date/status behavior and security checks.
