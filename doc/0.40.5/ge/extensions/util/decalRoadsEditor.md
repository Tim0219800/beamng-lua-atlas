# `util_decalRoadsEditor`

*Fichier : `lua/ge/extensions/util/decalRoadsEditor.lua` · VM : Game Engine (GE) · 118 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_decalRoadsEditor` : `extensions.load("util_decalRoadsEditor")`, puis la globale `util_decalRoadsEditor`

Visualisation de débogage, chargée dynamiquement par le moteur ou l'éditeur de monde : à chaque frame, elle dessine les objets AIPath de la scène (chemins de circulation) à proximité de la caméra : sphères rouges aux nœuds, prismes bleus entre nœuds, et des décalques de flèches par voie (cyan pour la voie gauche, rouge pour la droite, inversés si flipDirection). Seuls les AIPath avec drivability > 0 sont affichés.

## Remarques

- Distance d'affichage : visibilité décroissante de 400 m à 500 m de la caméra (fadeStart 200 et fadeEnd 250, doublés dans le calcul) ; au-delà d'environ 500 m rien n'est dessiné.
- Le nombre de voies vient de lanesLeft et lanesRight de chaque AIPath ; les flèches sont ajoutées via Engine.Render.DynamicDecalMgr.addDecal avec la texture art/arrow_waypoint_1.dds.
- Malgré son nom de fichier (decalRoads), l'outil traite la classe AIPath, et ses logs portent l'étiquette 'AIPathEditor'.
- Coût : tous les AIPath et leurs nœuds sont parcourus à chaque frame, avec des décalques recréés chaque fois : outil de développement, pas de production.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_decalRoadsEditor.onExtensionLoaded()` | Hook de chargement : log « module loaded ». *(interne)* *(hook)* | 109 |
| `util_decalRoadsEditor.onExtensionUnloaded()` | Hook de déchargement : log « module unloaded ». *(interne)* *(hook)* | 106 |
| `util_decalRoadsEditor.onPreRender(dt)` | Hook appelé avant chaque rendu : dessine les AIPath proches de la caméra (nœuds, segments, flèches de voies). *(interne)* *(hook)* | 9 |

### Détail des paramètres

#### `util_decalRoadsEditor.onPreRender(dt)`

Hook appelé avant chaque rendu : dessine les AIPath proches de la caméra (nœuds, segments, flèches de voies).

- `dt` (*number*) : Durée de la frame (s) ; non utilisée.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/decalRoadsEditor.lua`.*
