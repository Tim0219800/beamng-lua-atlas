# `editor_toolUtilities_meshAuditionMgr`

*Fichier : `lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua` · VM : Game Engine (GE) · 305 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_meshAuditionMgr` : `extensions.load("editor_toolUtilities_meshAuditionMgr")`, puis la globale `editor_toolUtilities_meshAuditionMgr`

Utilitaire d'« audition » de meshes statiques et fenêtre imgui de sélection, partagé entre outils de l'éditeur. Il liste les fichiers .dae (par défaut art/shapes/objects et art/shapes/garage_and_dealership/Clutter, ou un dossier choisi), crée un TSStatic temporaire 'Temp Audition Mesh' à 1000 m d'altitude, fait tourner la caméra autour et appelle un callback avec le mesh choisi. À la fermeture, la caméra revient à son ancienne pose et le mesh temporaire est supprimé.

## Exemple

```lua
local mam = require('editor/toolUtilities/meshAuditionMgr')
mam.registerWindow()
mam.addMeshToAudition(1, function(obj, path) ... end) -- ouvre la fenêtre
-- à chaque frame imgui :
mam.handleMeshAuditionAndSelection('lampadaire', function(obj, path) ... end)
```

## Remarques

- La fenêtre 'meshSelect' (300x300) n'est ouverte que par addMeshToAudition : handleMeshAuditionAndSelection ne fait rien tant que cette fenêtre n'a pas été ouverte.
- Le mesh temporaire est créé avec canSave = false, donc n'est pas sauvegardé avec le niveau.
- La caméra passe en caméra libre (commands.setFreeCamera) et tourne de pi/500 rad toutes les 0.05 s ; la distance se règle sur 1.2 fois la longueur de la boîte du mesh.
- La liste de fichiers est calculée une seule fois (au premier addMeshToAudition), triée par nom de fichier ; populateAvailableStaticMeshes la recalcule à la demande.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_meshAuditionMgr.addMeshToAudition(selectedMeshIdx, callback)` | Ajoute ou remplace le mesh en audition par celui d'indice donné : supprime l'ancien, ouvre la fenêtre si besoin, crée le TSStatic temporaire (position 0, 0, 1000), ajuste la caméra si la vue d'audition est active, puis appelle le callback. | 97 |
| `editor_toolUtilities_meshAuditionMgr.getAvailableStaticMeshes()` | Renvoie la liste (non copiée) des meshes statiques disponibles : { path, filename }. | 53 |
| `editor_toolUtilities_meshAuditionMgr.goToMeshView(timer, time)` | Déplace la caméra à la pose d'audition (mémorise l'ancienne pose, remet le chrono à zéro). Sans effet si on y est déjà. Renvoie le temps remis à zéro (0.0) à la première entrée, sinon le temps passé. | 143 |
| `editor_toolUtilities_meshAuditionMgr.goToOldView()` | Ramène la caméra à la pose mémorisée avant l'audition et sort de la vue d'audition. | 163 |
| `editor_toolUtilities_meshAuditionMgr.handleMeshAuditionAndSelection(meshTarget, onMeshSelectedFunct)` | À appeler à chaque frame imgui : fait tourner la caméra et dessine la fenêtre 'Static Mesh Selector' (recherche, choix de dossier, remise aux dossiers par défaut, liste filtrable, bouton Close). Un clic sur un nom met le mesh en audition et appelle le callback. | 184 |
| `editor_toolUtilities_meshAuditionMgr.leaveAuditionView()` | Quitte l'audition : supprime le mesh temporaire, restaure la caméra et masque la fenêtre. Sans effet si la fenêtre n'est pas ouverte. | 174 |
| `editor_toolUtilities_meshAuditionMgr.manageRotateCam()` | Fait avancer la caméra d'un pas autour du centre d'audition (angle modulo 2 pi). | 154 |
| `editor_toolUtilities_meshAuditionMgr.populateAvailableStaticMeshes()` | Reconstruit la liste des fichiers *.dae (recherche récursive dans les dossiers courants via FS:findFiles) et la trie par nom de fichier. | 56 |
| `editor_toolUtilities_meshAuditionMgr.registerWindow()` | Enregistre la fenêtre de sélection 'meshSelect' dans l'éditeur. | 171 |
| `editor_toolUtilities_meshAuditionMgr.removeAuditionMesh()` | Supprime le mesh en audition s'il existe. | 78 |
| `editor_toolUtilities_meshAuditionMgr.updateCameraPose()` | Place la caméra libre face au centre d'audition selon le rayon du mesh courant (distance 1.6 fois le rayon, élévation 0.8 fois). | 89 |

### Détail des paramètres

#### `editor_toolUtilities_meshAuditionMgr.addMeshToAudition(selectedMeshIdx, callback)`

Ajoute ou remplace le mesh en audition par celui d'indice donné : supprime l'ancien, ouvre la fenêtre si besoin, crée le TSStatic temporaire (position 0, 0, 1000), ajuste la caméra si la vue d'audition est active, puis appelle le callback.

- `selectedMeshIdx` (*integer*) : Indice dans la liste des meshes disponibles (1-based).
- `callback` (*function|nil*) : callback(auditionMesh, path) appelé après la création.

#### `editor_toolUtilities_meshAuditionMgr.getAvailableStaticMeshes()`

Renvoie la liste (non copiée) des meshes statiques disponibles : { path, filename }.

- **renvoie** : table[] Éléments { path = chemin complet, filename = nom du fichier }.

#### `editor_toolUtilities_meshAuditionMgr.goToMeshView(timer, time)`

Déplace la caméra à la pose d'audition (mémorise l'ancienne pose, remet le chrono à zéro). Sans effet si on y est déjà. Renvoie le temps remis à zéro (0.0) à la première entrée, sinon le temps passé.

- `timer` (*hptimer*) : Chrono à remettre à zéro.
- `time` (*number*) : Temps accumulé courant (s).
- **renvoie** : number Nouveau temps accumulé.

#### `editor_toolUtilities_meshAuditionMgr.handleMeshAuditionAndSelection(meshTarget, onMeshSelectedFunct)`

À appeler à chaque frame imgui : fait tourner la caméra et dessine la fenêtre 'Static Mesh Selector' (recherche, choix de dossier, remise aux dossiers par défaut, liste filtrable, bouton Close). Un clic sur un nom met le mesh en audition et appelle le callback.

- `meshTarget` (*string*) : Nom du composant pour lequel on choisit un mesh (affiché dans l'en-tête).
- `onMeshSelectedFunct` (*function|nil*) : callback(auditionMesh, path) à chaque sélection.

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua`.*
