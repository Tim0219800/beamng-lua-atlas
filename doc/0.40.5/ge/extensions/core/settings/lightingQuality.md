# `core_settings_lightingQuality`

*Fichier : `lua/ge/extensions/core/settings/lightingQuality.lua` · VM : Game Engine (GE) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_settings_lightingQuality` : `extensions.load("core_settings_lightingQuality")`, puis la globale `core_settings_lightingQuality`

Préréglages de qualité d'éclairage, consommés par graphicsQualityGroup. Chaque niveau fixe le gestionnaire de lumière, le filtrage des ombres, le spéculaire, le normal mapping, le parallax, les vrais reflets d'eau et le groupe de qualité des shaders, via des clés $pref::*. Le hook onApply change le gestionnaire de lumière actif.

## Remarques

- Il n'y a pas de niveau Normal dans ce module (Lowest, Low, High, Ultra seulement).
- Seul Lowest utilise Basic Lighting ; Low utilise Advanced Lighting ; High et Ultra utilisent Advanced Lighting 1.5 avec exactement les mêmes valeurs (Ultra est identique à High).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_settings_lightingQuality.onApply()` | Appelé par graphicsQualityGroup quand une valeur a changé. Lit $pref::lightManager ; si getActiveLightManager() est déjà égal, ne fait rien, sinon appelle setLightManager. *(interne)* *(hook)* | 49 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `qualityLevels` | table<string, table<string, any>> | Niveaux Lowest, Low, High, Ultra. Clés : $pref::lightManager, $pref::Shadows::filterMode, $pref::Video::disablePixSpecular, $pref::Video::disableNormalmapping, $pref::Video::disableParallaxMapping, $pref::Water::disableTrueReflections, $pref::Video::ShaderQualityGroup. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/settings/lightingQuality.lua`.*
