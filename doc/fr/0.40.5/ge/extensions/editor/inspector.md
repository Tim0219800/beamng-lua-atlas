# `editor_inspector`

*Fichier : `lua/ge/extensions/editor/inspector.lua` · VM : Game Engine (GE) · 2309 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_inspector` : `extensions.load("editor_inspector")`, puis la globale `editor_inspector`

Fenêtre Inspector du World Editor : affiche et modifie les champs (statiques, dynamiques, tableaux) de l'objet ou des objets sélectionnés, avec éditeurs spécialisés (peinture métallique de véhicule, UV de billboards GroundCover, couleur/intensité/cookie des lumières, labels de DecalData) et undo/redo via editor.history. Plusieurs instances peuvent coexister, dont des instances verrouillées sur une sélection. Un moddeur s'en sert pour enregistrer des gestionnaires par type de sélection ou des modificateurs de champs.

## Exemple

```lua
editor.registerInspectorTypeHandler("mon_type", function(inspectorInfo) ui_imgui.Text("Mon panneau") end)
-- puis : editor.selection = {}; editor.selection.mon_type = {1}
```

## Remarques

- Le type de sélection par défaut est « object » (gestionnaire objectInspectorGui).
- onEditorGui émet le hook onEditorInspectorHeaderGui(inspectorInfo) en haut de la fenêtre (utilisé par ex. par editor_lightClassConverter).
- Les index d'instances sont des chaînes (clés JSON), pas des nombres.
- Les fonctions editor.* de la classe sont installées par onEditorRegisterApi / onExtensionLoaded (registerApi).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_inspector.onEditorActivated()` | Appelé à l'activation de l'éditeur : réinitialise les tables du valueInspector et le contexte partagé, puis rafraîchit la sélection. *(interne)* *(hook)* | 1590 |
| `editor_inspector.onEditorAfterOpenLevel()` | Appelé après l'ouverture d'un niveau : recharge les listes de datablocks des menus déroulants. *(interne)* *(hook)* | 2292 |
| `editor_inspector.onEditorDeactivated()` | Appelé à la désactivation de l'éditeur. Corps vide. *(interne)* *(hook)* | 1596 |
| `editor_inspector.onEditorGui()` | Dessine chaque fenêtre d'inspecteur à chaque frame (ferme les instances dont la fenêtre n'est plus visible) et traite le rafraîchissement d'éclairage nocturne en attente. *(interne)* *(hook)* | 1484 |
| `editor_inspector.onEditorInitialized()` | Initialise le valueInspector, enregistre le gestionnaire « object », l'entrée de menu Window > Inspector et les éditeurs/labels de champs personnalisés (BeamNGVehicle.metallicPaintData, GroundCover.billboardUVs, DecalData.texRows/texCols, PointLight/SpotLight color, intensity, cookie). *(interne)* *(hook)* | 2234 |
| `editor_inspector.onEditorLoadGuiInstancerState(state)` | Restaure les instances d'inspecteur depuis l'état sauvegardé de l'éditeur. *(interne)* *(hook)* | 1599 |
| `editor_inspector.onEditorObjectSelectionChanged()` | Appelé quand la sélection change : termine un éventuel « pickingLinkTo » ou reconstruit la liste des champs communs aux objets sélectionnés (avec compteur d'usage). *(interne)* *(hook)* | 2262 |
| `editor_inspector.onEditorRegisterApi()` | Définit editor.checkEditorDirtyFlag et editor.requestInspectorScrollToTopOnceForSelection(selectionId). *(interne)* *(hook)* | 2227 |
| `editor_inspector.onEditorSaveGuiInstancerState(state)` | Écrit les instances d'inspecteur dans l'état de l'éditeur (clé « inspectorInstances »). *(interne)* *(hook)* | 1607 |
| `editor_inspector.onExtensionLoaded()` | Appelé au chargement : initialise les groupes repliables et installe l'API editor.* (addInspectorInstance, registerInspectorTypeHandler…). *(interne)* *(hook)* | 1007 |

### Détail des paramètres

#### `editor_inspector.onEditorLoadGuiInstancerState(state)`

Restaure les instances d'inspecteur depuis l'état sauvegardé de l'éditeur.

- `state` (*table*) : État de l'éditeur.

#### `editor_inspector.onEditorSaveGuiInstancerState(state)`

Écrit les instances d'inspecteur dans l'état de l'éditeur (clé « inspectorInstances »).

- `state` (*table*) : État à compléter.

## Classe `editor`

Méthodes ajoutées à la table globale `editor` par ce module.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addInspectorInstance(selection)` | Crée une nouvelle fenêtre d'inspecteur. Avec une sélection, l'instance est verrouillée dessus (contexte propre) ; sans, elle suit la sélection courante. | 132 |
| `editor.checkEditorDirtyFlag()` | Pour chaque objet sélectionné, appelle inspectUpdate() ; si l'objet est modifié (ou isEditorDirty), marque l'éditeur comme modifié (editor.setDirty). Ne fait rien si déjà dirty. | 100 |
| `editor.closeInspectorInstance(idx)` | Ferme une instance d'inspecteur et désenregistre sa fenêtre. | 157 |
| `editor.getInspectorInstances()` | Renvoie les instances d'inspecteur ouvertes. | 163 |
| `editor.getInspectorTypeHandlers()` | Renvoie les gestionnaires enregistrés par type de sélection. | 167 |
| `editor.inspectorHasField(fieldName)` | Indique si l'inspecteur partagé affiche actuellement un champ de ce nom. | 986 |
| `editor.registerInspectorFieldModifier(uniqueName, callback)` | Enregistre un callback de modification de champs, identifié par un nom unique. | 182 |
| `editor.registerInspectorTypeHandler(typeName, guiCallback)` | Enregistre le rendu d'inspecteur d'un type de sélection (clé de editor.selection). | 171 |
| `editor.unregisterInspectorFieldModifier(uniqueName)` | Retire un modificateur de champs. | 188 |
| `editor.unregisterInspectorTypeHandler(typeName)` | Retire un gestionnaire de type. | 178 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorInspectorHeaderGui` — écouté par 8 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `isLinkFile`
- `core_environment.` `refreshnightLightsObjects`
- `obj:` `getClassDocString`, `getClassName`, `getDynDataFieldbyName`, `getGroup`, `getId`, `inspectUpdate`, `isEditorDirty`, `isSubClassOf`
- `scenetree.` `findObject`, `findObjectById`

**Charge les extensions :** `editor_groundCoverEditor`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/inspector.lua`.*
