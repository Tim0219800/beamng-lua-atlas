# `ui_policeInfo`

*Fichier : `lua/ge/extensions/ui/policeInfo.lua` · VM : Game Engine (GE) · 202 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_policeInfo` : `extensions.load("ui_policeInfo")`, puis la globale `ui_policeInfo`

Extension GE qui alimente l'interface des poursuites de police : elle lit gameplay_police.getPursuitData à chaque frame GUI et publie le flux 'policePursuit' (niveau, visibilité, jauges d'arrestation et de fuite, durée, drapeaux). Elle pousse aussi des alertes (PoliceAlertPush / PoliceAlertClear) pour les infractions et pour la fin de poursuite. Par défaut elle suit le véhicule du joueur, sauf si M.targetId est défini.

## Exemple

```lua
ui_policeInfo.targetId = vehId   -- suivre un autre véhicule
ui_policeInfo.showFinalStats = false
local actif = ui_policeInfo.isPursuit()
```

## Remarques

- Champs réglables : targetId (nil = joueur), showFinalStats (true : affiche score/infractions/unités à la fin ; false : affiche seulement succès/échec) et enabled (false coupe les mises à jour automatiques). L'extraction automatique a décalé leurs commentaires ; les définitions réelles sont dans le code.
- liveData.state : 0 inactif, 1 poursuite, 2 fin (arrestation ou fuite terminée). En état 2 les données sont figées jusqu'à onPursuitStatsEnded ou la reprise d'une poursuite.
- Dans onPursuitAction, les données de poursuite sont lues avec M.targetId (nil = joueur) et non avec vehId.
- Les jauges arrest/evade sont lissées par lerp(…, 0.5) lorsqu'elles retombent à zéro, pour une barre de progression fluide.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_policeInfo.isPursuit()` | Indique si une poursuite est ou a été active (état de liveData > 0, y compris l'écran de fin). | 40 |
| `ui_policeInfo.onGuiUpdate(dt)` | Hook appelé à chaque frame GUI : lit les données de poursuite, met à jour niveau, visibilité, jauges, durée (format m:ss ou h:mm:ss) et drapeaux, puis publie 'policePursuit'. Ne fait rien si be:getEnabled() est faux ou si l'extension est désactivée. *(interne)* *(hook)* | 154 |
| `ui_policeInfo.onPursuitAction(vehId, action, data)` | Hook appelé pour une action de poursuite. Sur 'arrest' ou 'evade' : passe en état 2, met la jauge correspondante à 1, efface les alertes et affiche soit le récapitulatif (score, nombre d'infractions, barrages ou unités de police), soit un simple échec/succès selon showFinalStats. *(interne)* *(hook)* | 77 |
| `ui_policeInfo.onPursuitOffense(vehId, name, data)` | Hook appelé quand une infraction est commise pendant une poursuite ; pousse une alerte de 3 s (texte ui.apps.police.offenseAlert avec le nom traduit ui.traffic.infractions.<name>) si le véhicule est la cible ou le joueur. *(interne)* *(hook)* | 64 |
| `ui_policeInfo.onPursuitStatsEnded()` | Hook appelé quand les statistiques de fin de poursuite sont terminées ; remet la table à zéro si on est en état 2. *(interne)* *(hook)* | 144 |
| `ui_policeInfo.onUiChangedState()` | Hook appelé quand l'interface change d'état ; remet la table à zéro. *(interne)* *(hook)* | 150 |
| `ui_policeInfo.onVehicleSwitched(_, id)` | Hook appelé au changement de véhicule contrôlé ; remet la table à zéro si l'extension est activée et sans targetId. *(interne)* *(hook)* | 58 |
| `ui_policeInfo.resetPursuitTable()` | Remet à zéro tous les nombres et drapeaux de liveData, efface les alertes (PoliceAlertClear) et republie le flux 'policePursuit'. | 44 |

### Détail des paramètres

#### `ui_policeInfo.isPursuit()`

Indique si une poursuite est ou a été active (état de liveData > 0, y compris l'écran de fin).

- **renvoie** : boolean true si state > 0.

#### `ui_policeInfo.onGuiUpdate(dt)`

Hook appelé à chaque frame GUI : lit les données de poursuite, met à jour niveau, visibilité, jauges, durée (format m:ss ou h:mm:ss) et drapeaux, puis publie 'policePursuit'. Ne fait rien si be:getEnabled() est faux ou si l'extension est désactivée.

- `dt` (*number*) : Delta de temps en secondes (non utilisé).

#### `ui_policeInfo.onPursuitAction(vehId, action, data)`

Hook appelé pour une action de poursuite. Sur 'arrest' ou 'evade' : passe en état 2, met la jauge correspondante à 1, efface les alertes et affiche soit le récapitulatif (score, nombre d'infractions, barrages ou unités de police), soit un simple échec/succès selon showFinalStats.

- `vehId` (*integer*) : Véhicule concerné.
- `action` (*string*) : 'arrest' ou 'evade' (les autres actions sont ignorées).
- `data` (*table*) : Non utilisé.

#### `ui_policeInfo.onPursuitOffense(vehId, name, data)`

Hook appelé quand une infraction est commise pendant une poursuite ; pousse une alerte de 3 s (texte ui.apps.police.offenseAlert avec le nom traduit ui.traffic.infractions.<name>) si le véhicule est la cible ou le joueur.

- `vehId` (*integer*) : Véhicule en infraction.
- `name` (*string*) : Nom de l'infraction.
- `data` (*table*) : Données supplémentaires (non utilisées).

#### `ui_policeInfo.onVehicleSwitched(_, id)`

Hook appelé au changement de véhicule contrôlé ; remet la table à zéro si l'extension est activée et sans targetId.

- `_` (*any*) : Ignoré (déduit du code).
- `id` (*integer*) : Id du nouveau véhicule (non utilisé).

## Champs

| Champ | Type | Description |
|---|---|---|
| `enabled` | boolean | Défaut true. Mettre à false pour désactiver les mises à jour et alertes automatiques. |
| `showFinalStats` | boolean | Défaut true. Mettre à false pour ne pas afficher le récapitulatif (score, infractions, unités) en fin de poursuite. |
| `targetId` | integer|nil | Si défini, utilise les données de poursuite de ce véhicule au lieu de celles du joueur. |

**Évènements UI (guihooks.trigger) :** `PoliceAlertClear`, `PoliceAlertPush`

## Appels vers le moteur (C++)

- `be:` `getEnabled`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/policeInfo.lua`.*
