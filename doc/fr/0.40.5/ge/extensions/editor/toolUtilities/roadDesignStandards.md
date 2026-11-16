# `editor_toolUtilities_roadDesignStandards`

*Fichier : `lua/ge/extensions/editor/toolUtilities/roadDesignStandards.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_roadDesignStandards` : `extensions.load("editor_toolUtilities_roadDesignStandards")`, puis la globale `editor_toolUtilities_roadDesignStandards`

Normes de conception routière partagées par plusieurs outils de l'éditeur. Définit six préréglages ordonnés, du plus rigoureux au plus rustique, chacun avec quatre contraintes : pente longitudinale maximale (ratio), rayon de courbure minimal (m), dévers maximal (degrés) et gradient de largeur maximal.

## Exemple

```lua
local rds = extensions.editor_toolUtilities_roadDesignStandards
for _, name in ipairs(rds.getPresetStrings()) do
  local p = rds.getPresetsMap()[name]
  print(name, p.maxSlope, p.minRadius, p.maxBanking, p.maxWidthGradient)
end
```

## Remarques

- Préréglages (maxSlope / minRadius / maxBanking / maxWidthGradient) : Freeway / Autobahn 0.04 / 500 / 5 / 0.02 ; Major Rural Road 0.06 / 200 / 7 / 0.03 ; Secondary Road 0.08 / 100 / 9 / 0.05 ; Mountain Pass 0.12 / 40 / 12 / 0.07 ; Unpaved Trail 0.18 / 20 / 14 / 0.10 ; Off-Road / F-Road 0.24 / 12 / 18 / 0.12.
- Unités : maxSlope en ratio montée/distance, minRadius en mètres, maxBanking en degrés.
- Les fonctions renvoient les tables internes (pas des copies) : ne pas les modifier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_roadDesignStandards.getPresetStrings()` | Renvoie le tableau ordonné des noms de préréglages. | 93 |
| `editor_toolUtilities_roadDesignStandards.getPresetsMap()` | Renvoie la table nom de préréglage -> paramètres {maxSlope, minRadius, maxBanking, maxWidthGradient}. | 97 |

### Détail des paramètres

#### `editor_toolUtilities_roadDesignStandards.getPresetStrings()`

Renvoie le tableau ordonné des noms de préréglages.

- **renvoie** : string[] Noms des six préréglages.

#### `editor_toolUtilities_roadDesignStandards.getPresetsMap()`

Renvoie la table nom de préréglage -> paramètres {maxSlope, minRadius, maxBanking, maxWidthGradient}.

- **renvoie** : table<string, table> Paramètres de chaque préréglage.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/roadDesignStandards.lua`.*
