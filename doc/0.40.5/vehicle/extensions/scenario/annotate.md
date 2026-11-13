# `scenario_annotate`

*Fichier : `lua/vehicle/extensions/scenario/annotate.lua` · VM : Véhicule · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_annotate` : `extensions.load (VM véhicule)("scenario_annotate")`, puis la globale `scenario_annotate`

Exemple d'extension véhicule pilotée par un scénario. Elle affiche un texte flottant 2 m au-dessus du véhicule (avec un trait vertical) via obj.debugDrawProxy. Le texte vient du champ `text` de l'entrée `extensions.annotate` du véhicule dans le .json du scénario, transmis par le hook onVehicleScenarioData.

## Exemple

```lua
-- dans le .json du scénario
-- "vehicles": {"scenario_player0": {"extensions": {"annotate": {"text": "This is your car, treat it well."}}}}
```

## Remarques

- Bug mineur : `M.onExtensionLoaded = onExtensionLoaded` référence une variable locale jamais définie, donc le champ vaut nil (sans conséquence, l'extension n'en a pas besoin).
- Si `text` n'est pas une chaîne, une erreur est loguée mais onDebugDraw continuera d'appeler drawText avec une valeur invalide (data.text nil avant le premier appel de onVehicleScenarioData, ce qui peut provoquer une erreur).
- Le hook affiche aussi un print et un dump des données reçues (debug laissé dans le code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_annotate.onDebugDraw(focusPos)` | Hook de dessin debug appelé par main.lua (extensions.hook('onDebugDraw', focusPos)) à chaque frame graphique de debug. Dessine le texte `data.text` en noir à position véhicule + (0,0,2) et une ligne entre le véhicule et ce point. *(interne)* *(hook)* | 29 |
| `scenario_annotate.onVehicleScenarioData(_data)` | Hook appelé quand le scénario fournit les données de l'extension pour ce véhicule. Copie la table (deepcopy), vérifie que `text` est une chaîne (sinon log d'erreur) et la dumpe dans la console. *(interne)* *(hook)* | 35 |

### Détail des paramètres

#### `scenario_annotate.onDebugDraw(focusPos)`

Hook de dessin debug appelé par main.lua (extensions.hook('onDebugDraw', focusPos)) à chaque frame graphique de debug. Dessine le texte `data.text` en noir à position véhicule + (0,0,2) et une ligne entre le véhicule et ce point.

- `focusPos` (*vec3*) : Position du focus caméra (non utilisée ici).

#### `scenario_annotate.onVehicleScenarioData(_data)`

Hook appelé quand le scénario fournit les données de l'extension pour ce véhicule. Copie la table (deepcopy), vérifie que `text` est une chaîne (sinon log d'erreur) et la dumpe dans la console.

- `_data` (*table*) : Table issue du .json du scénario (`extensions.annotate`), attendue avec un champ `text` (string).

## Champs

| Champ | Type | Description |
|---|---|---|
| `onExtensionLoaded` | nil | Toujours nil : affecté depuis une variable non définie (voir notes). ⚠ référence `onExtensionLoaded` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `obj:` `getPosition`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/scenario/annotate.lua`.*
