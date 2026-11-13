# `editor_groundCoverEditor`

*Fichier : `lua/ge/extensions/editor/groundCoverEditor.lua` · VM : Game Engine (GE) · 1978 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_groundCoverEditor` : `extensions.load("editor_groundCoverEditor")`, puis la globale `editor_groundCoverEditor`

Éditeur de GroundCover (herbe, cailloux, billboards répartis sur le terrain) de l'éditeur de monde. Fenêtre « Ground Cover Editor » en deux colonnes : liste des objets GroundCover à gauche, détails à droite (types jusqu'à 8, champs d'objet comme reflectScale/maxBillboardTiltAngle/shapesCastShadows, paramètres de vent windDirection/windGust*/windTurbulence*, panneau de validation). Les modifications passent par setField/postApply et l'historique d'actions de l'éditeur. Charge l'extension editor_inspector.

## Remarques

- Limites codées en dur : 8 types par GroundCover (maxTypes) et 10922 billboards par cellule (maxBillboardsPerCell).
- Le mode d'édition « Ground Cover Editor » n'a qu'un raccourci auxiliaire : clic gauche = Select.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_groundCoverEditor.onEditorGui()` | Hook appelé chaque frame par l'éditeur : dessine la fenêtre (tableau à deux colonnes : liste d'objets et détails ; repli en affichage simple si le tableau ne peut pas être ouvert). *(interne)* *(hook)* | 1914 |
| `editor_groundCoverEditor.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (920x720), le mode d'édition groundCoverEditMode et l'entrée de menu « Ground Cover Editor » (groupe Terrain). *(interne)* *(hook)* | 1960 |
| `editor_groundCoverEditor.onEditorObjectSelectionChanged()` | Hook appelé quand la sélection d'objets de l'éditeur change : retient le premier GroundCover sélectionné et invalide le cache de validation. *(interne)* *(hook)* | 1952 |
| `editor_groundCoverEditor.show()` | Affiche la fenêtre de l'éditeur de GroundCover et active son mode d'édition. Utilisable par script ou par un autre outil. | 1943 |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `obj:` `getClassName`, `getField`, `getID`, `getId`, `getName`, `postApply`, `registerObject`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

**Charge les extensions :** `editor_inspector`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/groundCoverEditor.lua`.*
