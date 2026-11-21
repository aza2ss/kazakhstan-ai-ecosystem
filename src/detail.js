const $ = selector => document.querySelector(selector);
const esc = value => String(value ?? '').replace(/[&<>"']/g, char => ({
  '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;'
}[char]));

const typeLabels = {
  startup: 'Стартап', 'technology-company': 'Технологическая компания',
  university: 'Университет', community: 'Сообщество', company: 'Компания'
};
const categoryLabels = {
  'ai-ml': 'ИИ и машинное обучение', 'generative-ai': 'Генеративный ИИ',
  deeptech: 'DeepTech', saas: 'SaaS', 'saas-b2b': 'B2B SaaS',
  healthtech: 'HealthTech', medtech: 'MedTech', fintech: 'FinTech',
  govtech: 'GovTech', edtech: 'EdTech', industrialtech: 'Промышленные технологии'
};

function safeUrl(value) {
  try {
    const url = new URL(value);
    return ['http:', 'https:'].includes(url.protocol) ? url.href : '';
  } catch { return ''; }
}

function sourceName(value) {
  try {
    const host = new URL(value).hostname.replace(/^www\./, '');
    if (host === 'astanahub.vc') return 'Astana Hub Ventures';
    if (host === 'askalem.com') return 'Alem';
    return host;
  } catch { return 'Источник'; }
}

function formatDate(value) {
  if (!value) return '';
  const date = new Date(/^\d{4}-\d{2}-\d{2}$/.test(value) ? `${value}T12:00:00` : value);
  return Number.isNaN(+date) ? String(value) : new Intl.DateTimeFormat('ru-RU', { dateStyle: 'long' }).format(date);
}

function contactMarkup(value) {
  return esc(value)
    .replace(/([A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,})/gi, '<a href="mailto:$1">$1</a>')
    .replace(/(https?:\/\/[^\s<]+)/gi, '<a href="$1" target="_blank" rel="noopener">$1 ↗</a>');
}

function renderStartup(x) {
  document.title = `${x.name} · Startup Hub`;
  const categories = (Array.isArray(x.category_slugs) ? x.category_slugs : [])
    .map(value => categoryLabels[value] || value.replaceAll('-', ' '));
  const socials = (Array.isArray(x.official_socials) ? x.official_socials : [])
    .map(value => {
      const url = safeUrl(value);
      if (!url) return '';
      return `<a href="${esc(url)}" target="_blank" rel="noopener">${esc(sourceName(url))} ↗</a>`;
    }).filter(Boolean);
  const team = Array.isArray(x.team_members) ? x.team_members : [];
  const members = team.map(member => {
    const profile = safeUrl(member.url);
    return `<li><strong>${esc(member.name)}</strong>${member.role ? ` · ${esc(member.role)}` : ''}${profile ? ` · <a href="${esc(profile)}" target="_blank" rel="noopener">Профиль ↗</a>` : ''}</li>`;
  }).join('');
  const logo = safeUrl(x.logo_url);
  const website = safeUrl(x.website);
  const websiteHost = website ? sourceName(website) : '';
  const stage = String(x.stage || '').trim();
  const location = [x.city, x.country].filter(Boolean).join(', ') || x.team_location || '';
  const type = typeLabels[x.record_type] || x.record_type || '';
  const metadata = [
    ['Стадия', stage],
    ['Направление', x.industry === 'ai' ? 'Искусственный интеллект' : x.industry],
    ['Страна происхождения', x.country_of_origin],
    ['Страна регистрации', x.country_of_registration],
    ['Команда и штаб-квартира', x.team_location || x.city],
    ['География работы', x.activity_geography],
    ['Публичный контакт', x.public_contact ? contactMarkup(x.public_contact) : 'Публичный контакт не указан в источниках карточки'],
    ['Профили', socials.join(' · ')],
    ['Статус источников', x.verification_status === 'VERIFIED' ? 'Подтверждено' : 'Частично подтверждено'],
    ['Последняя проверка', formatDate(x.checked_at)]
  ].filter(([, value]) => String(value || '').trim());
  const sources = [
    ['Официальный сайт', x.website],
    ['Основной источник', x.primary_source || x.source],
    ['Дополнительный источник', x.secondary_source],
    ['Источник обнаружения', x.discovery_source]
  ];
  const seen = new Set();
  const sourceItems = sources.map(([label, value]) => {
    const url = safeUrl(value);
    if (!url || seen.has(url)) return '';
    seen.add(url);
    return `<li><a href="${esc(url)}" target="_blank" rel="noopener">${esc(label)} · ${esc(sourceName(url))} ↗</a></li>`;
  }).filter(Boolean).join('');

  $('#detail').innerHTML = `
    <a href="/#startups" class="back-link">← К каталогу</a>
    <section class="detail-hero">
      ${logo ? `<img class="startup-detail-logo" src="${esc(logo)}" alt="Логотип ${esc(x.name)}" loading="lazy">` : ''}
      <div class="eyebrow">${[type, location].filter(Boolean).map(esc).join(' · ')}</div>
      <h1>${esc(x.name)}</h1>
      ${x.tagline ? `<p>${esc(x.tagline)}</p>` : ''}
      ${stage ? `<div class="detail-meta"><span>Стадия: ${esc(stage)}</span></div>` : ''}
      <div class="detail-actions">
        ${website ? `<a class="button" href="${esc(website)}" target="_blank" rel="noopener">Официальный сайт · ${esc(websiteHost)} ↗</a>` : ''}
        ${x.secondary_source && safeUrl(x.secondary_source) !== website ? `<a class="text-link" href="${esc(safeUrl(x.secondary_source))}" target="_blank" rel="noopener">Проверить в источнике ↗</a>` : ''}
      </div>
    </section>
    <div class="detail-grid">
      <div class="detail-main">
        ${x.description ? `<h2>О проекте</h2><p class="detail-description">${esc(x.description)}</p>` : ''}
        ${categories.length ? `<h2>Направления</h2><div class="detail-tracks">${categories.map(value => `<span>${esc(value)}</span>`).join('')}</div>` : ''}
        <h2>Команда</h2>
        ${members ? `<ul class="detail-team">${members}</ul>` : '<p class="detail-muted">В карточке нет подтверждённых сведений о составе команды.</p>'}
        ${sourceItems ? `<h2>Источники</h2><div class="detail-source-list"><ul>${sourceItems}</ul></div>` : ''}
      </div>
      <dl class="detail-info">${metadata.map(([label, value]) => `<dt>${esc(label)}</dt><dd>${value}</dd>`).join('')}</dl>
    </div>`;
  $('#detail .startup-detail-logo')?.addEventListener('error', event => event.currentTarget.remove(), { once: true });
}

function renderEvent(x) {
  document.title = `${x.name} · Startup Hub`;
  const start = new Date(x.start_at);
  const end = new Date(x.end_at);
  const status = Number.isNaN(+start) ? '' : Date.now() < +start ? 'Предстоит' : Date.now() < +end ? 'Идёт' : 'Завершён';
  const date = value => Number.isNaN(+value) ? '' : new Intl.DateTimeFormat('ru-RU', { timeZone: 'Asia/Almaty', dateStyle: 'long' }).format(value);
  const tracks = Array.isArray(x.tracks) ? x.tracks : [];
  const eventUrl = safeUrl(x.website || x.official_url || x.source_url);
  $('#detail').innerHTML = `
    <a href="/hackathons/events" class="back-link">← К хакатонам</a>
    <section class="detail-hero"><div class="eyebrow">${[x.format, x.city, status].filter(Boolean).map(esc).join(' · ')}</div>
      <h1>${esc(x.name)}</h1>${x.organizer ? `<p>${esc(x.organizer)}</p>` : ''}
      ${eventUrl ? `<div class="detail-actions"><a class="button" href="${esc(eventUrl)}" target="_blank" rel="noopener">Официальная страница ↗</a></div>` : ''}
    </section>
    <div class="detail-grid"><div>
      ${x.description ? `<h2>О мероприятии</h2><p class="detail-description">${esc(x.description)}</p>` : ''}
      ${tracks.length ? `<h2>Направления</h2><div class="detail-tracks">${tracks.map(value => `<span>${esc(value)}</span>`).join('')}</div>` : ''}
    </div><dl class="detail-info">
      ${date(start) ? `<dt>Даты · Алматы</dt><dd>${esc(date(start))}${date(end) ? ` — ${esc(date(end))}` : ''}</dd>` : ''}
      ${x.address || x.city ? `<dt>Место</dt><dd>${[x.address, x.city].filter(Boolean).map(esc).join(', ')}</dd>` : ''}
      ${x.format ? `<dt>Формат</dt><dd>${esc(x.format)}</dd>` : ''}
      ${x.registration_status ? `<dt>Регистрация</dt><dd>${esc(x.registration_status)}</dd>` : ''}
      ${x.organizer ? `<dt>Организатор</dt><dd>${esc(x.organizer)}</dd>` : ''}
    </dl></div>`;
}

async function load() {
  const type = location.pathname.includes('startup') ? 'startup' : 'event';
  const id = new URLSearchParams(location.search).get('id');
  if (!id) {
    $('#detail').innerHTML = '<a class="back-link" href="/">← На главную</a><h1>Не указан объект каталога</h1>';
    return;
  }
  try {
    const response = await fetch(`/api/${type === 'startup' ? 'startups' : 'events'}/${encodeURIComponent(id)}`);
    const item = await response.json();
    if (!response.ok) throw new Error(item.error || 'Объект не найден');
    type === 'startup' ? renderStartup(item) : renderEvent(item);
  } catch (error) {
    console.error(error);
    $('#detail').innerHTML = `<a class="back-link" href="/">← В каталог</a><h1>Не удалось загрузить страницу</h1><p class="detail-muted">${esc(error.message || 'Проверьте соединение и попробуйте снова.')}</p>`;
  }
}

document.addEventListener('DOMContentLoaded', load);
