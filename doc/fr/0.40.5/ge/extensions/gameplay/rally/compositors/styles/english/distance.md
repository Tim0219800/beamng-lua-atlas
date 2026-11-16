# `gameplay_rally_compositors_styles_english_distance`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/styles/english/distance.lua` · VM : Game Engine (GE) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_styles_english_distance` : `extensions.load("gameplay_rally_compositors_styles_english_distance")`, puis la globale `gameplay_rally_compositors_styles_english_distance`

Configuration des appels de distance des styles anglais : mots de liaison selon l'écart entre deux notes, unités parlées, règles d'arrondi et distance maximale énoncée. Lu par textCompositor (roundDistance, distanceToString, getDistanceCallShorthand...).

## Remarques

- Liens : écart < 5 m = aucun mot (text nil), < 20 m = 'into', < 40 m = 'and' ; au-delà, la distance est énoncée en chiffres.
- Unités : base 'm', large 'km', mot du point décimal 'point'.
- Arrondi : pas de 10 m sous 100 m, pas de 50 m de 100 m à 1000 m, au-delà de 1000 m valeur en km au pas de 250 m. Distance max : 2000 m.
- Le module renvoie directement la table (pas de M).

## Champs

| Champ | Type | Description |
|---|---|---|
| `links` | table[] | Liens ordonnés {threshold, text} aux seuils strictement croissants (5, 20, 40 m). |
| `max` | number | Distance maximale énoncée : 2000 m. |
| `rounding` | table | {small=10, medium=50, mediumThreshold=100, large=250, largeThreshold=1000} (mètres). |
| `units` | table | {base='m', large='km', point='point'}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/styles/english/distance.lua`.*
