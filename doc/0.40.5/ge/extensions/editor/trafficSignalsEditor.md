# `editor_trafficSignalsEditor`

*Fichier : `lua/ge/extensions/editor/trafficSignalsEditor.lua` · VM : Game Engine (GE) · 1926 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_trafficSignalsEditor` : `extensions.load("editor_trafficSignalsEditor")`, puis la globale `editor_trafficSignalsEditor`

Éditeur de feux de signalisation (fenêtre « Traffic Signals Editor », menu Window > Gameplay, mode d'édition signalsEditMode). Permet de créer et placer des signaux (instances), des contrôleurs et des séquences de phases, d'éditer les définitions de contrôleur, de simuler les feux dans le niveau puis d'enregistrer le tout dans signals.json du niveau (editor.levelPath). Travaille sur les données de core_trafficSignals (newSignal, newController, newSequence, setupSignals, loadSignals). Maj + clic gauche crée un signal, clic gauche sélectionne.

## Exemple

```lua
local data = editor_trafficSignalsEditor.getCurrentSignals() -- {instances, controllers, sequences}
editor_trafficSignalsEditor.saveFile() -- écrit <niveau>/signals.json
```

## Remarques

- loadFile et saveFile utilisent par défaut editor.levelPath..'signals.json' ; le menu File ne gère que ce fichier par défaut.
- loadFile : si les données contiennent la clé obsolète 'intersections', elles sont refusées (avertissement « Obsolete signals data! ») et l'éditeur est vidé via setCurrentSignals({}).
- La simulation (fonction locale simulate) force les séquences en mode test, appelle map.reset() pour mettre à jour les signaux de mapmgr (solution « temporaire » selon le code) et repasse trafficSignals.debugLevel à 0 à l'arrêt, avec rechargement des signaux d'origine du niveau.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_trafficSignalsEditor.getCurrentElements()` | Renvoie la table des éléments de l'éditeur (signaux, contrôleurs, séquences) indexée par id. | 257 |
| `editor_trafficSignalsEditor.getCurrentSignals()` | Renvoie les données de signaux en cours d'édition (tables vivantes, non copiées). | 261 |
| `editor_trafficSignalsEditor.loadFile(fileName)` | Charge un fichier de signaux JSON et l'applique avec setCurrentSignals (format obsolète rejeté). | 295 |
| `editor_trafficSignalsEditor.onClientEndMission()` | Hook de fin de mission : force une ré-initialisation des tables à la prochaine ouverture. *(interne)* *(hook)* | 1879 |
| `editor_trafficSignalsEditor.onDeserialized(data)` | Après rechargement Lua : restaure les options et réapplique les signaux avec setCurrentSignals. *(interne)* *(hook)* | 1888 |
| `editor_trafficSignalsEditor.onEditorGui(dt)` | Hook de frame de l'éditeur : dessine la fenêtre (menu File Load/Save/Clear, listes et propriétés des signaux, contrôleurs, séquences) et le rendu de debug des signaux. Initialise les tables au premier appel. *(interne)* *(hook)* | 1735 |
| `editor_trafficSignalsEditor.onEditorInitialized()` | Hook d'initialisation de l'éditeur : enregistre la fenêtre (540x600), le mode d'édition signalsEditMode avec ses raccourcis et l'entrée de menu dans le groupe Gameplay. *(interne)* *(hook)* | 1900 |
| `editor_trafficSignalsEditor.onSerialize()` | Avant rechargement Lua : renvoie {options, signals} (signaux sérialisés). *(interne)* *(hook)* | 1883 |
| `editor_trafficSignalsEditor.onWindowMenuItem()` | Hook du menu : initialise les tables si besoin, vide la sélection d'objets et affiche la fenêtre. *(interne)* *(hook)* | 1894 |
| `editor_trafficSignalsEditor.saveFile(fileName)` | Écrit les signaux sérialisés dans un fichier JSON (jsonWriteFile) et affiche « Signals saved! » 3 s. | 308 |
| `editor_trafficSignalsEditor.setCurrentSignals(data)` | Remplace les données de l'éditeur : réinitialise, recrée instances (pos/dir convertis en vec3), contrôleurs et séquences via core_trafficSignals, puis resélectionne les éléments courants. Sans argument, utilise les signaux du niveau (core_trafficSignals.getData()). | 265 |

### Détail des paramètres

#### `editor_trafficSignalsEditor.getCurrentElements()`

Renvoie la table des éléments de l'éditeur (signaux, contrôleurs, séquences) indexée par id.

- **renvoie** : table<integer|string, table> Éléments par id.

#### `editor_trafficSignalsEditor.getCurrentSignals()`

Renvoie les données de signaux en cours d'édition (tables vivantes, non copiées).

- **renvoie** : table {instances, controllers, sequences}.

#### `editor_trafficSignalsEditor.loadFile(fileName)`

Charge un fichier de signaux JSON et l'applique avec setCurrentSignals (format obsolète rejeté).

- `fileName` (*string|nil*) : Chemin du fichier, défaut <niveau>/signals.json.

#### `editor_trafficSignalsEditor.onDeserialized(data)`

Après rechargement Lua : restaure les options et réapplique les signaux avec setCurrentSignals.

- `data` (*table*) : Valeur renvoyée par onSerialize.

#### `editor_trafficSignalsEditor.onEditorGui(dt)`

Hook de frame de l'éditeur : dessine la fenêtre (menu File Load/Save/Clear, listes et propriétés des signaux, contrôleurs, séquences) et le rendu de debug des signaux. Initialise les tables au premier appel.

- `dt` (*number*) : Delta de temps.

#### `editor_trafficSignalsEditor.onSerialize()`

Avant rechargement Lua : renvoie {options, signals} (signaux sérialisés).

- **renvoie** : table {options, signals}.

#### `editor_trafficSignalsEditor.saveFile(fileName)`

Écrit les signaux sérialisés dans un fichier JSON (jsonWriteFile) et affiche « Signals saved! » 3 s.

- `fileName` (*string|nil*) : Chemin du fichier, défaut <niveau>/signals.json.

#### `editor_trafficSignalsEditor.setCurrentSignals(data)`

Remplace les données de l'éditeur : réinitialise, recrée instances (pos/dir convertis en vec3), contrôleurs et séquences via core_trafficSignals, puis resélectionne les éléments courants. Sans argument, utilise les signaux du niveau (core_trafficSignals.getData()).

- `data` (*table|nil*) : {instances, controllers, sequences} ; champs manquants traités comme vides.

## Appels vers le moteur (C++)

- `be:` `getEnabled`
- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getId`, `getInternalName`, `getPosition`, `getTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/trafficSignalsEditor.lua`.*
