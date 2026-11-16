# `core_settings_clusteredQuality`

*Fichier : `lua/ge/extensions/core/settings/clusteredQuality.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_settings_clusteredQuality` : `extensions.load("core_settings_clusteredQuality")`, puis la globale `core_settings_clusteredQuality`

Préréglages de qualité pour l'éclairage « clustered » (lumières locales groupées) et leurs ombres. Chaque niveau (Lowest, Low, Normal, High, Ultra) fixe des propriétés de l'objet moteur global ClusterShading. Utilisé par le système de réglages graphiques (graphic.lua) ; un moddeur peut appeler applyLevel directement.

## Exemple

```lua
core_settings_clusteredQuality.applyLevel("High")
```

## Remarques

- Si ClusterShading n'existe pas ou si le niveau est inconnu, applyLevel ne fait rien (retour silencieux).
- Contrairement aux autres modules de qualité, il n'utilise pas VariableRegistry : il écrit directement dans ClusterShading.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_settings_clusteredQuality.applyLevel(level)` | Copie le préréglage du niveau demandé dans les propriétés de ClusterShading (minLightScreenSize, lightFlares, shadowMaxCasters, shadowFallbackFrames, shadowOversample, shadowBubble). | 50 |

### Détail des paramètres

#### `core_settings_clusteredQuality.applyLevel(level)`

Copie le préréglage du niveau demandé dans les propriétés de ClusterShading (minLightScreenSize, lightFlares, shadowMaxCasters, shadowFallbackFrames, shadowOversample, shadowBubble).

- `level` (*string*) : Nom du niveau : Lowest, Low, Normal, High ou Ultra.

## Champs

| Champ | Type | Description |
|---|---|---|
| `qualityLevels` | table<string, table> | Préréglages par nom de niveau. Chaque entrée contient minLightScreenSize (taille écran minimale d'une lumière, fraction), lightFlares (boolean), shadowMaxCasters (nombre max de lumières projetant une ombre), shadowFallbackFrames (nombre d'images), shadowOversample (facteur de suréchantillonnage), shadowBubble (facteur). Niveaux : Lowest, Low, Normal, High, Ultra. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/settings/clusteredQuality.lua`.*
