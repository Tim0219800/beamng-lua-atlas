# `editor_audioForestEditor`

*Fichier : `lua/ge/extensions/editor/audioForestEditor.lua` · VM : Game Engine (GE) · 1022 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_audioForestEditor` : `extensions.load("editor_audioForestEditor")`, puis la globale `editor_audioForestEditor`

Mode d'édition « Audio Forest Editor » de l'éditeur de niveaux : configure un son d'ambiance de forêt à partir des arbres de l'objet Forest. L'outil construit un graphe de noeuds (espacement minimum 20 m) à partir des instances de forêt incluses, les classe en S/M/L selon le volume de leur boîte englobante, envoie ce nuage au module runtime core/audioForest et lui indique l'événement principal (défaut 'event:>Ambient>Ambiences>Forest_Static') et un éventuel « roomtone » ('event:>Ambient>Ambiences>Roomtone'). La fenêtre permet d'exclure des types d'arbres, de choisir la classe de chaque type, de régler la visualisation des noeuds et de sélectionner un type en cliquant dans la vue. L'état est persisté avec le niveau via onSerialize / onDeserialized.

## Remarques

- Le fichier ne contient pratiquement que des fonctions locales ; seules 4 fonctions sont exportées (hooks).
- Dépend des modules core/audioForest, core/audioForest/audioForestCommon et editor/toolUtilities/(render/markup, render/graph, style).
- Les noeuds sont dessinés dans un rayon de 1000 m par défaut, sphères de 1.5 m.
- À l'activation du mode, si aucun état persisté n'existe, tous les types de forêt sont inclus.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_audioForestEditor.onDeserialized(data)` | Reçoit l'état persisté après chargement du niveau ; le garde en attente, marque la liste de forêt comme à rafraîchir et reconstruit le nuage de noeuds si le mode est actif. Ignore les données qui ne sont pas une table. *(interne)* *(hook)* | 1005 |
| `editor_audioForestEditor.onEditorGui()` | Appelé chaque frame de l'éditeur : si le mode est actif, rafraîchit la liste des types, dessine la fenêtre, gère le survol/sélection des arbres et dessine les noeuds du graphe (et le centroïde de l'émetteur principal). *(interne)* *(hook)* | 918 |
| `editor_audioForestEditor.onEditorInitialized()` | Enregistre le mode d'édition audioForestEditMode (icône create_forest) et la fenêtre « audioForestEditor » (520x820). *(interne)* *(hook)* | 991 |
| `editor_audioForestEditor.onSerialize()` | Renvoie l'état de l'outil sous forme de table (version=1, rayons de visualisation, showNodes, mainEvent, roomtoneEnabled/Event/Z, selectedRow, includeByShape, classSelByShape, classOverrideByShape) pour la persistance du niveau et le runtime. *(interne)* *(hook)* | 113 |

### Détail des paramètres

#### `editor_audioForestEditor.onDeserialized(data)`

Reçoit l'état persisté après chargement du niveau ; le garde en attente, marque la liste de forêt comme à rafraîchir et reconstruit le nuage de noeuds si le mode est actif. Ignore les données qui ne sont pas une table.

- `data` (*table*) : Table renvoyée précédemment par onSerialize.

#### `editor_audioForestEditor.onSerialize()`

Renvoie l'état de l'outil sous forme de table (version=1, rayons de visualisation, showNodes, mainEvent, roomtoneEnabled/Event/Z, selectedRow, includeByShape, classSelByShape, classOverrideByShape) pour la persistance du niveau et le runtime.

- **renvoie** : table État sérialisable de l'éditeur.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`
- `worldEditorCppApi.` `renderForestBBs`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/audioForestEditor.lua`.*
