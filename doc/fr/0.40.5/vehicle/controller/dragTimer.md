# `controller_dragTimer`

*Fichier : `lua/vehicle/controller/dragTimer.lua` · VM : Véhicule · 110 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `dragTimer` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de chronométrage de drag (accélération). Machine à états ready, countdown, measuring, done : quand le transbrake est actif et l'accélérateur appuyé, un compte à rebours de 3 s démarre ; à la fin, il relâche le transbrake (contrôleur nommé "transbrake") et mesure les temps au 60 pieds (18,288 m), 1/8 de mile (201,168 m) et 1/4 de mile (402,336 m) ainsi que les vitesses à ces deux derniers repères, puis affiche les résultats dans la console (en mph). Ordre lié au périphérique `gearbox`.

## Remarques

- `M.relevantDevice = "gearbox"`. Aucune clé jbeam n'est lue.
- Utilise `electrics.values.transbrake` et `electrics.values.throttle`. Le relâchement du compte à rebours (accélérateur lâché ou transbrake coupé) revient à `ready`.
- Dépend de l'existence d'un contrôleur nommé exactement "transbrake" : `controller.getController("transbrake").setTransbrake(false)` est appelé sans test (erreur s'il n'existe pas).
- La mesure s'arrête après 25 s même sans avoir atteint le quart de mile. Les résultats sont seulement imprimés (print) et un message UI « Results are in! » est affiché ; ils ne sont pas stockés dans electrics.
- Pas de fonction `reset` : controller.reset rappelle init (état ready).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_dragTimer.init(jbeamData)` | Remet la machine à l'état ready et tous les temps à 0. *(interne)* | 93 |
| `controller_dragTimer.update(dt)` | Pas physique : fait avancer la machine à états (armement, compte à rebours, mesure, affichage des résultats). *(interne)* | 28 |
| `controller_dragTimer.updateGFX(dt)` | Vide (le travail est fait dans update). *(interne)* | 25 |

### Détail des paramètres

#### `controller_dragTimer.init(jbeamData)`

Remet la machine à l'état ready et tous les temps à 0.

- `jbeamData` (*table*) : Données jbeam (non utilisées).

#### `controller_dragTimer.update(dt)`

Pas physique : fait avancer la machine à états (armement, compte à rebours, mesure, affichage des résultats).

- `dt` (*number*) : Pas physique en secondes.

#### `controller_dragTimer.updateGFX(dt)`

Vide (le travail est fait dans update).

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `relevantDevice` | string | "gearbox" : périphérique powertrain utilisé pour l'ordre d'appel. |
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getPosition`, `getVelocity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/dragTimer.lua`.*
