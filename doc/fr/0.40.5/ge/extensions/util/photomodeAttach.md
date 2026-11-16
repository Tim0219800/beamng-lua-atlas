# `util_photomodeAttach`

*Fichier : `lua/ge/extensions/util/photomodeAttach.lua` · VM : Game Engine (GE) · 138 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_photomodeAttach` : `extensions.load("util_photomodeAttach")`, puis la globale `util_photomodeAttach`

Attache la caméra libre au véhicule du joueur pendant le mode photo : la caméra garde son décalage par rapport au véhicule et le suit à chaque frame (onPreRender). En option, elle suit aussi la rotation du véhicule, uniquement en lacet (yaw), sans tangage ni roulis. Ne fonctionne que si la caméra active est la caméra libre « free ».

## Exemple

```lua
extensions.util_photomodeAttach.enable(true, {followRotation = true})
```

## Remarques

- enable désactive silencieusement l'attache (M.enabled = false) si la caméra active n'est pas « free », s'il n'y a pas de véhicule joueur ou si sa position/rotation est introuvable.
- La position du véhicule est celle du nœud de référence (getRefNodeAbsPositionXYZ) quand elle existe.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_photomodeAttach.enable(en, opts)` | Active ou désactive l'attache. À l'activation, mémorise le décalage actuel de la caméra libre par rapport au véhicule joueur (et son orientation relative si followRotation). | 50 |
| `util_photomodeAttach.onPreRender(dtReal, dtSim, dtRaw)` | Hook appelé chaque frame avant le rendu : replace la caméra par rapport au véhicule. *(interne)* *(hook)* | 134 |
| `util_photomodeAttach.syncCameraToVehicle()` | Applique immédiatement la transformation mémorisée à la caméra (même traitement que celui fait à chaque frame). Sans effet si l'attache est inactive. | 100 |

### Détail des paramètres

#### `util_photomodeAttach.enable(en, opts)`

Active ou désactive l'attache. À l'activation, mémorise le décalage actuel de la caméra libre par rapport au véhicule joueur (et son orientation relative si followRotation).

- `en` (*boolean*) : true pour activer, tout autre valeur désactive
- `opts` (*table|nil*) : Options : followRotation (boolean) pour suivre le lacet du véhicule

#### `util_photomodeAttach.onPreRender(dtReal, dtSim, dtRaw)`

Hook appelé chaque frame avant le rendu : replace la caméra par rapport au véhicule.

- `dtReal` (*number*) : Delta de temps réel en secondes (non utilisé)
- `dtSim` (*number*) : Delta de temps de simulation (non utilisé)
- `dtRaw` (*number*) : Delta de temps brut (non utilisé)

## Champs

| Champ | Type | Description |
|---|---|---|
| `enabled` | boolean | true tant que l'attache est active |
| `followRotation` | boolean | true si la caméra suit aussi le lacet du véhicule |
| `offsetLocal` | vec3|nil | Décalage dans le repère du véhicule, lacet seul (mode avec rotation) |
| `offsetWorld` | vec3|nil | Décalage caméra - véhicule en repère monde (mode sans rotation) |
| `rotOffset` | quat|nil | Rotation de la caméra relative au lacet du véhicule |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/photomodeAttach.lua`.*
