# `debug_vehicleDebug`

*Fichier : `lua/ge/extensions/debug/vehicleDebug.lua` · VM : Game Engine (GE) · 82 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `debug_vehicleDebug` : `extensions.load("debug_vehicleDebug")`, puis la globale `debug_vehicleDebug`

Affichage de debug au-dessus de chaque véhicule actif : quand il est activé, onUpdate dessine avec debugDrawer l'id du véhicule, sa position et la rotation (quaternion) de son nœud de référence, au-dessus de sa boîte englobante. Le changement d'état est signalé à l'UI par le guihook vehicleDebugInfoEnabledChanged. L'état est conservé lors d'un rechargement Lua.

## Exemple

```lua
debug_vehicleDebug.setDebugEnabled(true)
```

## Remarques

- Les trois lignes de texte sont dessinées à la même position (textPos) avec drawTextAdvanced : elles peuvent se superposer selon l'implémentation du moteur (déduit du code, aucun décalage vertical n'est appliqué).
- bdebugRequestViewportSize envoie la taille de la fenêtre principale ImGui au module bdebug côté véhicule.

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `debug_vehicleDebug.bdebugRequestViewportSize(vehId)` | Envoie au véhicule la taille de la fenêtre principale (bdebug.receiveViewportSize(largeur, hauteur)). Sans effet si le véhicule n'existe pas. | 30 |
| `debug_vehicleDebug.getDebugEnabled()` | Retourne l'état d'affichage. | 21 |
| `debug_vehicleDebug.onDeserialized(serializedData)` | Hook de rechargement Lua : restaure debugEnabled. *(interne)* *(hook)* | 61 |
| `debug_vehicleDebug.onSerialize()` | Hook de rechargement Lua : retourne {debugEnabled}. *(interne)* *(hook)* | 67 |
| `debug_vehicleDebug.onUpdate(dt)` | Hook de mise à jour : dessine les informations de debug de chaque véhicule actif si l'affichage est activé. *(interne)* *(hook)* | 38 |
| `debug_vehicleDebug.setDebugEnabled(value)` | Active ou désactive l'affichage et notifie l'UI. | 25 |
| `debug_vehicleDebug.toggleDebugEnabled()` | Inverse l'état d'affichage et notifie l'UI (vehicleDebugInfoEnabledChanged). | 16 |

### Détail des paramètres

#### `debug_vehicleDebug.bdebugRequestViewportSize(vehId)`

Envoie au véhicule la taille de la fenêtre principale (bdebug.receiveViewportSize(largeur, hauteur)). Sans effet si le véhicule n'existe pas.

- `vehId` (*integer*) : Id du véhicule.

#### `debug_vehicleDebug.getDebugEnabled()`

Retourne l'état d'affichage.

- **renvoie** : boolean true si activé.

#### `debug_vehicleDebug.onDeserialized(serializedData)`

Hook de rechargement Lua : restaure debugEnabled.

- `serializedData` (*table|nil*) : État retourné par onSerialize.

#### `debug_vehicleDebug.onSerialize()`

Hook de rechargement Lua : retourne {debugEnabled}.

- **renvoie** : table État à conserver.

#### `debug_vehicleDebug.onUpdate(dt)`

Hook de mise à jour : dessine les informations de debug de chaque véhicule actif si l'affichage est activé.

- `dt` (*number*) : Delta temps (s).

#### `debug_vehicleDebug.setDebugEnabled(value)`

Active ou désactive l'affichage et notifie l'UI.

- `value` (*boolean*) : Nouvel état.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'ui_imgui'}. |

**Évènements UI (guihooks.trigger) :** `vehicleDebugInfoEnabledChanged`

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTextAdvanced`
- `ui_imgui.` `GetMainViewport`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/debug/vehicleDebug.lua`.*
