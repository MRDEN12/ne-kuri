# 🌳 Сад — промпты для генерации визуала (Nano Banana / Veo)

Как пользоваться: копируешь промпт → генеришь в Gemini (Nano Banana — картинки, Veo — видео) → присылаешь мне результат, я вставляю в приложение (`ne-kuri/assets/`).

---

## 0. ЕДИНЫЙ СТИЛЬ (вставлять в каждый промпт, чтобы ассеты были в одном стиле)

> **STYLE:** cozy storybook game art, soft painterly shading, thick friendly outlines, warm saturated palette, gentle rim light, clean silhouette, centered composition, front view, no text, no watermark, no UI, mobile game asset.

**Технические требования:**
- Спрайты (деревья, украшения): **PNG с прозрачным фоном (alpha)**, 1024×1024 или 2048×2048, объект по центру, снизу «посадочная» точка у нижней границы.
- Фоны: **PNG/JPG 1080×1920 (9:16)**, без текста, верхняя часть — небо, нижняя — земля/трава.
- Видео (Veo): **вертикаль 1080×1920, 3–6 сек, бесшовный цикл**, без текста; если просишь анимацию только дерева — «on transparent / green-screen background».

---

## 1. NANO BANANA — статичные ассеты

### 1.1 Фоны (4 шт., 1080×1920)
1. **День:** «A cozy meadow background for a mobile game, bright blue sky with soft white clouds, gentle green hills, warm sunlight, tiny wildflowers in the foreground, painterly storybook style, no characters, no text, vertical 9:16.»
2. **Закат:** «A sunset meadow background for a mobile game, warm orange and pink sky, low golden sun, long soft shadows, silhouetted grass, cozy painterly storybook style, no characters, no text, vertical 9:16.»
3. **Ночь:** «A calm night meadow background for a mobile game, deep blue sky, crescent moon, scattered twinkling stars, soft fireflies glow, dark green grass, cozy painterly storybook style, no characters, no text, vertical 9:16.»
4. **Космос:** «A dreamy cosmic garden background for a mobile game, purple nebula sky, distant planets and stars, soft glowing horizon, surreal cozy painterly style, no characters, no text, vertical 9:16.»

### 1.2 Дерево по стадиям роста (6 шт., прозрачный фон, одно масштабирование камера/ракурс)
5. **Росток:** «A tiny green sprout with two small leaves growing from a small mound of soil, cute mobile game asset, transparent background, centered, front view. [STYLE]»
6. **Саженец:** «A young sapling tree about knee height with a thin trunk and a few branches, cute mobile game asset, transparent background, centered, front view. **Same camera and scale as the previous growth stage.** [STYLE]»
7. **Молодое дерево:** «A young tree about half height, fuller green canopy, sturdy trunk, cute mobile game asset, transparent background, centered, front view. Same camera/scale. [STYLE]»
8. **Взрослый дуб:** «A majestic mature oak tree with a wide lush green canopy and a thick trunk, cute mobile game asset, transparent background, centered, front view. Same camera/scale. [STYLE]»
9. **Сакура:** «A beautiful mature cherry-blossom tree, pink blossom canopy, a few petals falling, cute mobile game asset, transparent background, centered, front view. Same camera/scale. [STYLE]»
10. **Дуб-босс:** «An ancient giant magical oak tree, glowing golden leaves, mossy trunk, tiny lanterns hanging, legendary mobile game asset, transparent background, centered, front view. Same camera/scale. [STYLE]»

### 1.3 Украшения (8 шт., прозрачный фон, 512×512)
11. **Птичка:** «A cute little blue bird perched, side view, mobile game decoration asset, transparent background. [STYLE]»
12. **Фонарик:** «A warm glowing paper lantern on a small wooden stand, mobile game decoration asset, transparent background. [STYLE]»
13. **Черепаха:** «A friendly small turtle, top-front view, mobile game decoration asset, transparent background. [STYLE]»
14. **Фонтан:** «A small stone garden fountain with softly splashing water, mobile game decoration asset, transparent background. [STYLE]»
15. **Воздушный змей:** «A colorful paper kite with a ribbon tail, mobile game decoration asset, transparent background. [STYLE]»
16. **Радуга:** «A soft pastel rainbow arc, mobile game decoration asset, transparent background. [STYLE]»
17. **Банка светлячков:** «A glass jar with glowing fireflies, mobile game decoration asset, transparent background. [STYLE]»
18. **Гномик:** «A tiny cute garden gnome with a red hat, mobile game decoration asset, transparent background. [STYLE]»

### 1.4 Мелочи (по желанию)
19. **Иконки магазина:** «A set of 6 cute round game icons (tree, decoration, background, coin/leaf, lock, star), flat with soft shading, on a neutral background, no text.»
20. **Лист-валюта:** «A cute glossy green leaf coin icon, game currency, transparent background, centered.»

---

## 2. VEO — короткие анимации (бесшовные циклы)

21. **Колыхание кроны (главное):** «A majestic oak tree canopy gently swaying in a soft breeze, subtle leaf movement, seamless 4-second loop, centered, on a transparent (or pure green) background, no text, cinematic soft light.»
22. **Падающие листья (оверлей):** «A few autumn leaves slowly falling and drifting, seamless loop, on a transparent (or pure green) background, no text — used as an overlay above the scene.»
23. **Растущее дерево:** «A tiny sprout growing into a lush mature tree in a smooth time-lapse, 5 seconds, one continuous shot, centered, transparent background, no text.»
24. **Фонтан:** «A small stone garden fountain with water gently splashing and rippling, seamless 4-second loop, transparent background, no text.»
25. **Смена дня и ночи:** «A cozy meadow time-lapse from sunny day to starry night and back, smooth seamless 6-second loop, vertical 9:16, no text, no characters.»
26. **Светлячки:** «Soft glowing fireflies drifting in a dark meadow at night, seamless 5-second loop, vertical 9:16, no text.»
27. **Полёт птицы:** «A cute little bird flying across the screen in a smooth arc, seamless loop, transparent background, no text.»

---

## 3. Как это подключим (что мне вернуть)

- Присылай файлы как есть (PNG/MP4/WebM) — я положу в `ne-kuri/assets/` и подключу:
  - фоны → фон сцены (с плавным кроссфейдом при смене);
  - стадии дерева → замена emoji-дерева по уровню роста;
  - украшения → покупки в магазине (вместо emoji);
  - анимации (Veo) → видео-слои поверх сцены: крона колышется, листья падают, фонтан, день/ночь, светлячки.
- Формат имён (пример): `bg_day.png`, `tree_03.png`, `deco_bird.png`, `anim_sway.webm`.
- Если Veo отдаёт без альфы — сделаю «хромакей» (green screen) или наложу с микс-режимом.

**Уже сейчас (без ассетов)** сад в приложении анимирован на CSS: дерево покачивается, листья падают, плывут облака, ночью мерцают звёзды и светлячки, украшения покачиваются. Сгенерированный визуал ляжет поверх и заменит emoji.
