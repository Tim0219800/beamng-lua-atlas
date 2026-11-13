# `ssaoModule`

*Fichier : `lua/ge/client/postFx/ssao.lua` · VM : Game Engine (GE) · 91 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `ssaoModule`

Occlusion ambiante en espace écran (SSAO, avec normales courbées / GTAO). À l'import, crée l'objet « SSAOPostFx » (PostEffectSSAO) s'il manque, puis règle sa propriété bentNormals d'après le réglage PostFXSpecularOcclusionEnabled, et crée « SSAOVizPostFx » pour visualiser #ssaoMask. Le module garde en mémoire le contraste et le rayon courants et les transmet à l'objet.

## Exemple

```lua
local ssao = require('client/postFx/ssao')
ssao.setRadius(2.0)
ssao.setContrast(1.5)
print(ssao.getRadius(), ssao.getContrast())
```

## Remarques

- Valeurs par défaut : contraste 2, rayon 1,5 (variables defaultContrast / defaultRadius).
- setContrast et setRadius appliquent tonumber ; une valeur non numérique est ignorée sans erreur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ssaoModule.applyDefaults()` | Fixe $SSAOPostFx::Enable à true et rétablit le contraste (2) et le rayon (1,5) par défaut. | 35 |
| `ssaoModule.getContrast()` | Retourne le contraste mémorisé. | 44 |
| `ssaoModule.getRadius()` | Retourne le rayon mémorisé. | 45 |
| `ssaoModule.setBentNormalDebugEnabled(enabled)` | Active ou désactive un effet de débogage (GTAOBentNormalsVizPostFx, créé à la demande) qui affiche la carte des normales courbées #gtaoOutput. Sans coût tant qu'il est désactivé. | 49 |
| `ssaoModule.setContrast(value)` | Mémorise le contraste du SSAO et l'applique à SSAOPostFx (méthode setContrast de l'objet). Ignoré si la valeur n'est pas convertible en nombre. | 15 |
| `ssaoModule.setRadius(value)` | Mémorise le rayon du SSAO et l'applique à SSAOPostFx. Ignoré si la valeur n'est pas numérique. | 25 |

### Détail des paramètres

#### `ssaoModule.getContrast()`

Retourne le contraste mémorisé.

- **renvoie** : number Contraste courant.

#### `ssaoModule.getRadius()`

Retourne le rayon mémorisé.

- **renvoie** : number Rayon courant.

#### `ssaoModule.setBentNormalDebugEnabled(enabled)`

Active ou désactive un effet de débogage (GTAOBentNormalsVizPostFx, créé à la demande) qui affiche la carte des normales courbées #gtaoOutput. Sans coût tant qu'il est désactivé.

- `enabled` (*boolean*) : true pour afficher, false pour masquer.

#### `ssaoModule.setContrast(value)`

Mémorise le contraste du SSAO et l'applique à SSAOPostFx (méthode setContrast de l'objet). Ignoré si la valeur n'est pas convertible en nombre.

- `value` (*number|string*) : Nouveau contraste.

#### `ssaoModule.setRadius(value)`

Mémorise le rayon du SSAO et l'applique à SSAOPostFx. Ignoré si la valeur n'est pas numérique.

- `value` (*number|string*) : Nouveau rayon (unité de la scène, déduit du code).

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx/ssao.lua`.*
