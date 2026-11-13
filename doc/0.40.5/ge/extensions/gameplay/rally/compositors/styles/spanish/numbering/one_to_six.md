# `gameplay_rally_compositors_styles_spanish_numbering_one_to_six`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/styles/spanish/numbering/one_to_six.lua` · VM : Game Engine (GE) · 60 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_styles_spanish_numbering_one_to_six` : `extensions.load("gameplay_rally_compositors_styles_spanish_numbering_one_to_six")`, puis la globale `gameplay_rally_compositors_styles_spanish_numbering_one_to_six`

Numérotation espagnole partagée des virages de 1 à 6 : textes parlés (uno, dos, tres, cuatro, cinco, seis), plages de diamètre physique (m), visuels avec palette CSS BeamNG (red550, orange, yellow400, peach300, blue500, green500) et tranches de longueur d'arc (corta, standard sans texte, media larga, larga, extra larga). Utilisé par spanish/enthusiast.

## Remarques

- Diamètres identiques à la version anglaise : [0,35[, [35,65[, [65,116[, [116,190[, [190,260[, [260,+inf[ m.
- Les seuils de longueur diffèrent légèrement de l'anglais (ex. four standard 35 à 80, five standard 42 à 90, bornes à .5 pour one et three).
- 'standard' n'a pas de texte : rien n'est dit pour une longueur standard.
- Le module renvoie directement la table {id, intensity, lengthsByIntensity}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `id` | string | 'one_to_six'. |
| `intensity` | table[] | Six entrées {id, text, diameter, visual} ordonnées de one à six. |
| `lengthsByIntensity` | table<string, table[]> | Pour chaque intensité, cinq tranches {id, text, arcMeters={min,max}} (short, standard, halfLong, long, extraLong). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/styles/spanish/numbering/one_to_six.lua`.*
