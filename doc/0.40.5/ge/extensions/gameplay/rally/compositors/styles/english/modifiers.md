# `gameplay_rally_compositors_styles_english_modifiers`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/styles/english/modifiers.lua` · VM : Game Engine (GE) · 149 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_styles_english_modifiers` : `extensions.load("gameplay_rally_compositors_styles_english_modifiers")`, puis la globale `gameplay_rally_compositors_styles_english_modifiers`

Catalogue des modificateurs atomiques anglais pour les notes de rallye (freinage, guidage de trajectoire, coupes, 'keep', chicanes, sauts, crêtes, creux, bosses, surfaces, eau, repères du bord de route, flux, appels de spéciale). Chaque entrée est {text, tags, visual, variant?} : text = phrase parlée, tags = catégories (pace, line, cut, keep, chicane, jump, crest, dip, bump, grade, surface, water, landmark, flow, stage), visual = icône/couleurs pour les notes visuelles ({} = pas de tuile). Utilisé par les styles english/casual et english/enthusiast.

## Remarques

- AVERTISSEMENT du fichier : toute modification d'un texte utilisé impose de régénérer les audios.
- Le module renvoie directement la table des modificateurs (pas de M).
- visual = {} (noVisual) signifie texte seul : le compositeur visuel ignore l'entrée. iconVisual(icon) donne une tuile violette (modifierBg/modifierStroke) ; additionalNoteVisual donne un badge (ciseaux, ciseaux barrés) rattaché à la note de virage.
- Cut : cut/bigCut/earlyCut/lateCut/smallCut = ciseaux verts ; dont/dontCut/dontCutLate = ciseaux barrés rouges.
- overCrest porte variant = '1' ; le champ shapes.overCrest du style enthusiast porte variant '2' pour éviter une collision de noms de fichier audio.
- Le texte de 'bump' est 'over bump' et celui de 'finish' est 'over finish'.

## Champs

| Champ | Type | Description |
|---|---|---|
| `atJunction` | table | 'at junction' (landmark). |
| `atRock` | table | 'at rock' (landmark). |
| `atTree` | table | 'at tree' (landmark). |
| `badDip` | table | 'bad dip' (dip), icône pothole. |
| `badDipJump` | table | 'bad dip jump' (jump). |
| `badDrop` | table | 'bad drop' (bump). |
| `badJump` | table | 'bad jump' (jump). |
| `badKick` | table | 'bad kick' (bump). |
| `beBrave` | table | 'be brave' (pace). |
| `bigCrest` | table | 'big crest' (crest). |
| `bigCut` | table | 'big cut' (cut), badge ciseaux. |
| `bigJump` | table | 'big jump' (jump). |
| `brake` | table | 'brake' (pace). |
| `brakeOverBumps` | table | 'brake over bumps' (pace). |
| `brakeOverCrest` | table | 'brake over crest' (pace). |
| `braking` | table | 'braking' (pace). |
| `bump` | table | 'over bump' (bump), icône bump. |
| `bumpy` | table | 'bumpy' (bump), icône bumps. |
| `chicaneLeftEntry` | table | 'chicane left entry' (chicane). |
| `chicaneRightEntry` | table | 'chicane right entry' (chicane). |
| `crest` | table | 'crest' (crest). |
| `cut` | table | 'cut' (cut), badge ciseaux. |
| `deceptive` | table | 'deceptive' (flow). |
| `dip` | table | 'dip' (dip). |
| `dont` | table | 'don't' (cut), badge ciseaux barrés. |
| `dontCut` | table | 'don't cut' (cut), badge ciseaux barrés. |
| `dontCutLate` | table | 'don't cut late' (cut), badge ciseaux barrés. |
| `dontGoWide` | table | 'don't go wide' (line). |
| `down` | table | 'down' (grade), sans visuel. |
| `drop` | table | 'drop' (bump). |
| `early` | table | 'early' (line). |
| `earlyCut` | table | 'early cut' (cut). |
| `finish` | table | 'over finish' (stage), icône finish noir et blanc. |
| `getsFasterNow` | table | 'gets faster now' (pace). |
| `goWide` | table | 'go wide' (line). |
| `intoBridge` | table | 'into bridge' (landmark), icône bridge. |
| `intoCrest` | table | 'into crest' (crest). |
| `intoTurn` | table | 'into turn' (pace). |
| `intoWater` | table | 'into water' (water). |
| `jump` | table | 'jump' (jump). |
| `keepIn` | table | 'keep in' (keep). |
| `keepLeft` | table | 'keep left' (keep). |
| `keepLeftOverCrest` | table | 'keep left over crest' (keep). |
| `keepMiddle` | table | 'keep middle' (keep). |
| `keepMiddleOverCrest` | table | 'keep middle over crest' (keep). |
| `keepRight` | table | 'keep right' (keep). |
| `keepRightOverCrest` | table | 'keep right over crest' (keep). |
| `kick` | table | 'kick' (bump). |
| `late` | table | 'late' (line). |
| `lateCut` | table | 'late cut' (cut). |
| `longCrest` | table | 'long crest' (crest). |
| `middle` | table | 'middle' (line). |
| `middleOverCrest` | table | 'middle over crest' (line). |
| `narrowBridge` | table | 'narrow bridge' (landmark), icône bridge. |
| `narrows` | table | 'narrows' (line), icône narrows. |
| `nips` | table | 'nips' (line). |
| `ontoGravel` | table | 'onto gravel' (surface). |
| `ontoIce` | table | 'onto ice' (surface). |
| `ontoMud` | table | 'onto mud' (surface). |
| `ontoTarmac` | table | 'onto tarmac' (surface). |
| `overBridge` | table | 'over bridge' (landmark), icône bridge. |
| `overCrest` | table | 'over crest' (crest), variant '1', icône crest. |
| `overDip` | table | 'over dip' (dip). |
| `overJump` | table | 'over jump' (jump), icône jumpOverBump. |
| `pastFence` | table | 'past fence' (landmark). |
| `pastHouse` | table | 'past house' (landmark). |
| `pastJunction` | table | 'past junction' (landmark). |
| `pastRock` | table | 'past rock' (landmark). |
| `pastTree` | table | 'past tree' (landmark). |
| `pastWall` | table | 'past wall' (landmark). |
| `slippy` | table | 'slippy' (surface). |
| `slowing` | table | 'slowing' (pace). |
| `smallCrest` | table | 'small crest' (crest). |
| `smallCut` | table | 'small cut' (cut). |
| `stop` | table | 'stop' (pace). |
| `sudden` | table | 'sudden' (flow). |
| `throughBridge` | table | 'through bridge' (landmark), icône bridge. |
| `throughDip` | table | 'through dip' (dip). |
| `throughGate` | table | 'through gate' (landmark). |
| `throughTunnel` | table | 'through tunnel' (landmark). |
| `toStop` | table | 'to stop' (stage). |
| `turn` | table | 'turn' (pace). |
| `twisty` | table | 'twisty' (line). |
| `underBridge` | table | 'under bridge' (landmark), icône bridge. |
| `up` | table | 'up' (grade), sans visuel. |
| `water` | table | 'water' (water). |
| `watersplash` | table | 'watersplash' (water), icône water. |
| `wide` | table | 'wide' (line). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/styles/english/modifiers.lua`.*
