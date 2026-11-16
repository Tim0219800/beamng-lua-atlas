# `client_lighting_advanced_init`

*Fichier : `lua/ge/client/lighting/advanced/init.lua` · VM : Game Engine (GE) · 63 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/lighting/advanced/init")`

Light manager « Advanced Lighting ». Charge les sous-modules shaders, lightViz et shadowViz, puis, si le gestionnaire existe (LightManager.findByName), publie la table globale ADVLMCallbacks avec onActivate/onDeactivate. À l'activation, il active l'objet AL_FormatToken (cible hors écran nécessaire à MSAA et HDR) ; à la désactivation, il le désactive.

## Remarques

- Sur macOS (variable $platform == « macos »), onActivate ne fait rien.
- Le bloc de préférences $pref::LightManager::* du début est entièrement commenté.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/lighting/advanced/init.lua`.*
