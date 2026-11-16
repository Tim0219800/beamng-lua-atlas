# `editor_heroRoadEditor_groundmodel`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua` · VM : Game Engine (GE) · 201 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_groundmodel` : `extensions.load("editor_heroRoadEditor_groundmodel")`, puis la globale `editor_heroRoadEditor_groundmodel`

Mode de peinture des groundmodels (sec, mouillé, neige, glace…) du Hero Road Editor. L'artiste peint à la souris sur la chaussée ; la peinture est stockée comme tampons en coordonnées monde dans group.surfaceStamps ({x, y, r, m}), que mesh.lua rastérise sur les quads à la construction. Le module gère l'état du mode, l'entrée pinceau (un undo par trait) et la surcouche d'éditeur (cellules colorées, curseur, fil de fer). Le rendu en jeu ne change pas ; seule la physique change.

## Remarques

- matIndex : indice dans la palette de surfaceKit ; 1 = Dry = gomme ; défaut 2 (premier non-base, Wet).
- Rayon de pinceau par défaut 3.0 m ; l'espacement des tampons le long d'un trait est max(0.25, rayon*0.5) m.
- La reconstruction physique est différée : la peinture met seulement le groupe dans la file pending ; groupMgr.rebuildSurfaceOnly n'est appelé qu'après requestApply (bouton Apply), via flushPending à la frame suivante.
- Le lancer de rayon sous la souris utilise castRayStatic avec une portée de 2000 m ; la souris est ignorée si ImGui la capture ou si le gizmo d'axes est survolé.
- Le fil de fer est limité à 90 m autour de la caméra.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_groundmodel.clearAll(group)` | Supprime toute la peinture du groupe (vide surfaceStamps) et le met en attente de reconstruction. L'appelant gère le commit d'annulation. | 78 |
| `editor_heroRoadEditor_groundmodel.drawOverlay(group)` | Surcouche d'éditeur : teinte chaque cellule de la grille (chaussée + accotements) avec la couleur du matériau (alpha 60 pour la base, 135 pour le peint), plus un fil de fer optionnel. Lit les mêmes tampons et la même grille (group.meshGrid) que le maillage, donc cohérent avec la physique. Seulement pour la route sélectionnée. | 146 |
| `editor_heroRoadEditor_groundmodel.flushPending()` | Reconstruit le maillage physique de chaque route peinte depuis le dernier Apply (chemin léger surface seule : maillage + collision, sans décals/mobilier/peinture terrain), puis vide la file. Sans effet si Apply n'a pas été demandé. Appelé à chaque frame depuis onEditorGui. *(interne)* | 71 |
| `editor_heroRoadEditor_groundmodel.getBrushDefault()` | Rayon de pinceau par défaut (3.0). | 55 |
| `editor_heroRoadEditor_groundmodel.getBrushRadius()` | Rayon actuel du pinceau. | 53 |
| `editor_heroRoadEditor_groundmodel.getMatIndex()` | Indice de matériau de la palette actuellement peint. | 51 |
| `editor_heroRoadEditor_groundmodel.getShowWire()` | Indique si le fil de fer de la chaussée est affiché. | 56 |
| `editor_heroRoadEditor_groundmodel.isActive()` | Indique si le mode peinture est actif. | 50 |
| `editor_heroRoadEditor_groundmodel.requestApply()` | Demande la reconstruction de la physique des routes peintes (bouton Apply). Consommé par flushPending à la frame suivante. | 66 |
| `editor_heroRoadEditor_groundmodel.setActive(b)` | Active ou désactive le mode ; en désactivant, interrompt tout trait en cours. | 59 |
| `editor_heroRoadEditor_groundmodel.setBrushRadius(r)` | Fixe le rayon du pinceau. | 54 |
| `editor_heroRoadEditor_groundmodel.setMatIndex(i)` | Choisit le matériau peint. | 52 |
| `editor_heroRoadEditor_groundmodel.setShowWire(b)` | Affiche ou masque le fil de fer de la chaussée. | 57 |
| `editor_heroRoadEditor_groundmodel.updateAndPaint(group)` | À chaque frame en mode actif : dessine le curseur pinceau (sphère + disque) au point visé et, en glissant le bouton gauche, dépose des tampons {x,y,r,m} espacés régulièrement. Un seul commit d'historique 'Paint Groundmodel' par trait. | 101 |

### Détail des paramètres

#### `editor_heroRoadEditor_groundmodel.clearAll(group)`

Supprime toute la peinture du groupe (vide surfaceStamps) et le met en attente de reconstruction. L'appelant gère le commit d'annulation.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_groundmodel.drawOverlay(group)`

Surcouche d'éditeur : teinte chaque cellule de la grille (chaussée + accotements) avec la couleur du matériau (alpha 60 pour la base, 135 pour le peint), plus un fil de fer optionnel. Lit les mêmes tampons et la même grille (group.meshGrid) que le maillage, donc cohérent avec la physique. Seulement pour la route sélectionnée.

- `group` (*table*) : Groupe Hero Road sélectionné (meshGrid requis).

#### `editor_heroRoadEditor_groundmodel.getBrushDefault()`

Rayon de pinceau par défaut (3.0).

- **renvoie** : number Mètres.

#### `editor_heroRoadEditor_groundmodel.getBrushRadius()`

Rayon actuel du pinceau.

- **renvoie** : number Rayon en mètres.

#### `editor_heroRoadEditor_groundmodel.getMatIndex()`

Indice de matériau de la palette actuellement peint.

- **renvoie** : integer Indice (1 = Dry/gomme).

#### `editor_heroRoadEditor_groundmodel.getShowWire()`

Indique si le fil de fer de la chaussée est affiché.

- **renvoie** : boolean true si affiché.

#### `editor_heroRoadEditor_groundmodel.isActive()`

Indique si le mode peinture est actif.

- **renvoie** : boolean true si actif.

#### `editor_heroRoadEditor_groundmodel.setActive(b)`

Active ou désactive le mode ; en désactivant, interrompt tout trait en cours.

- `b` (*boolean*) : Nouvel état.

#### `editor_heroRoadEditor_groundmodel.setBrushRadius(r)`

Fixe le rayon du pinceau.

- `r` (*number*) : Rayon en mètres.

#### `editor_heroRoadEditor_groundmodel.setMatIndex(i)`

Choisit le matériau peint.

- `i` (*integer*) : Indice dans la palette de surfaceKit.

#### `editor_heroRoadEditor_groundmodel.setShowWire(b)`

Affiche ou masque le fil de fer de la chaussée.

- `b` (*boolean*) : Nouvel état (converti en booléen).

#### `editor_heroRoadEditor_groundmodel.updateAndPaint(group)`

À chaque frame en mode actif : dessine le curseur pinceau (sphère + disque) au point visé et, en glissant le bouton gauche, dépose des tampons {x,y,r,m} espacés régulièrement. Un seul commit d'historique 'Paint Groundmodel' par trait.

- `group` (*table*) : Groupe Hero Road sélectionné.
- **renvoie** : boolean true si le mode possède la souris (actif et groupe valide), false sinon.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua`.*
