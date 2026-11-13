# `freeroam_crashCamModeLoader`

*Fichier : `lua/ge/extensions/freeroam/crashCamModeLoader.lua` · VM : Game Engine (GE) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_crashCamModeLoader` : `extensions.load("freeroam_crashCamModeLoader")`, puis la globale `freeroam_crashCamModeLoader`

Petit chargeur qui charge ou décharge l'extension freeroam_crashCamMode (caméra de ralenti après un crash) selon le réglage enableCrashCam. Il évite de laisser la caméra de crash active quand le joueur la désactive dans les options.

## Remarques

- Au déchargement, le test `elseif freeroam_crashCamMode` s'appuie sur la globale de l'extension : elle n'est déchargée que si elle est déjà chargée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_crashCamModeLoader.onExtensionLoaded()` | Hook appelé au chargement de l'extension : charge freeroam_crashCamMode si le réglage enableCrashCam est vrai. *(interne)* *(hook)* | 15 |
| `freeroam_crashCamModeLoader.onSettingsChanged()` | Hook appelé quand les réglages changent : charge freeroam_crashCamMode si enableCrashCam est vrai, sinon la décharge si elle est chargée. *(interne)* *(hook)* | 7 |

**Charge les extensions :** `freeroam_crashCamMode`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/crashCamModeLoader.lua`.*
