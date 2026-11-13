# `core_cameraModes_observer`

*Fichier : `lua/ge/extensions/core/cameraModes/observer.lua` · VM : Game Engine (GE) · 125 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/observer")` (fichier sous extensions/ mais pas une extension classique)

Caméra globale « observateur » pour les scénarios : se place sur un objet caméra du niveau (nommé par cameraName, champs optionnels Speed, blendSpeed, PositionMove, targetFOV, showApps) et regarde la position du véhicule suivi (ou d'un objet targetOverride). Le FOV vaut targetFOV, sinon 90 - 3 * distance (min 10). Si l'objet a un champ Speed numérique, règle simTimeAuthority sur 1/Speed (ralenti) et masque les apps UI. Renvoie un constructeur.

## Remarques

- setCamera a la signature (cam, targetOverride) ; la page extraite n'en listait que targetOverride (déduit du code). Dans setCamera/setCustomData, cam est un objet C++ dont le champ 'name' est lu via getField.

## Classe `C`

Caméra observateur.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_observer")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | isGlobal = true, hidden = true, aucun objet caméra associé. | 8 |
| `C:onCameraChanged(focused)` | Hook : quand ce mode prend le focus, envoie onCameraNameChanged à l'UI et le hook onCameraModeChanged('observer') ; en le perdant, recharge la disposition d'apps « scenario » et oublie la caméra. | 98 |
| `C:onScenarioChange(scenario)` | Hook : oublie la caméra si le scénario disparaît. | 111 |
| `C:onScenarioRestarted()` | Hook : oublie la caméra associée. | 108 |
| `C:setCamera(cam, targetOverride)` | Choisit l'objet caméra (par son nom), relance le fondu et rétablit la vitesse de simulation normale. | 84 |
| `C:setCustomData(customData)` | Appelé par setGlobalCameraByName lors du passage à ce mode : appelle setCamera(customData.cam, customData.targetOverride). | 80 |
| `C:update(data)` | Calcule position, rotation et FOV depuis l'objet caméra ; fondu de position vers PositionMove à la vitesse blendSpeed (50). | 17 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCameraModeChanged` — écouté par 3 module(s)

**Évènements UI (guihooks.trigger) :** `ShowApps`, `appContainer:loadLayoutByType`, `onCameraNameChanged`

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/observer.lua`.*
