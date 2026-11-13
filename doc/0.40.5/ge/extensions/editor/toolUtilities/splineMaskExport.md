# `editor_toolUtilities_splineMaskExport`

*Fichier : `lua/ge/extensions/editor/toolUtilities/splineMaskExport.lua` · VM : Game Engine (GE) · 79 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_splineMaskExport` : `extensions.load("editor_toolUtilities_splineMaskExport")`, puis la globale `editor_toolUtilities_splineMaskExport`

Exporte des surfaces de rubans (splines) sous forme de masque PNG 16 bits (GFXFormatR16) à la taille de la grille du terrain. Chaque texel vaut 65535 si son centre monde est dans un quadrilatère, 0 sinon. Sert aux outils de splines pour fabriquer un masque utilisable par l'éditeur de terrain (peinture). Nécessite un terrain chargé et l'extension editor_terrainEditor.

## Exemple

```lua
extensions.editor_toolUtilities_splineMaskExport.export('/levels/mon_niveau/masque.png', sources, 0.5)
```

## Remarques

- Sans bloc de terrain ou sans terrain editor, la fonction logue une erreur ('E') et sort sans rien renvoyer.
- Parcourt chaque texel de la grille : coût élevé sur de grands terrains.
- Le résultat n'est pas renvoyé : le succès ou l'échec de saveFile est seulement loggé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_splineMaskExport.export(filepath, sources, margin)` | Construit un kd-tree des quadrilatères des sources (agrandis de `margin`), rasterise un bitmap de la taille du terrain et l'enregistre en PNG. | 19 |

### Détail des paramètres

#### `editor_toolUtilities_splineMaskExport.export(filepath, sources, margin)`

Construit un kd-tree des quadrilatères des sources (agrandis de `margin`), rasterise un bitmap de la taille du terrain et l'enregistre en PNG.

- `filepath` (*string*) : Chemin du fichier .png à écrire.
- `sources` (*table*) : Table de tables de quadrilatères représentant les surfaces de rubans.
- `margin` (*number|nil*) : Marge ajoutée autour des quadrilatères (0 par défaut), en mètres (déduit du code).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/splineMaskExport.lua`.*
