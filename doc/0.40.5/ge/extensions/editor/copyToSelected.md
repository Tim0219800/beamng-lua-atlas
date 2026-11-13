# `editor_copyToSelected`

*Fichier : `lua/ge/extensions/editor/copyToSelected.lua` · VM : Game Engine (GE) · 498 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_copyToSelected` : `extensions.load("editor_copyToSelected")`, puis la globale `editor_copyToSelected`

Outil d'éditeur « Copy To Selected » : choisit un objet de base et une liste d'objets cibles (sélection courante, même classe ou même mesh TSStatic), puis crée une copie de l'objet de base à la position de chaque cible (via editor.saveSimObjectMemento / restoreSimObjectMemento). Options : appliquer la rotation ou l'échelle de la cible, composer les rotations (cible * base), décalage local en mètres dans le repère de la cible, copies rangées dans un nouveau SimGroup « CopiedObjects », sélection des copies créées. L'action passe par editor.history (annulable/rétablissable avec ids forcés).

## Remarques

- Chaque copie est aussi liée à sa cible : son nom est écrit dans le premier champ dynamique libre « child » (index 0..1023) de l'objet cible ; l'annulation restaure l'ancienne valeur de ces champs.
- Décalage local : curseurs X/Y/Z de -50 à +50 m, appliqués selon les axes (colonnes 0, 1, 2) de la transformation de la cible.
- Rotation relative : quaternion cible * base construit à partir des axes avant (+Y) et haut (+Z) via quatFromDir.
- La cible identique à la base est ignorée (skipId). Un aperçu dessine des sphères de 0,25 m cyan aux positions de destination pendant que la fenêtre est ouverte.
- Les copies sont ajoutées au groupe parent de l'objet de base, sinon à MissionGroup ; avec l'option SimGroup, un nouveau groupe est créé dans MissionGroup.
- Le module n'exporte que deux hooks ; la logique est locale.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_copyToSelected.onEditorGui()` | Dessine la fenêtre « Copy To Selected » (objet de base, cibles, options, décalages locaux, bouton « Create Copies », messages d'erreur) et l'aperçu des positions cibles. Appelé à chaque frame par l'éditeur. Après création, émet extensions.hook('onEditorObjectSelectionChanged') si « Select Created » est coché. *(interne)* *(hook)* | 376 |
| `editor_copyToSelected.onEditorInitialized()` | Ajoute l'entrée de menu « Copy To Selected » et enregistre la fenêtre (560x520). Appelé une fois à l'initialisation de l'éditeur. *(interne)* *(hook)* | 491 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectSelectionChanged` — écouté par 8 module(s)

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `debugDrawer:` `drawSphere`
- `obj:` `getDynDataFieldbyName`, `getField`, `getName`, `setDynDataFieldbyName`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/copyToSelected.lua`.*
