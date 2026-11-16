# `gameplay_rally_notebook_systemPacenotes`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/systemPacenotes.lua` · VM : Game Engine (GE) · 144 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_notebook_systemPacenotes` : `extensions.load("gameplay_rally_notebook_systemPacenotes")`, puis la globale `gameplay_rally_notebook_systemPacenotes`

Détient la liste canonique des noms de pacenotes « système » du rallye (compte à rebours, avertissements de départ, vérifications radio/ceintures, faux départ…) et valide le tableau `system` d'un style de carnet. Chaque style doit fournir tous les noms de `required`, dans cet ordre ; les noms inconnus, doublons ou variantes sans texte sont rejetés. Utile à un moddeur qui écrit un style de copilote dans une nouvelle langue.

## Exemple

```lua
local sp = require('gameplay_rally_notebook_systemPacenotes')
local system = sp.localized({ countdown5 = 'Cinq', countdowngo = {'Go', 'Partez'} })
local ok = sp.validate(system, 'monStyle') -- false : les autres noms sont vides
```

## Remarques

- L'ordre de M.required est imposé : validate exige que system[i].name == required[i].
- localized() produit des entrées avec variants = {} pour les noms absents de la table ; validate les refuse ensuite (variants non vide obligatoire).
- validate journalise l'erreur avec log('E', 'systemPacenotes', ...) et renvoie false dès la première anomalie.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_notebook_systemPacenotes.localized(localized)` | Construit le tableau ordonné `system` d'un style à partir d'une table compacte nom -> texte. Chaque valeur peut être une chaîne, une table {text=...}, ou une liste de chaînes/tables (variantes). Les noms manquants ou de type invalide donnent une liste de variantes vide. | 70 |
| `gameplay_rally_notebook_systemPacenotes.validate(systemArray, styleName)` | Vérifie qu'un tableau `system` est une liste ordonnée complète : entrées-tables avec `name` chaîne, noms reconnus, dans l'ordre de `required`, sans doublon, avec une liste `variants` non vide dont chaque élément a un `text` non vide. | 82 |

### Détail des paramètres

#### `gameplay_rally_notebook_systemPacenotes.localized(localized)`

Construit le tableau ordonné `system` d'un style à partir d'une table compacte nom -> texte. Chaque valeur peut être une chaîne, une table {text=...}, ou une liste de chaînes/tables (variantes). Les noms manquants ou de type invalide donnent une liste de variantes vide.

- `localized` (*table<string, string|table>|nil*) : Textes localisés indexés par nom de pacenote système.
- **renvoie** : table[] Liste de { name = string, variants = { {text=string,...}, ... } } dans l'ordre de `required`.

#### `gameplay_rally_notebook_systemPacenotes.validate(systemArray, styleName)`

Vérifie qu'un tableau `system` est une liste ordonnée complète : entrées-tables avec `name` chaîne, noms reconnus, dans l'ordre de `required`, sans doublon, avec une liste `variants` non vide dont chaque élément a un `text` non vide.

- `systemArray` (*table*) : Tableau à valider (typiquement renvoyé par localized).
- `styleName` (*string|nil*) : Nom du style pour les messages de log ("?" par défaut).
- **renvoie** : boolean true si valide, false sinon (erreur journalisée).

## Champs

| Champ | Type | Description |
|---|---|---|
| `required` | string[] | Noms obligatoires, dans l'ordre : precountdown, countdown5 à countdown1, countdowngo, warningSeconds60/30/15/10, commsCheck, beltsCheck, rescheduled, falseStart (15 entrées). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/systemPacenotes.lua`.*
