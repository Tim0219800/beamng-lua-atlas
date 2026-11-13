# `core_settings_multiplayer`

*Fichier : `lua/ge/extensions/core/settings/multiplayer.lua` · VM : Game Engine (GE) · 78 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_settings_multiplayer` : `extensions.load("core_settings_multiplayer")`, puis la globale `core_settings_multiplayer`

Fournit les « option helpers » des réglages multijoueur. Chaque helper a une fonction set(value) qui répercute le réglage sur l'extension multiplayer_* correspondante si elle est chargée. Utilisé par core_settings_settings pour relier les options mp* à leurs extensions.

## Remarques

- Les fonctions get sont commentées dans le code : seuls des set existent.
- Chaque set vérifie que l'extension cible (multiplayer_nametags, multiplayer_vehicleSync, multiplayer_multiplayer, multiplayer_sessionManager) existe avant d'écrire.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_settings_multiplayer.buildOptionHelpers()` | Construit et renvoie la table des helpers. Clés : mpNametagsEnabled (multiplayer_nametags.nametagsEnabled), mpNametagDistance (multiplayer_nametags.nametagDistance), mpEnableSwitchingToPlayerVehicles (multiplayer_vehicleSync.enableSwitchingToPlayerVehicles(value)), mpDebugMode (multiplayer_multiplayer.debugMode), mpUseCustomServiceURL (multiplayer_sessionManager.useCustomServiceURL), mpCustomServiceURL (multiplayer_sessionManager.customServiceURL). | 7 |

### Détail des paramètres

#### `core_settings_multiplayer.buildOptionHelpers()`

Construit et renvoie la table des helpers. Clés : mpNametagsEnabled (multiplayer_nametags.nametagsEnabled), mpNametagDistance (multiplayer_nametags.nametagDistance), mpEnableSwitchingToPlayerVehicles (multiplayer_vehicleSync.enableSwitchingToPlayerVehicles(value)), mpDebugMode (multiplayer_multiplayer.debugMode), mpUseCustomServiceURL (multiplayer_sessionManager.useCustomServiceURL), mpCustomServiceURL (multiplayer_sessionManager.customServiceURL).

- **renvoie** : table<string, {set: fun(value: any)}> Table nom d'option -> {set = function}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/settings/multiplayer.lua`.*
