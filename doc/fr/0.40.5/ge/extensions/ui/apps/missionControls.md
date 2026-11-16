# `ui_apps_missionControls`

*Fichier : `lua/ge/extensions/ui/apps/missionControls.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_missionControls` : `extensions.load("ui_apps_missionControls")`, puis la globale `ui_apps_missionControls`

Gère la liste des indications de commandes (« control hints ») affichées par l'app d'interface missionControls pendant une mission. Chaque indication est repérée par une catégorie, ce qui permet d'en ajouter ou retirer une sans toucher aux autres (par exemple depuis un nœud flowgraph). La liste triée par order est envoyée à l'interface via l'événement SetMissionControls.

## Exemple

```lua
ui_apps_missionControls.setControl({action='accelerate', label='Accélérer', order=1})
ui_apps_missionControls.setControl({action='accelerate', clear=true})
```

## Remarques

- La catégorie par défaut est args.category, sinon args.action, sinon args.uiEvent ; sans aucune des trois, setControl ne fait rien.
- Dans setControls, si l'indication n'a ni category, ni action, ni uiEvent, l'indice dans la liste sert de clé ; order vaut par défaut l'indice.
- L'extension reste chargée en permanence (déchargement manuel).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_missionControls.clearControls()` | Supprime toutes les indications et envoie SetMissionControlsResetAll à l'interface. | 54 |
| `ui_apps_missionControls.onInit()` | Hook d'initialisation : place l'extension en déchargement manuel. *(interne)* *(hook)* | 6 |
| `ui_apps_missionControls.sendAllData()` | Renvoie la liste courante à l'interface (utile au montage de l'app). | 59 |
| `ui_apps_missionControls.setControl(args)` | Ajoute, met à jour ou supprime (clear=true) une indication, puis renvoie toute la liste à l'interface. | 22 |
| `ui_apps_missionControls.setControls(list)` | Remplace toutes les indications par la liste fournie, puis l'envoie à l'interface. | 40 |

### Détail des paramètres

#### `ui_apps_missionControls.setControl(args)`

Ajoute, met à jour ou supprime (clear=true) une indication, puis renvoie toute la liste à l'interface.

- `args` (*table*) : {category|action|uiEvent, action=string|nil, uiEvent=string|nil, label=string|nil, order=number|nil (0 par défaut), clear=boolean|nil}.

#### `ui_apps_missionControls.setControls(list)`

Remplace toutes les indications par la liste fournie, puis l'envoie à l'interface.

- `list` (*table<integer, table>|nil*) : Indications au même format que setControl.

**Évènements UI (guihooks.trigger) :** `SetMissionControls`, `SetMissionControlsResetAll`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/missionControls.lua`.*
