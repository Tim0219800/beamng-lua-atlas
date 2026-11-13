# `editor_roadArchitect_decals`

*Fichier : `lua/ge/extensions/editor/roadArchitect/decals.lua` · VM : Game Engine (GE) · 508 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_decals` : `extensions.load("editor_roadArchitect_decals")`, puis la globale `editor_roadArchitect_decals`

Gestion des decals de Road Architect. Pour une route donnée, crée un « jeu de decals » : DecalRoad invisibles (matériau road_invisible) par section de voies de type road_lane servant au graphe de navigation, plus les couches visuelles (route, ligne centrale, bords, séparations de voies, lignes de jonction début/fin) posées comme DecalRoad ou instances de decals via l'éditeur. Il garde en mémoire les sections d'asphalte, les decals et les templates par nom de route, et sait tout retirer de la scène.

## Remarques

- Module d'éditeur : utilise l'objet global editor (editor.addRoadNode, editor.addDecalInstanceWithTan, editor.deleteDecalInstance) et createObject('DecalRoad'), donc utilisable seulement avec le world editor chargé.
- Les nœuds de DecalRoad sont relevés de 4.2 m en z (raised) et les nœuds à moins de 1 m du précédent sont ignorés.
- Pour les sections uniquement à voies positives, l'ordre des nœuds est inversé.
- removeTemplates doit être appelé après la suppression de toutes les instances de decals (tryRemoveAll respecte cet ordre).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_decals.createDecal(road, folder)` | Crée le jeu de decals d'une route : calcule les sections de voies road_lane, crée pour chacune un DecalRoad (si road.isDrivable) avec voies gauche/droite, sens unique et drivabilité 1, puis les couches visuelles activées par l'utilisateur. Les objets créés sont ajoutés au dossier donné. | 91 |
| `editor_roadArchitect_decals.removeTemplates()` | Supprime tous les templates de decals (les instances doivent déjà avoir été supprimées) et vide les tables templates. | 477 |
| `editor_roadArchitect_decals.tryRemove(name)` | Tente de retirer de la scène le jeu de decals portant ce nom : supprime les DecalRoad principaux, les couches DecalRoad et les instances de decals, puis vide les tables associées. Sans effet si le nom est inconnu. | 447 |
| `editor_roadArchitect_decals.tryRemoveAll()` | Retire de la scène tous les jeux de decals connus (asphalte puis decals), vide les tables, puis supprime les templates. | 488 |

### Détail des paramètres

#### `editor_roadArchitect_decals.createDecal(road, folder)`

Crée le jeu de decals d'une route : calcule les sections de voies road_lane, crée pour chacune un DecalRoad (si road.isDrivable) avec voies gauche/droite, sens unique et drivabilité 1, puis les couches visuelles activées par l'utilisateur. Les objets créés sont ajoutés au dossier donné.

- `road` (*table*) : Route Road Architect (nom, profil, renderData, isDrivable, isOverObject…).
- `folder` (*any*) : Objet dossier (SimGroup) de la scène recevant les DecalRoad créés (déduit du code : appelle folder:addObject).

#### `editor_roadArchitect_decals.tryRemove(name)`

Tente de retirer de la scène le jeu de decals portant ce nom : supprime les DecalRoad principaux, les couches DecalRoad et les instances de decals, puis vide les tables associées. Sans effet si le nom est inconnu.

- `name` (*string*) : Nom de la route dont on retire les decals.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/decals.lua`.*
