# `core_settings_graphic`

*Fichier : `lua/ge/extensions/core/settings/graphic.lua` · VM : Game Engine (GE) · 2181 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_settings_graphic` : `extensions.load("core_settings_graphic")`, puis la globale `core_settings_graphic`

Réglages graphiques : mode d'affichage (fenêtre, plein écran, sans bordure), résolution, fréquence, pilote d'affichage, HDR, anti-crénelage, upscaling, groupes de qualité (maillages, textures, éclairage, ombres, terrain, nuages, reflets et rétroviseurs dynamiques, éclairage clustered), post-traitement (DOF, flou de mouvement, SSAO, SSR, ombres écran) et préréglages globaux (settingsPresets.json). Il fournit à core_settings_settings les « option helpers » (get/set) de ces réglages et applique l'état vidéo au Canvas. Un moddeur l'utilise surtout via core_settings_settings.setValue ; setPresetOverride permet d'imposer temporairement un préréglage.

## Exemple

```lua
-- imposer le préréglage 'Low' sans changer le choix sauvegardé
core_settings_graphic.setPresetOverride({name = 'Low', enforce = true})
-- relâcher
core_settings_graphic.setPresetOverride(nil)
```

## Remarques

- Le fichier est très gros (plus de 2000 lignes) : l'essentiel est dans buildOptionHelpers, qui renvoie une table dont les clés sont : GraphicDisplayModes, GraphicDisplayResolutions, GraphicDisplayRefreshRates, GraphicDisplayDriver, GraphicGPU, WindowPlacement, uiUpscaling, vulkanEnabled, GraphicHDRSupported/Enabled/PaperWhiteNits/PeakWhiteNits/UiMultiplier/OutputModeName, GraphicEVCompensation, vsync, GraphicAntialiasType, GraphicUpscalingQuality, GraphicUpscalingSharpness, GraphicAntialias, GraphicAnisotropic, GraphicPlatformPreset, GraphicOverallQuality, GraphicMeshQuality, GraphicTerrainQuality, GraphicTextureQuality, GraphicLightingQuality, GraphicShadowsQuality, GraphicDynReflectionQuality, GraphicDynReflectionFacesPerupdate, GraphicDynMirrorsQuality, GraphicCloudsQuality, PostFXDOFGeneralEnabled, PostFXMotionBlurEnabled/Strength/PlayerVehicle, PostFXSSAOGeneralEnabled/Quality, PostFXSpecularOcclusionEnabled, PostFXSSRAvailable/Enabled/Quality, PostFXScreenSpaceShadowsAvailable/Enabled, GraphicGrassDensity, GraphicMaxDecalCount, lastSplitCastersEnabled, vehicleShadowEnabled, GraphicClusteredQuality.
- Les groupes de qualité utilisent core_settings_graphicsQualityGroup avec les modules lightingQuality, shadowsQuality, textureQuality, meshQuality et terrainQuality ; clusteredQuality et dynCaptureQuality sont appelés directement.
- autoDetectApplyGraphicsQuality est vide (tout le corps est commenté, avec un TODO de 2021) : appeler cette fonction ne fait rien. openMonitorConfiguration est aussi vide.
- Dans onInitSettings, le réglage de Vulkan depuis les settings est désactivé par un 'if false'.
- Les clés PostFXDOFGeneralEnabled et PostFXMotionBlur* gardent la valeur de l'utilisateur quand un préréglage de plateforme est appliqué (platformPresetUserOwnedKeys).
- setPresetOverride : tant qu'un override est actif, le choix GraphicOverallQuality sauvegardé peut changer mais reste non appliqué ; avec enforce, les valeurs du préréglage sont ré-imposées à chaque changement de réglages.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_settings_graphic.applyGraphicsState()` | Applique au moteur le mode vidéo choisi : demande la sauvegarde, règle le périphérique d'affichage (GFXDevice.setDisplayDevice) et le mode vidéo (largeur, hauteur, fréquence, mode), applique le HDR, restaure la position de fenêtre, puis règle le mode de rendu (SingleMonitor ou MultiMonitor selon GraphicTripleMonitorEnabled et les FOV triple écran). Ignoré si déjà en cours, ou si le Canvas est absent (après la demande de sauvegarde). | 263 |
| `core_settings_graphic.autoDetectApplyGraphicsQuality()` | Prévu pour choisir automatiquement une qualité selon la mémoire vidéo ; entièrement commenté dans le code, donc inactif. | 2032 |
| `core_settings_graphic.buildOptionHelpers()` | Construit et mémorise la table des options graphiques (get/set/getModes et éventuellement sanitize, init, onSettingsChanged par option). Appelée par core_settings_settings.initSettings. *(interne)* | 494 |
| `core_settings_graphic.getDisplayInformation()` | Renvoie les informations d'affichage collectées au démarrage (GPU, écrans…) pour l'UI. | 2117 |
| `core_settings_graphic.getOptions(optionName)` | Renvoie un helper d'option précis ou toute la table des options graphiques. | 2113 |
| `core_settings_graphic.getOverallQualityPresets()` | Renvoie la table des préréglages globaux lue dans lua/ge/extensions/core/settings/settingsPresets.json. | 2179 |
| `core_settings_graphic.getPresetOverride()` | Renvoie l'override de préréglage actif. | 2178 |
| `core_settings_graphic.load(newState)` | Appelé par core_settings_settings.load : refreshGraphicsState(newState) puis applyGraphicsState(). *(interne)* | 2014 |
| `core_settings_graphic.onFirstUpdateSettings()` | Hook appelé à la fin de l'initialisation des réglages : si $forceFullscreen est vrai, force les réglages par défaut en plein écran ; affiche la fenêtre (canvas:showWindow), collecte les informations d'affichage et nettoie le type d'anti-crénelage. Sans effet si le Canvas n'existe pas. *(interne)* *(hook)* | 1880 |
| `core_settings_graphic.onInitSettings(data)` | Hook appelé par core_settings_settings.initSettings : appelle init(valeur) sur chaque option graphique qui en possède, avec la valeur lue. *(interne)* *(hook)* | 1867 |
| `core_settings_graphic.onSettingsChanged()` | Appelé après chaque sauvegarde des réglages. Avec un override actif : ré-impose le préréglage si enforce, sinon ne fait rien. Sans override : relance GraphicPlatformPreset.onSettingsChanged et GraphicOverallQuality.onSettingsChanged. *(interne)* *(hook)* | 2156 |
| `core_settings_graphic.onUiChangedState(toState, fromState)` | Hook de changement d'état de l'UI. À l'entrée dans 'menu.options.graphics', mémorise l'état d'affichage ; à la sortie, si les changements n'ont pas été appliqués, rétablit l'ancien mode, résolution et fréquence. *(interne)* *(hook)* | 1997 |
| `core_settings_graphic.onUpdate(dtReal)` | Hook de mise à jour : décompte les minuteurs différés pour l'échelle de rendu (render scale) et le mode de sortie HDR, puis les applique à l'expiration. *(interne)* *(hook)* | 2083 |
| `core_settings_graphic.openCoconutWindow()` | Ouvre la fenêtre de debug « Coconut » du rendu (Engine.Render.setCoconutWindowOpen(true)). Sans effet dans un build shipping. | 2022 |
| `core_settings_graphic.openMonitorConfiguration()` | Corps vide : ne fait rien. | 2019 |
| `core_settings_graphic.refreshGraphicsState(newState)` | Synchronise l'état interne (mode, pilote, résolution, fréquence, placement de fenêtre) avec un nouvel état de réglages, nettoie les valeurs invalides (sanitize), notifie l'UI et émet le hook onDisplayModeChanged(ancienMode, nouveauMode) si le mode a changé. Un changement de WindowPlacement est sauvegardé tout de suite. | 1904 |
| `core_settings_graphic.setPresetOverride(override)` | Impose un préréglage global sans modifier le choix GraphicOverallQuality sauvegardé. Passer nil libère l'override et restaure le préréglage sauvegardé. Avec enforce = true, les valeurs sont ré-imposées à chaque changement de réglages. | 2148 |
| `core_settings_graphic.toggleFullscreen()` | Bascule plein écran/fenêtre sur le Canvas (canvas:toggleFullscreen) s'il existe. | 2105 |

### Détail des paramètres

#### `core_settings_graphic.buildOptionHelpers()`

Construit et mémorise la table des options graphiques (get/set/getModes et éventuellement sanitize, init, onSettingsChanged par option). Appelée par core_settings_settings.initSettings.

- **renvoie** : table<string, table> Helpers par nom de réglage.

#### `core_settings_graphic.getDisplayInformation()`

Renvoie les informations d'affichage collectées au démarrage (GPU, écrans…) pour l'UI.

- **renvoie** : table Informations d'affichage (structure déduite de gatherDisplayInformation).

#### `core_settings_graphic.getOptions(optionName)`

Renvoie un helper d'option précis ou toute la table des options graphiques.

- `optionName` (*string|nil*) : Nom de l'option (ex. 'GraphicDisplayModes'). nil = toute la table.
- **renvoie** : table|nil Helper de l'option, ou table complète.

#### `core_settings_graphic.getOverallQualityPresets()`

Renvoie la table des préréglages globaux lue dans lua/ge/extensions/core/settings/settingsPresets.json.

- **renvoie** : table<string, table> Préréglages par nom.

#### `core_settings_graphic.getPresetOverride()`

Renvoie l'override de préréglage actif.

- **renvoie** : table|nil {name, enforce} ou nil.

#### `core_settings_graphic.load(newState)`

Appelé par core_settings_settings.load : refreshGraphicsState(newState) puis applyGraphicsState().

- `newState` (*table<string, any>*) : Réglages complets.

#### `core_settings_graphic.onInitSettings(data)`

Hook appelé par core_settings_settings.initSettings : appelle init(valeur) sur chaque option graphique qui en possède, avec la valeur lue.

- `data` (*table<string, any>*) : Valeurs lues des réglages.

#### `core_settings_graphic.onUiChangedState(toState, fromState)`

Hook de changement d'état de l'UI. À l'entrée dans 'menu.options.graphics', mémorise l'état d'affichage ; à la sortie, si les changements n'ont pas été appliqués, rétablit l'ancien mode, résolution et fréquence.

- `toState` (*string*) : Nouvel état.
- `fromState` (*string*) : Ancien état.

#### `core_settings_graphic.onUpdate(dtReal)`

Hook de mise à jour : décompte les minuteurs différés pour l'échelle de rendu (render scale) et le mode de sortie HDR, puis les applique à l'expiration.

- `dtReal` (*number|nil*) : Durée réelle de l'image en secondes.

#### `core_settings_graphic.refreshGraphicsState(newState)`

Synchronise l'état interne (mode, pilote, résolution, fréquence, placement de fenêtre) avec un nouvel état de réglages, nettoie les valeurs invalides (sanitize), notifie l'UI et émet le hook onDisplayModeChanged(ancienMode, nouveauMode) si le mode a changé. Un changement de WindowPlacement est sauvegardé tout de suite.

- `newState` (*table<string, any>*) : Réglages contenant GraphicDisplayDriver, GraphicDisplayModes, GraphicDisplayResolutions, GraphicDisplayRefreshRates, WindowPlacement (tous facultatifs).

#### `core_settings_graphic.setPresetOverride(override)`

Impose un préréglage global sans modifier le choix GraphicOverallQuality sauvegardé. Passer nil libère l'override et restaure le préréglage sauvegardé. Avec enforce = true, les valeurs sont ré-imposées à chaque changement de réglages.

- `override` (*{name: string, enforce: boolean}|nil*) : name = nom d'un préréglage de settingsPresets.json.
- **renvoie** : boolean false si le préréglage est introuvable, sinon true.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDisplayModeChanged` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `Engine.` `getVulkanEnabled`, `setRenderMode`, `setVulkanEnabled`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/settings/graphic.lua`.*
