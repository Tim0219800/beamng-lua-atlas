# `editor_masterSpline_homologation`

*Fichier : `lua/ge/extensions/editor/masterSpline/homologation.lua` · VM : Game Engine (GE) · 427 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_masterSpline_homologation` : `extensions.load("editor_masterSpline_homologation")`, puis la globale `editor_masterSpline_homologation`

Utilitaire de l'outil Master Spline pour « homologuer » une spline par rapport à un preset de standard routier (roadDesignStandards) : il mesure les écarts géométriques (pente, rayon de virage, dévers, gradient de largeur) et les corrige par itérations. Le mode actif est spline.splineAnalysisMode : 0 pente, 1 rayon, 2 dévers, 3 largeur. Le preset vient de spline.homologationPreset.

## Remarques

- Constantes internes : 5 itérations d'optimisation par image, rayon analysé sur 5 points de chaque côté, tolérance de violation de rayon 0.01, lissage laplacien 0.2, pas de dévers 1 degré, nudge de largeur 0.05.
- analyseSpline remplit les tableaux d'erreur normalisée de la spline (eSlopeNorm, eRadiusNorm, eBankingNorm, eWidthNorm) utilisés pour l'affichage.
- Un splineAnalysisMode hors 0 à 3 provoque une erreur (func nil) dans analyseSpline et optimiseSpline ; il n'y a pas de garde.
- Les tolérances du preset viennent de presetsMap : maxSlope, minRadius, maxBanking, maxWidthGradient.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_masterSpline_homologation.analyseSpline(spline)` | Analyse la spline avec la métrique courante (spline.splineAnalysisMode) et remplit le tableau d'erreurs normalisées correspondant, à partir de divPoints/divWidths et du preset d'homologation. | 218 |
| `editor_masterSpline_homologation.getOptimisationIterationsPerFrame()` | Renvoie le nombre d'itérations d'optimisation à exécuter par image (5). | 46 |
| `editor_masterSpline_homologation.optimiseSpline(spline, numIter)` | Recalcule la géométrie (catmullRomFree), analyse la spline, la marque isDirty, puis lance numIter itérations de l'optimiseur correspondant au mode (pente, rayon, dévers ou largeur). Modifie les nœuds, normales ou largeurs en place. | 406 |

### Détail des paramètres

#### `editor_masterSpline_homologation.analyseSpline(spline)`

Analyse la spline avec la métrique courante (spline.splineAnalysisMode) et remplit le tableau d'erreurs normalisées correspondant, à partir de divPoints/divWidths et du preset d'homologation.

- `spline` (*table*) : Spline avec nodes, divPoints, divWidths, nmls, homologationPreset et splineAnalysisMode.

#### `editor_masterSpline_homologation.getOptimisationIterationsPerFrame()`

Renvoie le nombre d'itérations d'optimisation à exécuter par image (5).

- **renvoie** : integer Itérations par image.

#### `editor_masterSpline_homologation.optimiseSpline(spline, numIter)`

Recalcule la géométrie (catmullRomFree), analyse la spline, la marque isDirty, puis lance numIter itérations de l'optimiseur correspondant au mode (pente, rayon, dévers ou largeur). Modifie les nœuds, normales ou largeurs en place.

- `spline` (*table*) : Spline à optimiser.
- `numIter` (*integer*) : Nombre d'itérations à effectuer dans cet appel (typiquement getOptimisationIterationsPerFrame()).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/masterSpline/homologation.lua`.*
