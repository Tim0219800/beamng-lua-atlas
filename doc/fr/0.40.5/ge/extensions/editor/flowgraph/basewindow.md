# `editor_flowgraph_basewindow`

*Fichier : `lua/ge/extensions/editor/flowgraph/basewindow.lua` · VM : Game Engine (GE) · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_flowgraph_basewindow` : `extensions.load("editor_flowgraph_basewindow")`, puis la globale `editor_flowgraph_basewindow`

Classe de base des fenêtres de l'éditeur Flowgraph (legend, history, events, garbageDebug, examples, execution, main…). Elle encapsule Begin/End d'une fenêtre éditeur (editor.beginWindow avec self.windowName), le suivi du focus (hasFocus) et ouverture/fermeture/bascule. use(fgEditor, derivedClass) crée une instance de base et y copie les champs de la classe dérivée.

## Remarques

- windowName doit être défini par la classe dérivée avant Begin/open/close/toggle.
- use() ne rappelle init() que si la classe dérivée en redéfinit un ; l'init de base prend fgEditor, celui de la dérivée est appelé sans argument.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_flowgraph_basewindow.createBase(...)` | Crée une instance de la classe de base et appelle init(...). | 65 |
| `editor_flowgraph_basewindow.use(fgEditor, derivedClass)` | Crée une instance de base pour fgEditor puis copie tous les champs de derivedClass dessus (surcharges) ; appelle l'init de la dérivée s'il diffère de celui de base. | 73 |

### Détail des paramètres

#### `editor_flowgraph_basewindow.createBase(...)`

Crée une instance de la classe de base et appelle init(...).

- `...` (*any*) : Arguments passés à init (fgEditor).
- **renvoie** : table Instance.

#### `editor_flowgraph_basewindow.use(fgEditor, derivedClass)`

Crée une instance de base pour fgEditor puis copie tous les champs de derivedClass dessus (surcharges) ; appelle l'init de la dérivée s'il diffère de celui de base.

- `fgEditor` (*table*) : Éditeur Flowgraph propriétaire.
- `derivedClass` (*table*) : Classe de la fenêtre (windowName, draw, init…).
- **renvoie** : table Instance de fenêtre.

## Classe `C`

Classe de base d'une fenêtre Flowgraph.

| Méthode | Description | Ligne |
|---|---|---|
| `C:Begin(name, flags)` | Ouvre la fenêtre éditeur self.windowName avec le titre donné. | 15 |
| `C:End()` | Met à jour hasFocus (focus des fenêtres enfants) puis ferme la fenêtre éditeur. | 19 |
| `C:__onDeserialized(data)` | Appelle _onDeserialized puis remet hasFocus à false. | 58 |
| `C:__onSerialize()` | Crée une table, appelle _onSerialize et la renvoie. | 49 |
| `C:_onDeserialized(data)` | Point d'extension de désérialisation, vide par défaut. | 55 |
| `C:_onSerialize(res)` | Point d'extension de sérialisation, vide par défaut. | 46 |
| `C:attach(mgr)` | Associe le gestionnaire de projet flowgraph (self.mgr). | 24 |
| `C:close()` | Cache la fenêtre et remet hasFocus à false. | 33 |
| `C:init(fgEditor)` | Mémorise fgEditor et initialise hasFocus à false. | 10 |
| `C:open()` | Affiche la fenêtre. | 28 |
| `C:toggle()` | Bascule la visibilité de la fenêtre. | 38 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/basewindow.lua`.*
