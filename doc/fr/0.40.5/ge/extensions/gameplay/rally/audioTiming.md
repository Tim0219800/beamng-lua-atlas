# `gameplay_rally_audioTiming`

*Fichier : `lua/ge/extensions/gameplay/rally/audioTiming.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_audioTiming` : `extensions.load("gameplay_rally_audioTiming")`, puis la globale `gameplay_rally_audioTiming`

Bornes et fonctions de limitation (clamp) des réglages d'espacement audio du copilote de rallye, en millisecondes : écart entre virages, entre phrases, entre mots de liaison et entre notes. Chaque fonction arrondit la valeur à l'entier et la ramène dans la plage autorisée. Utilisé par l'éditeur/les réglages et par gameplay_rally_audioManager.

## Remarques

- cornerGapMs, phraseGapMs et linkWordGapMs sont la MÊME table (min -200, max 200) : modifier l'une modifie les deux autres.
- pacenoteGapMs : min -100, max 400.
- Une valeur négative signifie un chevauchement des clips audio (déduit du nom du champ et de l'usage dans audioManager).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_audioTiming.clampCornerGapMs(value)` | Arrondit et limite un écart entre virages à cornerGapMs. | 27 |
| `gameplay_rally_audioTiming.clampLinkWordGapMs(value)` | Arrondit et limite un écart de mot de liaison à linkWordGapMs. | 35 |
| `gameplay_rally_audioTiming.clampPacenoteGapMs(value)` | Arrondit et limite un écart entre notes à pacenoteGapMs. | 39 |
| `gameplay_rally_audioTiming.clampPhraseGapMs(value)` | Arrondit et limite un écart entre phrases à phraseGapMs. | 31 |

### Détail des paramètres

#### `gameplay_rally_audioTiming.clampCornerGapMs(value)`

Arrondit et limite un écart entre virages à cornerGapMs.

- `value` (*number|string*) : Valeur en ms ; convertie par tonumber, 0 si invalide.
- **renvoie** : integer Valeur bornée en ms.

#### `gameplay_rally_audioTiming.clampLinkWordGapMs(value)`

Arrondit et limite un écart de mot de liaison à linkWordGapMs.

- `value` (*number|string*) : Valeur en ms.
- **renvoie** : integer Valeur bornée en ms.

#### `gameplay_rally_audioTiming.clampPacenoteGapMs(value)`

Arrondit et limite un écart entre notes à pacenoteGapMs.

- `value` (*number|string*) : Valeur en ms.
- **renvoie** : integer Valeur bornée en ms.

#### `gameplay_rally_audioTiming.clampPhraseGapMs(value)`

Arrondit et limite un écart entre phrases à phraseGapMs.

- `value` (*number|string*) : Valeur en ms.
- **renvoie** : integer Valeur bornée en ms.

## Champs

| Champ | Type | Description |
|---|---|---|
| `cornerGapMs` | table | Bornes {min=-200, max=200} de l'écart entre virages (ms). Table partagée avec phraseGapMs et linkWordGapMs. |
| `linkWordGapMs` | table | Bornes {min=-200, max=200} de l'écart avec les mots de liaison (ms). |
| `pacenoteGapMs` | table | Bornes {min=-100, max=400} de l'écart entre deux notes (ms). |
| `phraseGapMs` | table | Bornes {min=-200, max=200} de l'écart entre phrases (ms). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/audioTiming.lua`.*
