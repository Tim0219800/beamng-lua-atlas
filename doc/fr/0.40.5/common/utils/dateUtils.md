# `utils_dateUtils`

*Fichier : `lua/common/utils/dateUtils.lua` · VM : Commun (GE + véhicule) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils/dateUtils")`

Petits utilitaires de dates : conversion d'une chaîne ISO 8601 en timestamp Unix et calcul du temps écoulé depuis une date. Se charge avec require('utils/dateUtils'). Utile pour comparer des dates reçues d'une API ou d'un fichier.

## Exemple

```lua
local du = require('utils/dateUtils')
local secondes = du.timeSince('2025-01-31T12:00:00Z')
```

## Remarques

- Le motif attendu est AAAA-MM-JJTHH:MM:SSZ. Un second motif de secours accepte 'HH:MM:SS AMZ'/'PMZ'.
- Si la chaîne est illisible, une erreur est loguée et l'heure courante est utilisée (le résultat est alors 'maintenant').
- os.time interprète la table en heure LOCALE, alors que timeSince compare à os.date('!*t') (UTC) reconverti par os.time : le décalage de fuseau horaire peut fausser la différence (déduit du code).
- Bug probable dans la branche de secours AM/PM : hour vaut 0 (nombre) ou une chaîne selon le cas, puis tonumber est appliqué ; une heure '12 PM' reste '12'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_dateUtils.parseIso8601(datetime)` | Convertit une date-heure ISO 8601 (se terminant par Z) en timestamp Unix via os.time. Retourne l'heure courante en cas d'échec de lecture. | 8 |
| `utils_dateUtils.timeSince(datetime)` | Calcule le nombre de secondes écoulées entre la date donnée et maintenant (UTC). | 38 |

### Détail des paramètres

#### `utils_dateUtils.parseIso8601(datetime)`

Convertit une date-heure ISO 8601 (se terminant par Z) en timestamp Unix via os.time. Retourne l'heure courante en cas d'échec de lecture.

- `datetime` (*string*) : Ex. '2025-01-31T12:00:00Z'
- **renvoie** : integer Timestamp Unix en secondes

#### `utils_dateUtils.timeSince(datetime)`

Calcule le nombre de secondes écoulées entre la date donnée et maintenant (UTC).

- `datetime` (*string*) : Date ISO 8601
- **renvoie** : number Différence en secondes (os.difftime)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/dateUtils.lua`.*
