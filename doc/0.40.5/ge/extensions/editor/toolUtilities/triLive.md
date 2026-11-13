# `editor_toolUtilities_triLive`

*Fichier : `lua/ge/extensions/editor/toolUtilities/triLive.lua` · VM : Game Engine (GE) · 271 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_triLive` : `extensions.load("editor_toolUtilities_triLive")`, puis la globale `editor_toolUtilities_triLive`

Compteur de triangles réellement dessinés par un « kit » (pièces instanciées), vu depuis la caméra : chaque instance est comptée au LOD qu'elle dessine vraiment, moins celles hors écran. Sert au pied de page statsFooter. Garde une seule réponse à la fois (l'éditeur n'a qu'un mode d'édition). Les échelles de LOD mesurées, coûteuses, sont partagées et mises en cache sur disque dans /temp/massingEditor/shapeLods.json (avec la date de modification du fichier de forme).

## Exemple

```lua
local tl = require('editor/toolUtilities/triLive')
tl.note(instances)     -- à chaque reconstruction
tl.scanStep()          -- chaque frame
tl.update(instances)
local tris, dist, live, placed, toScan = tl.get()
```

## Remarques

- Chaque instance doit avoir shape (chemin de forme), px, py, pz.
- Mise à jour limitée à 4 Hz, et 10000 instances traitées par frame pour ne pas figer l'éditeur sur une grande ville.
- Le calcul suppose une constante moteur ENGINE_SCALE = 4.48 mesurée à 1920x1009 et 65 degrés, avec le FOV et la taille de fenêtre réels. La visibilité est testée par un cône autour de la diagonale de l'écran.
- Une forme impossible à mesurer est comptée comme ne dessinant rien pour la session, avec un avertissement loggé, et réessayée au prochain rechargement.
- Une forme dont le fichier a été réécrit depuis la mesure est remesurée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_triLive.get()` | Dernier résultat : triangles instanciés dessinés, distance au centroïde des instances (m), instances dessinées, instances placées, formes restant à scanner. | 254 |
| `editor_toolUtilities_triLive.note(instances)` | Met en file les formes de `instances` jamais mesurées (ou dont le fichier a changé). Assez peu coûteux pour être appelé à chaque reconstruction. | 130 |
| `editor_toolUtilities_triLive.rescan()` | Vide le cache de mesures, les rayons, la file et les échecs : « tout réessayer ». Le cache sera réécrit. | 258 |
| `editor_toolUtilities_triLive.scanStep()` | Mesure UNE forme par appel (échelle de LOD), appelé depuis la frame de l'éditeur pour que le scan à froid apparaisse comme une progression et non comme un gel. Sauvegarde le cache quand la file est vide. | 148 |
| `editor_toolUtilities_triLive.update(instances)` | Calcule le total de triangles instanciés à l'écran et la distance caméra - centroïde des instances. Limité en fréquence et découpé en tranches de 10000 instances par frame. | 197 |

### Détail des paramètres

#### `editor_toolUtilities_triLive.get()`

Dernier résultat : triangles instanciés dessinés, distance au centroïde des instances (m), instances dessinées, instances placées, formes restant à scanner.

- **renvoie** : number Triangles dessinés.
- **renvoie** : number Distance au centroïde (m).
- **renvoie** : integer Instances dessinées.
- **renvoie** : integer Instances placées.
- **renvoie** : integer Formes encore à scanner.

#### `editor_toolUtilities_triLive.note(instances)`

Met en file les formes de `instances` jamais mesurées (ou dont le fichier a changé). Assez peu coûteux pour être appelé à chaque reconstruction.

- `instances` (*table*) : Liste d'entrées avec champ shape.

#### `editor_toolUtilities_triLive.scanStep()`

Mesure UNE forme par appel (échelle de LOD), appelé depuis la frame de l'éditeur pour que le scan à froid apparaisse comme une progression et non comme un gel. Sauvegarde le cache quand la file est vide.

- **renvoie** : boolean Vrai si une forme a été traitée.

#### `editor_toolUtilities_triLive.update(instances)`

Calcule le total de triangles instanciés à l'écran et la distance caméra - centroïde des instances. Limité en fréquence et découpé en tranches de 10000 instances par frame.

- `instances` (*table*) : Liste d'entrées { shape, px, py, pz }.

## Appels vers le moteur (C++)

- `FS:` `stat`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/triLive.lua`.*
