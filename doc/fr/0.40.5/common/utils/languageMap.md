# `utils_languageMap`

*Fichier : `lua/common/utils/languageMap.lua` · VM : Commun (GE + véhicule) · 575 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils/languageMap")`

Tables de correspondance pour les langues : codes pays ISO 3166-1, codes de langue ISO 639-1, et codes spécifiques de Weblate (la plateforme de traduction de BeamNG). La fonction resolve() transforme un code de langue du jeu (ex. 'fr-FR', 'de_at') en nom lisible en anglais (ex. 'French (France)'). Se charge avec require('utils/languageMap'). Utile pour afficher le nom d'une langue dans un menu.

## Exemple

```lua
local lm = require('utils/languageMap')
print(lm.resolve('de-AT'))   -- nom lisible
print(lm.countries['FR'])
```

## Remarques

- Les clés de weblateCodes sont uniquement en minuscules (le commentaire du fichier insiste) ; resolve met la clé en minuscules et remplace '-' par '_'.
- countries est indexé par code pays en MAJUSCULES, languages par code en minuscules.
- Si le code n'est pas dans weblateCodes, resolve le découpe sur '_' : langue (via languages) puis pays optionnel entre parenthèses (via countries). Un code inconnu est renvoyé tel quel.
- La fonction utilise la globale split() de utils.lua.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_languageMap.resolve(key)` | Convertit un code de langue en nom lisible. Cherche d'abord dans weblateCodes, sinon compose 'Langue (Pays)'. | 544 |

### Détail des paramètres

#### `utils_languageMap.resolve(key)`

Convertit un code de langue en nom lisible. Cherche d'abord dans weblateCodes, sinon compose 'Langue (Pays)'.

- `key` (*string*) : Code de langue, ex. 'en-US', 'fr_FR', 'de_at'
- **renvoie** : string Nom lisible, ou le code d'origine si le découpage échoue

## Champs

| Champ | Type | Description |
|---|---|---|
| `countries` | table<string, string> | ISO 3166-1 : code pays à 2 lettres majuscules -> nom anglais (ex. ['FR']). |
| `languages` | table<string, string> | ISO 639-1 (et quelques codes à 3 lettres) : code langue minuscule -> nom anglais. |
| `weblateCodes` | table<string, string> | Codes Weblate en minuscules (ex. 'de_at', 'kokr_com', 'zhhans_com') -> nom lisible ; prioritaires dans resolve. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/languageMap.lua`.*
