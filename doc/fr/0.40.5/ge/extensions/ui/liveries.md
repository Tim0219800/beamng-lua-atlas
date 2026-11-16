# `ui_liveries`

*Fichier : `lua/ge/extensions/ui/liveries.lua` · VM : Game Engine (GE) · 120 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries` : `extensions.load("ui_liveries")`, puis la globale `ui_liveries`

Orchestrateur de l'éditeur de livrées (peinture/décalcomanies) de l'UI. Il s'appuie sur l'API d'éditeur `editor_api_dynamicDecals` : à l'ouverture il mémorise le skin actuel du véhicule joueur, active le skin `dynamicTextures`, prépare la pile de calques (livrée vierge à la couleur du véhicule ou sauvegarde existante) et démarre la caméra. À la fermeture il restaure le skin d'origine.

## Exemple

```lua
ui_liveries.setup()          -- livrée vierge
ui_liveries.setup('maSauvegarde') -- charge une sauvegarde
-- ...
ui_liveries.teardown()
```

## Remarques

- setup renvoie true sans rien refaire si l'éditeur tourne déjà ; renvoie false si l'API de décalcomanies est absente.
- La valeur renvoyée par setup est le succès du chargement de la pile de calques (false si la sauvegarde n'a pas pu être chargée : une livrée vierge est alors créée quand même).
- Le curseur de décalcomanie live n'est affiché que lorsque l'écran de transformation le demande (setProjectDynamicDecalsState(false) au démarrage).

**Dépendances (chargées avant) :** `editor_api_dynamicDecals`, `ui_liveries_camera`, `ui_liveries_fill`, `ui_liveries_saves`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries.isRunning()` | Indique si l'éditeur de livrées est actif. | 115 |
| `ui_liveries.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque image par le système d'extensions ; appelle api.onUpdate_() tant que l'éditeur tourne. *(interne)* *(hook)* | 107 |
| `ui_liveries.setup(saveName)` | Démarre l'éditeur de livrées sur le véhicule joueur (skin dynamicTextures, calques, historique vidé, caméra). | 60 |
| `ui_liveries.teardown()` | Arrête l'éditeur : caméra, désactivation de l'API, restauration du skin précédent et nettoyage du fill. Sans effet si non démarré. | 90 |

### Détail des paramètres

#### `ui_liveries.isRunning()`

Indique si l'éditeur de livrées est actif.

- **renvoie** : boolean true entre setup et teardown.

#### `ui_liveries.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque image par le système d'extensions ; appelle api.onUpdate_() tant que l'éditeur tourne.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `ui_liveries.setup(saveName)`

Démarre l'éditeur de livrées sur le véhicule joueur (skin dynamicTextures, calques, historique vidé, caméra).

- `saveName` (*string|nil*) : Nom d'une sauvegarde à charger ; nil = livrée vierge à la couleur du véhicule.
- **renvoie** : boolean true si la pile de calques a été initialisée correctement.

#### `ui_liveries.teardown()`

Arrête l'éditeur : caméra, désactivation de l'API, restauration du skin précédent et nettoyage du fill. Sans effet si non démarré.

- **renvoie** : nil 

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | editor_api_dynamicDecals, ui_liveries_camera, ui_liveries_fill, ui_liveries_saves. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries.lua`.*
