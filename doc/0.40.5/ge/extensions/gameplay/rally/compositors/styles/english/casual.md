# `gameplay_rally_compositors_styles_english_casual`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/styles/english/casual.lua` · VM : Game Engine (GE) · 115 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_styles_english_casual` : `extensions.load("gameplay_rally_compositors_styles_english_casual")`, puis la globale `gameplay_rally_compositors_styles_english_casual`

Style de notes de rallye 'English casual' : un copilote anglais simplifié qui annonce les virages en 'easy / medium / hard' (numérotation easy_medium_hard) plus les descripteurs flat, square et hairpin. Il n'énonce ni appel de distance (distance.callsEnabled = false), ni longueur, ni forme de virage. Il n'utilise qu'un sous-ensemble de modificateurs (sauts, crêtes, éclaboussures, changements de surface, stop/finish, chicanes) et des alias qui ramènent les autres variantes vers ces modificateurs. Réutilise les modules distance, visual, caution, systemPacenotes et modifiers du dossier english.

## Remarques

- AVERTISSEMENT du fichier : toute modification d'une chaîne utilisée pour une note impose de régénérer les fichiers audio.
- Le style se compose de la même façon que les autres : M.composite = compositorUtil.compositeFromPhrases, M.enumerate = compositorUtil.enumerateConcise.
- Les alias (casualModifierAliases) : jump/badDipJump/badJump/bigJump -> overJump ; variantes de crête -> crest ; water/intoWater -> watersplash ; overFinish -> finish ; openHairpin/tightHairpin -> hairpin.
- Le champ descriptorAliases n'existe que dans ce style parmi les trois styles de cette série.
- Validé par styleValidator au chargement par textCompositor.

## Champs

| Champ | Type | Description |
|---|---|---|
| `componentTypes` | table | Registre des composants : corner (numérotation easy_medium_hard, direction left/right, descripteurs flat/square/hairpin), caution (english/caution), modifiers (sous-ensemble) et modifierAliases. |
| `composite` | function | compositorUtil.compositeFromPhrases : (config, structured, distBefore, distAfter, escapeVars) -> liste de textes. |
| `distance` | table | Config de distance copiée du style english/distance mais avec callsEnabled = false (aucun appel de distance parlé). |
| `enumerate` | function | compositorUtil.enumerateConcise : (textCompositor, config) -> liste de phrases uniques. |
| `system` | table | Notes système localisées (english/systemPacenotes). |
| `visualGeneral` | table | Couleurs générales des notes visuelles (intoColor, distanceColor), depuis english/visual. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/styles/english/casual.lua`.*
