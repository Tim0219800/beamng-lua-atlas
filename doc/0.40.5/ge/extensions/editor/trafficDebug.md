# `editor_trafficDebug`

*Fichier : `lua/ge/extensions/editor/trafficDebug.lua` · VM : Game Engine (GE) · 510 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_trafficDebug` : `extensions.load("editor_trafficDebug")`, puis la globale `editor_trafficDebug`

Fenêtre d'éditeur « Traffic Debug » (menu Window > Debug) pour inspecter et régler le système de trafic de gameplay_traffic. Deux onglets : General (nombre de véhicules de trafic et de stationnement, réglages globaux via gameplay_traffic.setTrafficVars : activeAmount, spawnValue, spawnDirBias, baseAggression, speedLimit, aiAware, enableRandomEvents ; case debugMode ; bouton de dispersion) et Vehicles (données par véhicule : général, route, réapparition, poursuite, minuteries, rôle, journal d'actions, téléportation forcée). Active gameplay_traffic.debugMode à l'ouverture et le coupe à la désactivation de l'éditeur.

## Remarques

- La fenêtre ne dessine rien si l'extension gameplay_traffic n'est pas chargée.
- Le journal d'actions est alimenté par le hook onTrafficAction, avec au plus 100 entrées conservées par véhicule.
- Les réglages sont bornés avant envoi : spawnValue 0..3, spawnDirBias -1..1, baseAggression 0.1..2, speedLimit -1..100.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_trafficDebug.onEditorDeactivated()` | Hook appelé à la fermeture de l'éditeur : coupe gameplay_traffic.debugMode et oublie les données de trafic. *(interne)* *(hook)* | 461 |
| `editor_trafficDebug.onEditorGui()` | Hook appelé à chaque frame d'interface de l'éditeur : dessine la fenêtre, active gameplay_traffic.debugMode au premier affichage, lit gameplay_traffic.getTrafficData() et dessine l'onglet courant. *(interne)* *(hook)* | 471 |
| `editor_trafficDebug.onEditorInitialized()` | Hook de l'éditeur : enregistre la fenêtre 'Traffic Debug' (400x600) et son entrée de menu Window > Debug. *(interne)* *(hook)* | 466 |
| `editor_trafficDebug.onTrafficAction(id, action, data)` | Hook de trafic : ajoute une ligne au journal du véhicule `id`, avec l'horodatage reçu, l'action et ses données, affichée dans l'onglet Vehicles. *(interne)* *(hook)* | 500 |

### Détail des paramètres

#### `editor_trafficDebug.onTrafficAction(id, action, data)`

Hook de trafic : ajoute une ligne au journal du véhicule `id`, avec l'horodatage reçu, l'action et ses données, affichée dans l'onglet Vehicles.

- `id` (*integer*) : Id du véhicule de trafic.
- `action` (*string*) : Nom de l'action de trafic.
- `data` (*any*) : Données associées, affichées entre parenthèses si présentes.

## Appels vers le moteur (C++)

- `be:` `getObjectPositionXYZ`
- `debugDrawer:` `drawSquarePrism`
- `obj:` `queueLuaCommand`
- `scenetree.` `objectExistsById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/trafficDebug.lua`.*
