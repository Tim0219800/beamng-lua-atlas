# `editor_forestTsstaticMover`

*Fichier : `lua/ge/extensions/editor/forestTsstaticMover.lua` · VM : Game Engine (GE) · 565 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_forestTsstaticMover` : `extensions.load("editor_forestTsstaticMover")`, puis la globale `editor_forestTsstaticMover`

Outil d'éditeur « Forest TSStatic Mover » (menu Window > Terrain) qui convertit des instances entre la forêt (ForestItem) et des objets TSStatic. Deux boutons : « Move selected ForestItems -> TSStatic » (mode Forest Tools requis) et « Move selected TSStatic -> ForestItems » (mode Object Select requis). Options : sélectionner les objets créés, déplacer toutes les instances du même mesh, ranger les TSStatic créés dans un nouveau SimGroup. L'action est enregistrée dans l'historique (annuler/rétablir).

## Remarques

- L'option de dossier (SimGroup) ne s'applique qu'au sens ForestItems vers TSStatic : les items de forêt n'utilisent pas de SimGroup.
- L'outil affiche « Forest data is missing in the level » si le niveau n'a pas d'objet forêt (core_forest.getForestObject()).

**Dépendances (chargées avant) :** `core_forest`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_forestTsstaticMover.onEditorGui()` | Hook appelé chaque frame par l'éditeur : dessine la fenêtre « Forest TSStatic Mover » (mode d'édition courant, forme sélectionnée, cases à cocher, boutons de conversion grisés selon le mode, dernière erreur). *(interne)* *(hook)* | 492 |
| `editor_forestTsstaticMover.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : ajoute l'entrée de menu « Forest TSStatic Mover » (groupe Terrain) et enregistre la fenêtre (560x260). *(interne)* *(hook)* | 556 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant ce module : {"core_forest"}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectSelectionChanged` — écouté par 8 module(s)

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `obj:` `getId`, `registerObject`, `setField`, `setInternalName`, `setName`, `setScale`, `setTransform`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `rebuildForestManagerInstanceData`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/forestTsstaticMover.lua`.*
