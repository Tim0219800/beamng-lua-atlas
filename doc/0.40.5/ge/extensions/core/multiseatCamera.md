# `core_multiseatCamera`

*Fichier : `lua/ge/extensions/core/multiseatCamera.lua` · VM : Game Engine (GE) · 119 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_multiseatCamera` : `extensions.load("core_multiseatCamera")`, puis la globale `core_multiseatCamera`

Extension GE `core_multiseatCamera` : caméra partagée du mode multi-joueur local (multiseat) quand tous les joueurs voient le même écran. Elle calcule la position moyenne des véhicules des joueurs assignés, règle la distance de la caméra pour que tous soient visibles (distance maximale à la moyenne, x2 + 10 m, FOV 40) et la place sur le véhicule du joueur 0 via core_camera. Elle s'active quand le réglage 'multiseat' est vrai, qu'il y a plus d'un joueur, et que l'écran n'est pas partagé en split-screen (ou que le mode split est 'shared').

## Exemple

```lua
-- activée automatiquement par les hooks onSettingsChanged / onSplitScreenChanged ; pas d'API publique
```

## Remarques

- Aucune fonction publique : tout passe par des hooks. onUpdate vaut `nop` au départ (fonction vide) et n'est remplacée par la vraie boucle que quand la caméra est activée ; extensions.hookUpdate('onUpdate') ré-enregistre alors le hook.
- L'analyse statique signale `nop` comme non définie dans ce fichier : c'est une fonction globale du jeu (utils), le fichier fait require('utils').
- onUpdate ne fait rien si la caméra libre est active pour le joueur 0. La boucle utilise map.objects (positions des véhicules) et core_input_bindings.getAssignedPlayers().
- Au désactivation, la configuration de caméra de tous les véhicules est réinitialisée (core_camera.resetConfiguration, setRef nil, resetCameraByID). onSerialize désactive la caméra avant un rechargement Lua.
- Remarque : le calcul de `meanDirection` (meanLocation - lastLocation - pos) mélange une différence de positions moyennes et la position du joueur 0 ; le résultat sert de référence latérale/arrière à setRef (déduit du code, pas de commentaire explicatif).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_multiseatCamera.onSerialize()` | Avant un rechargement Lua : désactive la caméra partagée si elle était active. *(interne)* *(hook)* | 106 |
| `core_multiseatCamera.onSettingsChanged()` | Hook appelé quand les réglages changent : active ou désactive la caméra partagée selon que le réglage multiseat est vrai, que render_splitScreen est chargé, qu'il y a plus d'un joueur et que le split-screen est inactif ou en mode 'shared'. *(interne)* *(hook)* | 98 |
| `core_multiseatCamera.onSplitScreenChanged(splitScreenEnabled, playerCount, layout, mode)` | Hook appelé quand la configuration du split-screen change : la caméra partagée est active si le split-screen est désactivé ou en mode 'shared'. *(interne)* *(hook)* | 102 |

### Détail des paramètres

#### `core_multiseatCamera.onSplitScreenChanged(splitScreenEnabled, playerCount, layout, mode)`

Hook appelé quand la configuration du split-screen change : la caméra partagée est active si le split-screen est désactivé ou en mode 'shared'.

- `splitScreenEnabled` (*boolean*) : Split-screen actif.
- `playerCount` (*integer*) : Nombre de joueurs (non utilisé).
- `layout` (*any*) : Disposition (non utilisée).
- `mode` (*string*) : Mode du split-screen, 'shared' pour un écran commun.

## Champs

| Champ | Type | Description |
|---|---|---|
| `onUpdate` | function | nop tant que la caméra n'est pas activée, puis la boucle de calcul de la caméra partagée. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/multiseatCamera.lua`.*
