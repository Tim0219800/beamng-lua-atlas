# `editor_vehicleBridgeTest`

*Fichier : `lua/ge/extensions/editor/vehicleBridgeTest.lua` · VM : Game Engine (GE) · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleBridgeTest` : `extensions.load("editor_vehicleBridgeTest")`, puis la globale `editor_vehicleBridgeTest`

Petite fenêtre de test de `core_vehicleBridge` dans l'éditeur (menu Window > Vehicles > 'Vehicle Bridge Test'). On choisit un véhicule (ID ou liste des BeamNGVehicle), on saisit une clé (par défaut 'ignition') et le bouton 'Get Value!' appelle core_vehicleBridge.requestValue ; la réponse asynchrone s'affiche avec dumps().

## Exemple

```lua
extensions.load("editor_vehicleBridgeTest")
```

## Remarques

- La réponse n'est pas immédiate : le texte 'Waiting for Reply...' reste jusqu'à ce que le callback M.callback reçoive les arguments.
- Le callback est appelé via editor_vehicleBridgeTest.callback(...) (globale), donc l'extension doit être chargée sous ce nom.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleBridgeTest.callback(...)` | Reçoit la réponse de core_vehicleBridge.requestValue et stocke tous ses arguments dans une table affichée dans la fenêtre. | 53 |
| `editor_vehicleBridgeTest.onEditorGui()` | Hook de rendu GUI de l'éditeur : dessine la fenêtre (saisie ID véhicule, combo de véhicules, clé, bouton Get Value!, résultat). *(interne)* *(hook)* | 13 |
| `editor_vehicleBridgeTest.onEditorInitialized()` | Enregistre la fenêtre 'Vehicle Bridge Test' (400x600), ajoute son entrée de menu (groupe Vehicles) et charge l'extension core_vehicleBridge. *(interne)* *(hook)* | 44 |

### Détail des paramètres

#### `editor_vehicleBridgeTest.callback(...)`

Reçoit la réponse de core_vehicleBridge.requestValue et stocke tous ses arguments dans une table affichée dans la fenêtre.

- `...` (*any*) : Valeurs renvoyées par le bridge pour la clé demandée.

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

**Charge les extensions :** `core_vehicleBridge`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleBridgeTest.lua`.*
