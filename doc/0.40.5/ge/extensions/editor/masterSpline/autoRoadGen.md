# `editor_masterSpline_autoRoadGen`

*Fichier : `lua/ge/extensions/editor/masterSpline/autoRoadGen.lua` · VM : Game Engine (GE) · 394 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_masterSpline_autoRoadGen` : `extensions.load("editor_masterSpline_autoRoadGen")`, puis la globale `editor_masterSpline_autoRoadGen`

Génération automatique de routes de l'outil Master Spline : entre chaque paire de nœuds consécutifs, une recherche de chemin sur grille (8 directions, file de priorité minheap) tient compte du terrain, de la pente maximale, du rayon minimal et de l'évitement de pente du preset de route. Le chemin est simplifié (RDP), élargi dans les virages serrés, ajusté en Z, interpolé (Catmull-Rom) puis affiché en aperçu avant d'être converti en spline.

## Exemple

```lua
local gen = extensions.editor_masterSpline_autoRoadGen
gen.generateAutoPreview(spline, autoParams, presetParams)
-- chaque image : gen.handlePreview(spline)
if gen.isPreview() then gen.createAutoRoad(spline, 0.5, 0.6) end
```

## Remarques

- Le module garde un seul aperçu global (pathNodes/pathWidths) ; il est partagé, pas lié à une spline précise.
- Paramètres lus : autoParams.baseWidth, slopeAvoidance, widthBlend ; presetParams.maxSlope, minRadius, maxWidthGradient.
- Constantes : tolérance RDP 9.0 puis 2.5 après interpolation, 10 itérations de relaxation Z, décalage de départ de 10 m à chaque waypoint intermédiaire, élargissement maximal +80 % en courbure maximale.
- createAutoRoad remplace nodes, widths et nmls de la spline (normales (0,0,1)) et vide l'aperçu ; l'auto-dévers n'est activé que si bankingStrength > 0.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_masterSpline_autoRoadGen.clearPreview()` | Efface l'aperçu courant (nœuds et largeurs). | 67 |
| `editor_masterSpline_autoRoadGen.createAutoRoad(spline, bankingStrength, autoBankFalloff)` | Convertit l'aperçu en géométrie de la spline (nodes, widths, nmls), la marque isDirty, active l'auto-dévers si bankingStrength > 0, puis efface l'aperçu. Si l'aperçu a moins de 2 nœuds, il est vidé sans rien créer. | 346 |
| `editor_masterSpline_autoRoadGen.generateAutoPreview(spline, autoParams, presetParams)` | Génère l'aperçu d'une route automatique passant par les nœuds de la spline (au moins 2, sinon retourne sans rien faire). Chaque segment est calculé séparément, les doublons aux jonctions sont retirés, puis le chemin est simplifié, élargi dans les épingles, mis à la pente autorisée et au plus près du terrain, interpolé et re-simplifié. | 290 |
| `editor_masterSpline_autoRoadGen.handlePreview(spline)` | Dessine le ruban d'aperçu (rSpline.renderPreviewRibbon). À appeler une fois par image ; ne fait rien si la spline est nil ou l'aperçu vide. | 375 |
| `editor_masterSpline_autoRoadGen.isPreview()` | Indique si un aperçu de route existe (au moins un nœud de chemin). | 64 |

### Détail des paramètres

#### `editor_masterSpline_autoRoadGen.createAutoRoad(spline, bankingStrength, autoBankFalloff)`

Convertit l'aperçu en géométrie de la spline (nodes, widths, nmls), la marque isDirty, active l'auto-dévers si bankingStrength > 0, puis efface l'aperçu. Si l'aperçu a moins de 2 nœuds, il est vidé sans rien créer.

- `spline` (*table*) : Spline à remplir.
- `bankingStrength` (*number*) : Force du dévers automatique ; 0 ou moins désactive le dévers.
- `autoBankFalloff` (*number*) : Atténuation du dévers automatique (copiée dans spline.autoBankFalloff).

#### `editor_masterSpline_autoRoadGen.generateAutoPreview(spline, autoParams, presetParams)`

Génère l'aperçu d'une route automatique passant par les nœuds de la spline (au moins 2, sinon retourne sans rien faire). Chaque segment est calculé séparément, les doublons aux jonctions sont retirés, puis le chemin est simplifié, élargi dans les épingles, mis à la pente autorisée et au plus près du terrain, interpolé et re-simplifié.

- `spline` (*table*) : Master Spline dont les nodes servent de waypoints.
- `autoParams` (*table*) : Paramètres de l'outil (baseWidth, slopeAvoidance, widthBlend).
- `presetParams` (*table*) : Contraintes du preset de route (maxSlope, minRadius, maxWidthGradient).

#### `editor_masterSpline_autoRoadGen.handlePreview(spline)`

Dessine le ruban d'aperçu (rSpline.renderPreviewRibbon). À appeler une fois par image ; ne fait rien si la spline est nil ou l'aperçu vide.

- `spline` (*table|nil*) : Spline courante.

#### `editor_masterSpline_autoRoadGen.isPreview()`

Indique si un aperçu de route existe (au moins un nœud de chemin).

- **renvoie** : boolean true si un aperçu existe.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/masterSpline/autoRoadGen.lua`.*
