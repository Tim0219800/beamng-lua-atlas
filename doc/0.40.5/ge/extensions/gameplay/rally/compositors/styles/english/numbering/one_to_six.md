# `gameplay_rally_compositors_styles_english_numbering_one_to_six`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/one_to_six.lua` · VM : Game Engine (GE) · 65 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_styles_english_numbering_one_to_six` : `extensions.load("gameplay_rally_compositors_styles_english_numbering_one_to_six")`, puis la globale `gameplay_rally_compositors_styles_english_numbering_one_to_six`

Numérotation anglaise partagée des virages de 1 (très serré) à 6 (quasi plat), avec pour chaque niveau le texte parlé, la plage de diamètre physique (m), le visuel (icône turn1 à turn6, couleurs néon) et les tranches de longueur d'arc (short, standard, half long, long, extra long). Utilisé par english/enthusiast ; les fichiers de style gardent la responsabilité de la compatibilité des chaînes et de l'audio, ce module sert aux nouveaux styles composés et aux outils de calibrage.

## Remarques

- Diamètres (m) : one [0,35[, two [35,65[, three [65,116[, four [116,190[, five [190,260[, six [260,+inf[.
- Les ids de longueur sont les mêmes pour tous les niveaux (short, standard, halfLong, long, extraLong) ; 'standard' n'a pas de texte (rien n'est dit).
- Le commentaire du fichier demande de ne pas modifier les valeurs réglées à la main (marquées 'hand tuned') sans consulter l'auteur.
- Seuils de arcMeters de 'short'/'standard' : one 6/35, two 6/55, three 28/60, four 37/85, five 42/100, six 50/100.
- Le module renvoie directement la table {id, intensity, lengthsByIntensity}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `id` | string | 'one_to_six'. |
| `intensity` | table[] | Six entrées {id, text, diameter, visual} ordonnées de one à six. |
| `lengthsByIntensity` | table<string, table[]> | Pour chaque id d'intensité (one..six), cinq tranches {id, text, arcMeters={min,max}} ; la dernière (extraLong) n'a pas de max. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/one_to_six.lua`.*
