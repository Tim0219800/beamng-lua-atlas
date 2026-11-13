# `editor_roadArchitect`

*Fichier : `lua/ge/extensions/editor/roadArchitect.lua` · VM : Game Engine (GE) · 8144 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect` : `extensions.load("editor_roadArchitect")`, puis la globale `editor_roadArchitect`

Fenêtre principale de l'éditeur Road Architect du world editor : outil de création de routes, profils, groupes de prefabs, jonctions (dont auto-jonction), terraformage, import/export OpenDRIVE (.xodr) et conversion de DecalRoad en routes Road Architect. Ce fichier est surtout l'interface ImGui et l'orchestration ; la logique est déléguée aux modules editor/roadArchitect/* (roads, profiles, groups, junctions, link, render, terraform, staticMeshMgr, utilities, openDriveImport, openDriveExport). Il ne sert à un moddeur que pour comprendre le cycle de vie (enregistrement du mode d'édition, sérialisation de session) ou en ouvrant l'éditeur.

## Remarques

- Le module n'exporte que 4 hooks (onEditorGui, onEditorInitialized, onSerialize, onDeserialized) ; toute la logique est en variables locales, non accessibles depuis l'extérieur.
- Le mode d'édition enregistré s'appelle editor.editModes.roadArchitectEditMode (nom affiché « Road Architect »).
- onEditorGui ne fait rien tant que le mode n'est pas actif (isRoadArchitectActive).
- La sérialisation (rechargement des extensions/Lua) passe par le fichier temporaire temp/roadArchitect.json ; onSerialize renvoie seulement { d = { name = 'roadArchitectSerializationData' } } et les données réelles sont dans le fichier.
- onSerialize supprime toutes les routes, meshes et decals de la scène (roadMgr.unfinalise si finalisé, puis roadMgr.removeAll) ; onDeserialized reconstruit les données mais lit le fichier sans test d'existence (jsonReadFile(...).data planterait si le fichier manque).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect.onDeserialized()` | Relit temp/roadArchitect.json après un rechargement Lua et reconstruit profils (d'abord), routes, groupes, jonctions et liste des groupes placés ; met à jour les conditions des routes, recalcule les données de rendu et les drapeaux de voies du profil de la route sélectionnée. *(interne)* *(hook)* | 8073 |
| `editor_roadArchitect.onEditorGui()` | Callback de rendu de l'éditeur, appelé à chaque frame par le world editor. Sort immédiatement si Road Architect n'est pas actif ; sinon lit l'état de la souris (position projetée sur la carte, clics gauche/droit, double-clic) et dessine les fenêtres ImGui et les aides visuelles de l'outil. *(interne)* *(hook)* | 7697 |
| `editor_roadArchitect.onEditorInitialized()` | Appelé à l'initialisation du world editor. Enregistre le mode d'édition roadArchitectEditMode (icône autobahn), ajoute l'entrée « Convert to Road Architect » au menu contextuel de l'arbre de scène, enregistre les fenêtres de l'outil (principale, matériaux, meshes, nœuds, profils, groupes, import), récupère le terrain, et vide les routes/jonctions si le niveau a changé depuis la dernière session. *(interne)* *(hook)* | 7947 |
| `editor_roadArchitect.onSerialize()` | Sérialise la session (routes, profils, groupes, jonctions, groupes placés) dans temp/roadArchitect.json avant un rechargement Lua. Ferme d'abord les fenêtres de liste de profils/groupes et de sélection de mesh si ouvertes, puis retire routes, meshes et decals de la scène. *(interne)* *(hook)* | 7993 |

### Détail des paramètres

#### `editor_roadArchitect.onSerialize()`

Sérialise la session (routes, profils, groupes, jonctions, groupes placés) dans temp/roadArchitect.json avant un rechargement Lua. Ferme d'abord les fenêtres de liste de profils/groupes et de sélection de mesh si ouvertes, puis retire routes, meshes et decals de la scène.

- **renvoie** : table { d = { name = 'roadArchitectSerializationData' } } ; les données elles-mêmes sont écrites dans le fichier temporaire.

## Appels vers le moteur (C++)

- `Sim.` `getMaterialSet`
- `be:` `reloadCollision`
- `obj:` `getField`, `getName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect.lua`.*
