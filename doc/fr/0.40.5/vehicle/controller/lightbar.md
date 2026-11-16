# `controller_lightbar`

*Fichier : `lua/vehicle/controller/lightbar.lua` · VM : Véhicule · 257 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `lightbar` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de rampe lumineuse (gyrophares) à modes configurables (type "auxiliary"). Chaque mode définit, par nom de valeur electrics, une séquence d'états (durée, valeur) répétée en boucle tant que l'électrique principale (par défaut "lightbar") est > 0 ; une séquence à un seul état devient une valeur statique. Les valeurs electrics produites sont multipliées par l'intensité de la valeur principale (0..1). Un menu radial « Lightbar Modes » permet de changer de mode.

## Exemple

```lua
-- jbeam (extrait)
-- "modes": [["name", "config"],
--   ["Police", [["electric","duration","value"], ["lightbar_left",0.1,1], ["lightbar_left",0.1,0]]]]
```

## Remarques

- Clés jbeam (défaut) : lightbarElectricsName ("lightbar"), modes (table d'en-tête avec name et config ; config est une table d'en-tête electric/duration/value), defaultModeIndex (1), resetTriggerElectricNames (liste de noms d'electrics dont un changement remet les séquences à zéro ; lightbarElectricsName y est ajouté).
- Les durées sont en secondes. Le changement de mode affiche un message d'interface.
- Incohérence : init ajoute lightbarElectricsName dans la table jbeamData.resetTriggerElectricNames elle-même (modification de la table jbeam, qui accumule à chaque init si la table est réutilisée).
- reset(jbeamData) réapplique defaultModeIndex ; setState/applyRemoteModeIndex change de mode sans message ni coupure des valeurs de sortie.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_lightbar.getState()` | Renvoie l'indice de mode courant. | 231 |
| `controller_lightbar.init(jbeamData)` | Construit les modes (séquences animées et valeurs statiques), enregistre l'entrée du menu radial si plusieurs modes existent. *(interne)* | 143 |
| `controller_lightbar.reset(jbeamData)` | Rétablit le mode par défaut. *(interne)* | 138 |
| `controller_lightbar.setModeIndex(index)` | Active le mode d'indice donné : remet les séquences à zéro, applique les valeurs statiques et affiche un message. Ne fait rien si l'indice n'existe pas. | 96 |
| `controller_lightbar.setState(data)` | Applique l'indice de mode d'une table d'état si valide. | 236 |
| `controller_lightbar.toggleMode()` | Passe au mode suivant (revient au premier après le dernier). | 129 |
| `controller_lightbar.updateGFX(dt)` | Avance les séquences de chaque électrique selon dt et écrit electrics.values. *(interne)* | 43 |

### Détail des paramètres

#### `controller_lightbar.getState()`

Renvoie l'indice de mode courant.

- **renvoie** : table Table d'état (réutilisée).

#### `controller_lightbar.init(jbeamData)`

Construit les modes (séquences animées et valeurs statiques), enregistre l'entrée du menu radial si plusieurs modes existent.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_lightbar.reset(jbeamData)`

Rétablit le mode par défaut.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_lightbar.setModeIndex(index)`

Active le mode d'indice donné : remet les séquences à zéro, applique les valeurs statiques et affiche un message. Ne fait rien si l'indice n'existe pas.

- `index` (*integer*) : Indice 1..n dans modes.

#### `controller_lightbar.setState(data)`

Applique l'indice de mode d'une table d'état si valide.

- `data` (*table|nil*) : Table d'état.

#### `controller_lightbar.updateGFX(dt)`

Avance les séquences de chaque électrique selon dt et écrit electrics.values.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/lightbar.lua`.*
