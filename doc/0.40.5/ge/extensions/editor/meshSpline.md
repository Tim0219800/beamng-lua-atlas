# `editor_meshSpline`

*Fichier : `lua/ge/extensions/editor/meshSpline.lua` · VM : Game Engine (GE) · 1924 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshSpline` : `extensions.load("editor_meshSpline")`, puis la globale `editor_meshSpline`

Outil Mesh Spline du world editor : on trace une spline (nœuds, largeurs, normales) le long de laquelle des meshes statiques (TSStatic) sont répétés, par exemple glissières, barrières ou lampadaires. Ce fichier gère la fenêtre de l'outil, les entrées souris/clavier, le rendu de la spline, l'import depuis des TSStatic existants (polygone ou menu contextuel du scenetree), le terraformage, la sauvegarde de session et le « bake » (verrouiller la spline pour que ses meshes soient sauvegardés avec le niveau). L'état des splines vit dans meshSpline/splineMgr.lua ; le placement des meshes dans meshSpline/populate.lua.

## Remarques

- Les splines sont transitoires : onClientEndMission les supprime toutes et onSerialize les retire de la scène après sérialisation (rechargement Lua).
- Une spline verrouillée (isEnabled = false) garde ses meshes dans la scène : onSerialize appelle pop.release pour mémoriser leurs ids, onDeserialized les reprend avec pop.adopt.
- Le mode d'édition meshSplineEditMode est créé dans onEditorInitialized ; setLockedById et eachObjectById servent aussi au Master Spline pour ses splines liées.
- Constantes internes : espacement de -0.2 à 40 m, décalage vertical de -100 à 100 m, graine aléatoire de 0 à 1000, largeur par défaut d'un nœud 10 m, tolérance RDP de simplification 9.0.
- Les indices selectedSplineIdx / selectedNodeIdx sont en base 1.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshSpline.eachObjectById(id, fn)` | Appelle fn(mesh, true) pour chaque mesh que l'outil détient pour la spline d'id donné (le « each » de splineLock). Ne fait rien si la spline n'existe plus. | 108 |
| `editor_meshSpline.onClientEndMission()` | Hook appelé en quittant la carte : supprime toutes les mesh splines, y compris désactivées. *(interne)* *(hook)* | 1907 |
| `editor_meshSpline.onDeserialized(data)` | Hook de désérialisation : recrée les splines, reprend les meshes des splines verrouillées (pop.adopt), borne l'indice sélectionné et recalcule la table id vers indice. *(interne)* *(hook)* | 164 |
| `editor_meshSpline.onEditorGui()` | Hook appelé à chaque image par le world editor : applique l'import différé, reconstruit les splines « dirty » même si l'outil est inactif (pour les splines liées), puis, si l'outil est actif, dessine sa fenêtre, gère l'audition de meshes, le polygone d'import, les événements souris/clavier et le rendu. Outil inactif : dessine seulement les enveloppes des splines. *(interne)* *(hook)* | 1782 |
| `editor_meshSpline.onEditorInitialized()` | Hook d'initialisation du world editor : crée le mode meshSplineEditMode, enregistre la fenêtre « meshSpline » et celle d'audition, et ajoute l'entrée « Convert to Mesh Spline » au menu contextuel du scenetree (valide si au moins 2 TSStatic sont sélectionnés). *(interne)* *(hook)* | 1886 |
| `editor_meshSpline.onSerialize()` | Hook de sérialisation d'extension (avant rechargement Lua) : quitte la vue d'audition, libère les meshes des splines verrouillées, sérialise chaque spline, puis supprime toutes les splines. Renvoie une table vide s'il n'y en a aucune. *(interne)* *(hook)* | 141 |
| `editor_meshSpline.setLockedById(id, isLocked)` | Verrouille ou déverrouille la mesh spline d'identifiant donné et la reconstruit immédiatement. Avant un verrouillage, reconstruit d'abord une spline « dirty » pour verrouiller ce qui est affiché. Ne fait rien si l'id est inconnu. Utilisé aussi par le Master Spline pour ses enfants liés. | 98 |
| `editor_meshSpline.setSelectedNodeIdx(idx)` | Définit l'indice du nœud sélectionné (sélection partagée entre outils). | 138 |
| `editor_meshSpline.setSelectedSplineIdx(idx)` | Définit l'indice de la spline sélectionnée (sélection partagée entre outils). | 135 |

### Détail des paramètres

#### `editor_meshSpline.eachObjectById(id, fn)`

Appelle fn(mesh, true) pour chaque mesh que l'outil détient pour la spline d'id donné (le « each » de splineLock). Ne fait rien si la spline n'existe plus.

- `id` (*string*) : Identifiant de la mesh spline.
- `fn` (*function*) : Callback appelé avec le mesh et true.

#### `editor_meshSpline.onDeserialized(data)`

Hook de désérialisation : recrée les splines, reprend les meshes des splines verrouillées (pop.adopt), borne l'indice sélectionné et recalcule la table id vers indice.

- `data` (*table|nil*) : Données renvoyées par onSerialize.

#### `editor_meshSpline.onSerialize()`

Hook de sérialisation d'extension (avant rechargement Lua) : quitte la vue d'audition, libère les meshes des splines verrouillées, sérialise chaque spline, puis supprime toutes les splines. Renvoie une table vide s'il n'y en a aucune.

- **renvoie** : table Liste des splines sérialisées.

#### `editor_meshSpline.setLockedById(id, isLocked)`

Verrouille ou déverrouille la mesh spline d'identifiant donné et la reconstruit immédiatement. Avant un verrouillage, reconstruit d'abord une spline « dirty » pour verrouiller ce qui est affiché. Ne fait rien si l'id est inconnu. Utilisé aussi par le Master Spline pour ses enfants liés.

- `id` (*string*) : Identifiant (UUID) de la mesh spline.
- `isLocked` (*boolean*) : true pour verrouiller (isEnabled = false), false pour déverrouiller.

#### `editor_meshSpline.setSelectedNodeIdx(idx)`

Définit l'indice du nœud sélectionné (sélection partagée entre outils).

- `idx` (*integer*) : Indice de nœud, base 1.

#### `editor_meshSpline.setSelectedSplineIdx(idx)`

Définit l'indice de la spline sélectionnée (sélection partagée entre outils).

- `idx` (*integer*) : Indice de spline, base 1.

## Appels vers le moteur (C++)

- `obj:` `getClassName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshSpline.lua`.*
