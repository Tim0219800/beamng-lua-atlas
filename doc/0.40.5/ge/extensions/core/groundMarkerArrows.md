# `core_groundMarkerArrows`

*Fichier : `lua/ge/extensions/core/groundMarkerArrows.lua` · VM : Game Engine (GE) · 436 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_groundMarkerArrows` : `extensions.load("core_groundMarkerArrows")`, puis la globale `core_groundMarkerArrows`

Extension GE `core_groundMarkerArrows` : gère les grandes flèches flottantes affichées aux intersections de l'itinéraire de navigation (modèle s_mm_arrow_floating.dae, objets TSStatic dans le SimGroup 'arrowPool'). Elle est pilotée par core_groundMarkers (createArrowPool, updateArrows, clearArrows) ; un moddeur n'a normalement pas à l'appeler directement. Elle affiche aussi le message « mauvaise direction » quand le véhicule s'éloigne du chemin.

## Remarques

- Pool de 11 flèches (boucle 0..10), chacune représentée par un proxy {pos, rot, state, wp, smoothers}. États : 'unused', 'visible', 'fadeout'. Les flèches sont placées 3,5 m au-dessus du nœud d'intersection, orientées vers le point suivant du chemin.
- Une flèche n'est créée que pour un point de chemin qui est une intersection (linkCount > 2, avec nœud wp) situé entre 15 m (minArrowDistance) et 180 m (maxArrowDistance) devant le véhicule, et dont l'angle de virage est supérieur à 25 degrés, ou inférieur mais sans être le plus petit angle parmi les sorties de l'intersection.
- Taille : 3 (arrowSmall) à moins de 65 m, 4,5 (arrowLarge) au-delà ; léger décalage vers l'avant quand la flèche est à moins de 45 m ; fondu d'apparition/disparition par lissage temporel.
- Couleur : lue dans core_groundMarkers.floatingArrowColor (le paramètre floatingArrowColor de createArrowPool n'est pas utilisé).
- Mauvaise direction : un compteur borné à -20..20 augmente quand la vitesse du véhicule est opposée à la direction du chemin (produit scalaire négatif) et diminue sinon ; au-dessus de 0, ui_message 'ui.groundMarkers.wrongDirection' est affiché (5 s, id 'wrongDirection').
- En mode photo (photoModeOpen) toutes les flèches sont cachées.
- Incohérences : le paramètre floatingArrowColor de createArrowPool est ignoré ; un gros bloc de debug ImGui est commenté dans onPreRender ; onExit est un simple alias de clearArrows.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_groundMarkerArrows.clearArrows()` | Supprime tous les objets flèche et le SimGroup 'arrowPool', vide les tables de suivi et remet le compteur de mauvaise direction à -20. | 29 |
| `core_groundMarkerArrows.createArrowPool(floatingArrowColor)` | Crée le SimGroup 'arrowPool' avec 11 flèches TSStatic cachées (sans collision, canSave = false) et leurs proxies. Si le pool existe déjà, remet tous les proxies à 'unused' et cache les flèches. | 50 |
| `core_groundMarkerArrows.onExit()` | Hook de sortie du moteur : alias de clearArrows. *(interne)* *(hook)* | 29 |
| `core_groundMarkerArrows.onPreRender(dt)` | Hook de rendu : applique à chaque flèche non 'unused' sa position, rotation et échelle (taille lissée x alpha) et fait passer les flèches en fondu à l'état 'unused' une fois invisibles. Cache tout en mode photo. *(interne)* *(hook)* | 246 |
| `core_groundMarkerArrows.updateArrows(path, pathLength)` | Met à jour les flèches d'après le chemin : crée/réutilise celles des intersections à guider, met en fondu celles qui ne sont plus utiles, et gère le message de mauvaise direction. | 122 |

### Détail des paramètres

#### `core_groundMarkerArrows.createArrowPool(floatingArrowColor)`

Crée le SimGroup 'arrowPool' avec 11 flèches TSStatic cachées (sans collision, canSave = false) et leurs proxies. Si le pool existe déjà, remet tous les proxies à 'unused' et cache les flèches.

- `floatingArrowColor` (*number[]|nil*) : Non utilisé (la couleur vient de core_groundMarkers.floatingArrowColor).

#### `core_groundMarkerArrows.onPreRender(dt)`

Hook de rendu : applique à chaque flèche non 'unused' sa position, rotation et échelle (taille lissée x alpha) et fait passer les flèches en fondu à l'état 'unused' une fois invisibles. Cache tout en mode photo.

- `dt` (*number*) : Delta temps du rendu en secondes.

#### `core_groundMarkerArrows.updateArrows(path, pathLength)`

Met à jour les flèches d'après le chemin : crée/réutilise celles des intersections à guider, met en fondu celles qui ne sont plus utiles, et gère le message de mauvaise direction.

- `path` (*table[]*) : Chemin du routeur : éléments {pos = vec3, distToTarget, wp, linkCount}.
- `pathLength` (*number*) : Distance totale du véhicule à la destination en mètres (distToVehicle = pathLength - path[i].distToTarget).

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/groundMarkerArrows.lua`.*
