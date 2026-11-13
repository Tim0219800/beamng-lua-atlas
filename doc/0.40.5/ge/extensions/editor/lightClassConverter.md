# `editor_lightClassConverter`

*Fichier : `lua/ge/extensions/editor/lightClassConverter.lua` · VM : Game Engine (GE) · 249 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_lightClassConverter` : `extensions.load("editor_lightClassConverter")`, puis la globale `editor_lightClassConverter`

Ajoute un bouton « Convert To Spot Light / Point Light » en haut de l'inspecteur quand la sélection ne contient que des PointLight ou que des SpotLight. La conversion remplace l'objet sur place en gardant l'id SimObject, le nom, le groupe parent, la transformation et les champs communs ; c'est une seule étape d'undo réversible (restauration par la sérialisation d'origine).

## Remarques

- Le bouton n'apparaît pas si la sélection est mixte ou contient un autre type ; si un objet est verrouillé (isLocked), un message jaune remplace le bouton.
- Rayon : « radius » (PointLight) et « range » (SpotLight) sont mappés explicitement, sinon la lumière reprend la valeur par défaut et perd ses ombres.
- intensity et brightness ne sont pas copiés bruts (unités différentes : lumens/candelas) ; brightness est réappliqué en dernier pour éviter une dérive à chaque conversion.
- Émet le hook onEditorObjectAdded(id) après chaque conversion ou undo.

**Dépendances (chargées avant) :** `editor_inspector`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_lightClassConverter.onEditorInspectorHeaderGui(inspectorInfo)` | Dessine le bouton de conversion en haut de la fenêtre d'inspecteur (hook émis par editor_inspector). Utilise la sélection verrouillée de l'instance si elle existe, sinon editor.selection.object. *(interne)* *(hook)* | 195 |

### Détail des paramètres

#### `editor_lightClassConverter.onEditorInspectorHeaderGui(inspectorInfo)`

Dessine le bouton de conversion en haut de la fenêtre d'inspecteur (hook émis par editor_inspector). Utilise la sélection verrouillée de l'instance si elle existe, sinon editor.selection.object.

- `inspectorInfo` (*table|nil*) : Instance d'inspecteur ; son champ selection.object est utilisé s'il existe.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {"editor_inspector"} : chargé après l'inspecteur pour disposer du hook de header et des API. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectAdded` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `Sim.` `deserializeObjectsFromText`
- `obj:` `getClassName`, `getGroup`, `getName`, `isLocked`, `serialize`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/lightClassConverter.lua`.*
