# `gameplay_markers_walkingMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/walkingMarker.lua` · VM : Game Engine (GE) · 315 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_walkingMarker` : `extensions.load("gameplay_markers_walkingMarker")`, puis la globale `gameplay_markers_walkingMarker`

Marqueur de « portes » pour le joueur à pied (entrées de bâtiments, par exemple). Même principe que vehicleTrigger : chaque porte est une paire d'objets de scène (zone, icône) ; l'icône monte quand le personnage entre dans la zone, un écran 3D facultatif s'affiche 5 s, et le marqueur devient interactif. Contrairement à vehicleTrigger, le recouvrement n'est testé que si le joueur marche (data.isWalking) et sous la vitesse de croisière. Le module renvoie {create, cluster}.

## Remarques

- cluster regroupe les POI dont les paires de noms de portes (nom zone + nom icône, triées) sont identiques ; id 'walkingMarker#<noms concaténés>'. Lit poi.markerInfo.walkingMarker.{doors, icon, iconLift, iconOffsetHeight, pos, radius, screens} ; icône par défaut poi_exclamationmark_round ; elemData regroupe les poi.data.
- Le cluster ne renseigne pas pos ni radius : seuls visibilityPos et visibilityRadius sont définis, donc setup utilise la position nulle par défaut pour self.pos (utilisée par le son de l'écran).
- Les ids d'icônes sont de la forme <cluster.id>-gsIcon-<idx> (préfixe repris de la station-service, sans conséquence fonctionnelle).
- Chaque porte est évaluée séparément (overlap par porte), contrairement à vehicleTrigger où le résultat global est appliqué à toutes les portes.
- drawAxisBox est un utilitaire de debug non utilisé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_walkingMarker.cluster(pois, allClusters)` | Regroupe les POI walkingMarker ayant les mêmes noms de portes et ajoute un cluster par groupe à allClusters. *(interne)* | 278 |
| `gameplay_markers_walkingMarker.create(...)` | Fabrique un marqueur de portes pour piéton (instance de C). | 269 |

### Détail des paramètres

#### `gameplay_markers_walkingMarker.cluster(pois, allClusters)`

Regroupe les POI walkingMarker ayant les mêmes noms de portes et ajoute un cluster par groupe à allClusters.

- `pois` (*table[]*) : POI avec markerInfo.walkingMarker.
- `allClusters` (*table[]*) : Liste de clusters complétée en place.

#### `gameplay_markers_walkingMarker.create(...)`

Fabrique un marqueur de portes pour piéton (instance de C).

- `...` (*any*) : Arguments transmis à C:init (non utilisés).
- **renvoie** : table Instance de marqueur.

## Classe `C`

Marqueur de portes pour le joueur à pied.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | Retire les icônes, cache les écrans et efface la liste des portes. | 174 |
| `C:createObjects()` | Nettoie les objets existants (n'en crée pas). | 147 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Dessine une boîte de debug (arêtes et faces) par debugDrawer ; non utilisée ici. | 204 |
| `C:drawOnMinimap(td)` | Dessine un cercle sur la minimap à la position de chaque icône de porte. | 262 |
| `C:hide()` | Passe invisible, rend les icônes transparentes et cache les écrans. | 151 |
| `C:init()` | Initialise visible = true. | 21 |
| `C:instantFade(visible)` | Ne fait rien. | 200 |
| `C:interactInPlayMode(interactData, interactableElements)` | Si canInteract et que le joueur est dans une porte, ajoute les données (elemData) du cluster aux éléments interactifs. | 190 |
| `C:setup(cluster)` | Pour chaque porte, retrouve l'objet de zone et l'objet d'icône, calcule la boîte de la zone, cache l'écran associé et crée l'icône. | 25 |
| `C:show()` | Repasse visible. | 169 |
| `C:update(data)` | Chaque frame : teste, par porte, le recouvrement OBB/OBB (uniquement si le joueur marche et sous la vitesse de croisière), gère écrans, son, icônes et trait de debug, puis met à jour isInAreaChanged et anyOverlap. | 83 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawTriSolid`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/walkingMarker.lua`.*
