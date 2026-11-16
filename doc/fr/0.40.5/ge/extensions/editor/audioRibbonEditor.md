# `editor_audioRibbonEditor`

*Fichier : `lua/ge/extensions/editor/audioRibbonEditor.lua` · VM : Game Engine (GE) · 969 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_audioRibbonEditor` : `extensions.load("editor_audioRibbonEditor")`, puis la globale `editor_audioRibbonEditor`

Mode d'édition « Audio Ribbon Editor » de l'éditeur de niveaux : crée et modifie des « rubans » sonores (rivières, etc.) stockés dans le module runtime core/audioRibbon. Un ruban est une polyligne de noeuds avec profondeur et vitesse ; il porte soit un émetteur unique (« Single Emitter Only »), soit quatre émetteurs (avant, arrière, gauche, droite) sur la surface du dessus, du dessous ou tout le volume. Les événements par défaut sont 'event:>Ambient>Water>River'. L'outil gère l'ajout de rubans, le déplacement de noeuds au gizmo, l'ajustement à la surface sous-jacente (terrain, rivière, plan d'eau), l'annulation/rétablissement via editor.history et une caméra panoramique.

## Remarques

- Dépend de core/audioRibbon et des utilitaires editor/toolUtilities/(ribbonInput, render/transport, util, style, panCamera).
- Vitesse par défaut 1.0 (plage 0 à 10), profondeur par défaut 10.0, lancer de rayon jusqu'à 10000 m.
- onActivate et onDeactivate sont locales et ne sont pas exportées ; elles sont branchées via editor.editModes.audioRibbonEditMode.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_audioRibbonEditor.onEditorGui()` | Appelé chaque frame de l'éditeur : si le mode est actif, dessine la fenêtre d'outil, affiche les rubans, traite l'édition (sélection, glissement de noeuds, gizmo) et pilote la caméra panoramique. *(interne)* *(hook)* | 900 |
| `editor_audioRibbonEditor.onEditorInitialized()` | Enregistre le mode d'édition audioRibbonEditMode (icône simobject_sfxspace) et la fenêtre « audioRibbonEditor » (500x500). *(interne)* *(hook)* | 948 |
| `editor_audioRibbonEditor.onInit()` | Initialisation : si core/audioRibbon n'a pas encore de liste de rubans, la crée vide et vide les noms de rubans et les listes proches/lointaines. *(interne)* *(hook)* | 325 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/audioRibbonEditor.lua`.*
