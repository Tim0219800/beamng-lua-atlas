# `jbeam_variables`

*Fichier : `lua/common/jbeam/variables.lua` · VM : Commun (GE + véhicule) · 527 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/variables")`

Gère les variables jbeam (réglages de véhicule de type range : géométrie, alignement, etc.) et la substitution des '$...' dans les pièces. Il collecte les variables de la pièce racine et de toutes les pièces choisies en respectant la portée des slots (un slot peut fournir des variables à sa pièce enfant), calcule leur valeur (valeur de l'utilisateur ou défaut, bornée), remplace les références '$nom', '$=expression', '$>>composant' dans les valeurs ET les clés des tables, fusionne les sections 'components' et prépare vehicle.variables pour l'UI. Utilisé par le chargeur jbeam.

## Exemple

```lua
-- ordre d'utilisation par le chargeur (jbeam/loader) :
local v = require('jbeam/variables')
local vars = v.getAllVariables(rootPart, unifyJournal, vehicleConfig)
v.processParts(rootPart, unifyJournal, vehicleConfig, vars)
v.processComponents(rootPart, unifyJournal, vehicleConfig, vars)
v.postProcessVariables(vehicle, vars)
v.cleanup(vehicle)
```

## Remarques

- Syntaxe de substitution (chaînes commençant par '$') : '$nom' = valeur de la variable (le champ val si c'est une définition range) ; '$=expr' = expression évaluée par jbeam/expressionParser avec les variables courantes (parseSafe) ; '$.xxx' = '<$prefix>xxx<$suffix>' (préfixe/suffixe fournis par la portée) ; '$>>chemin.vers.valeur' = copie profonde d'une valeur de la section components (chemin avec points, premier élément obligatoirement 'components', accepté seulement pour les valeurs, jamais pour les clés). Les chaînes commençant par '$+', '$<', '$>', '$*' sont des indicateurs de fusion numérique (voir slotSystem) et ne sont pas substituées.
- Une variable inconnue est journalisée en erreur (log E 'missing variable') et sa valeur devient nil.
- Variables de type 'range' : champs name, type='range', min, max, default (nombres obligatoires), unit, category (défaut 'alignment', 'cat.sous' est scindé en category/subCategory), minDis/maxDis/stepDis pour l'affichage (défaut -100/100/1 sans unité, ou min/max et (maxDis-minDis)/100 avec unité), step, hidden. La valeur finale val vient de vehicleConfig.vars[name] sinon default, bornée à [min,max] (message d'avertissement si elle est modifiée). Un type autre que 'range' est ignoré avec erreur.
- Portée par slot : chaque pièce hérite des variables de sa pièce parente, plus les variables du slot (slotDef.variables, résolues contre la portée parente, jusqu'à 400 passes) et ses propres variables. Si une pièce redéfinit une variable de même nom, la dernière rencontrée (parcours du journal de l'enfant vers le parent) écrase la première dans la liste globale.
- BUG probable : applySlotVars termine par `for k, v in ipairs(slotVars)` sur une table à clés textuelles : cette boucle ne s'exécute jamais, donc les variables de slot encore non résolues après les 400 passes sont silencieusement perdues au lieu d'être évaluées avec parseSafe.
- La variable spéciale '$components' = {val = rootPart.components} est ajoutée aux portées pour permettre d'écrire '$=$components.xxx' dans des expressions. postProcessVariables l'exclut de vehicle.variables.
- cleanup retire des fonctions des composants (setFunctionsToNil, récursif) et supprime de vehicle.variables celles marquées hidden = true : vehicle.variables doit déjà exister (sinon erreur : postProcessVariables doit être appelé avant).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_variables.cleanup(vehicle)` | Nettoyage final : supprime les fonctions dans vehicle.components et les variables hidden de vehicle.variables. *(interne)* | 502 |
| `jbeam_variables.getAllVariables(rootPart, unifyJournal, vehicleConfig)` | Collecte toutes les variables connues (pièce racine puis pièces du journal, de l'enfant vers le parent) en évaluant uniquement les '$=' dans leurs listes (sans renommer de clés), selon la portée de chaque slot. Renvoie la table nom -> définition avec val calculée (utilisateur ou défaut, bornée). *(interne)* | 321 |
| `jbeam_variables.postProcessVariables(vehicle, allVariables)` | Place dans vehicle.variables la table des variables indexées par leur nom (v.name), à partir de la table de getAllVariables (ignore '$components' et les valeurs non-table). *(interne)* | 427 |
| `jbeam_variables.processComponents(rootPart, unifyJournal, vehicleConfig, vars)` | Fusionne les sections 'components' de toutes les pièces dans rootPart.components (substitutions de variables appliquées, y compris sur les clés '$' des tables 'variables' imbriquées, comportement historique) puis retire 'components' des pièces sources. *(interne)* | 462 |
| `jbeam_variables.processParts(rootPart, unifyJournal, vehicleConfig, vars)` | Applique les substitutions de variables dans la pièce racine (composants d'abord) puis dans chaque pièce du journal et dans ses options de slot, avec la portée propre à chaque slot. Modifie les pièces en place. *(interne)* | 382 |

### Détail des paramètres

#### `jbeam_variables.cleanup(vehicle)`

Nettoyage final : supprime les fonctions dans vehicle.components et les variables hidden de vehicle.variables.

- `vehicle` (*table*) : véhicule (components et variables)
- **renvoie** : boolean toujours true

#### `jbeam_variables.getAllVariables(rootPart, unifyJournal, vehicleConfig)`

Collecte toutes les variables connues (pièce racine puis pièces du journal, de l'enfant vers le parent) en évaluant uniquement les '$=' dans leurs listes (sans renommer de clés), selon la portée de chaque slot. Renvoie la table nom -> définition avec val calculée (utilisateur ou défaut, bornée).

- `rootPart` (*table*) : pièce principale (variables, components)
- `unifyJournal` (*table[]*) : journal de fusion de slotSystem.findParts (entrées {parent, pièce, niveau, options, chemin, slotDef})
- `vehicleConfig` (*table*) : configuration (vars = valeurs choisies par l'utilisateur)
- **renvoie** : table<string, table> variables résolues indexées par nom (ex. '$AAA')

#### `jbeam_variables.postProcessVariables(vehicle, allVariables)`

Place dans vehicle.variables la table des variables indexées par leur nom (v.name), à partir de la table de getAllVariables (ignore '$components' et les valeurs non-table).

- `vehicle` (*table*) : véhicule en construction (reçoit variables)
- `allVariables` (*table*) : variables résolues

#### `jbeam_variables.processComponents(rootPart, unifyJournal, vehicleConfig, vars)`

Fusionne les sections 'components' de toutes les pièces dans rootPart.components (substitutions de variables appliquées, y compris sur les clés '$' des tables 'variables' imbriquées, comportement historique) puis retire 'components' des pièces sources.

- `rootPart` (*table*) : pièce principale (reçoit components)
- `unifyJournal` (*table[]*) : journal de fusion
- `vehicleConfig` (*table*) : configuration (non utilisée directement)
- `vars` (*table*) : variables résolues
- **renvoie** : boolean toujours true

#### `jbeam_variables.processParts(rootPart, unifyJournal, vehicleConfig, vars)`

Applique les substitutions de variables dans la pièce racine (composants d'abord) puis dans chaque pièce du journal et dans ses options de slot, avec la portée propre à chaque slot. Modifie les pièces en place.

- `rootPart` (*table*) : pièce principale
- `unifyJournal` (*table[]*) : journal de fusion
- `vehicleConfig` (*table*) : configuration du véhicule (non utilisée directement ici)
- `vars` (*table*) : variables résolues de getAllVariables (reçoit aussi '$components')
- **renvoie** : table vars

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/variables.lua`.*
