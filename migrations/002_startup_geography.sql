ALTER TABLE startups ADD COLUMN country_of_origin TEXT NOT NULL DEFAULT 'Не указано';
ALTER TABLE startups ADD COLUMN country_of_registration TEXT NOT NULL DEFAULT 'Не указано';
ALTER TABLE startups ADD COLUMN team_location TEXT NOT NULL DEFAULT 'Не указано';
ALTER TABLE startups ADD COLUMN activity_geography TEXT NOT NULL DEFAULT 'Не указано';
UPDATE startups SET country_of_origin='Казахстан', team_location=city, activity_geography='Казахстан' WHERE id='sergek';
UPDATE startups SET country_of_origin='Казахстан (происхождение; штаб-квартира/регистрация требуют отдельного подтверждения)', team_location='Международная команда', activity_geography='Международная деятельность' WHERE id='cerebra';
UPDATE startups SET country_of_origin='Казахстан', team_location=city, activity_geography='Казахстан' WHERE id='documentolog';
UPDATE startups SET country_of_origin='Не подтверждена', country_of_registration='Не подтверждена', team_location='Не подтверждено', activity_geography='Казахстан и Центральная Азия (по региональной публикации)' WHERE id='beyne';
