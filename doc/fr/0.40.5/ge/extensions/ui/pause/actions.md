# `ui_pause_actions`

*Fichier : `lua/ge/extensions/ui/pause/actions.lua` · VM : Game Engine (GE) · 223 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_actions` : `extensions.load("ui_pause_actions")`, puis la globale `ui_pause_actions`

Registre des actions du menu pause. Il enregistre des boutons (via ui/gridSelectorUtils/buttonModule) exécutables par id, gère l'enchaînement « sauvegarder la carrière puis exécuter un callback », et maintient les onglets et boutons ajoutés par des mods au menu pause. Un mod peut y déclarer un onglet et des boutons ; le module notifie l'UI par le hook GUI PauseModActionsChanged.

## Exemple

```lua
ui_pause_actions.registerModButton({id = "monBouton", tabId = "mods", label = "Mon outil", icon = "wrench", componentName = "MonComposant"})
```

## Remarques

- Si tabId vaut "mods" et que l'onglet n'existe pas, il est créé automatiquement (label ui.dashboard.mods, icône wrench) puis supprimé quand il n'a plus de bouton. Tout autre tabId inconnu donne reason = "unknown_tab".
- getVisibleModTabs ne renvoie que les onglets ayant au moins un bouton ; leur tabId est préfixé par "mod:".
- saveCareerThen : le callback expire après 30 s (une sauvegarde échouée ne déclenche jamais onSaveFinished) ; il est alors ignoré.
- L'extension passe en déchargement manuel (setExtensionUnloadMode manual) à son chargement.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_actions.clearActions()` | Efface tous les boutons enregistrés via registerButton et annule le callback de sauvegarde en attente. Ne touche pas aux onglets/boutons de mods. | 24 |
| `ui_pause_actions.executeAction(buttonId, payload)` | Exécute le bouton enregistré portant cet id. | 42 |
| `ui_pause_actions.getAllButtonInfos()` | Renvoie les infos de tous les boutons enregistrés. | 50 |
| `ui_pause_actions.getVisibleModTabs()` | Renvoie les onglets de mods non vides, au format attendu par buildPauseTabs (tabId "mod:<id>", isModTab, label, icon, buttons, visible, enabled). | 194 |
| `ui_pause_actions.onExtensionLoaded()` | Hook appelé au chargement ; met le mode de déchargement en manuel. *(interne)* *(hook)* | 54 |
| `ui_pause_actions.onSaveFinished()` | Hook appelé quand une sauvegarde de carrière se termine ; exécute le callback en attente de saveCareerThen s'il n'a pas expiré. *(interne)* *(hook)* | 34 |
| `ui_pause_actions.registerButton(metadata, callback)` | Enregistre un bouton d'action et renvoie une copie des métadonnées avec buttonId. Si metadata.visible == false, rien n'est enregistré et les métadonnées sont renvoyées telles quelles. | 46 |
| `ui_pause_actions.registerModButton(button)` | Ajoute ou met à jour un bouton de mod dans un onglet (déplace le bouton si son tabId change) et notifie l'UI. | 133 |
| `ui_pause_actions.registerModTab(tab)` | Crée ou met à jour un onglet de mod (conserve l'ordre des boutons existants) et notifie l'UI. | 102 |
| `ui_pause_actions.saveCareerThen(callback)` | Mémorise un callback puis lance career_saveSystem.saveCurrent(). Le callback est appelé dans onSaveFinished s'il n'a pas plus de 30 s. | 29 |
| `ui_pause_actions.unregisterModButton(id)` | Retire un bouton de mod ; supprime l'onglet "mods" s'il devient vide ; notifie l'UI. | 173 |
| `ui_pause_actions.unregisterModTab(id)` | Supprime un onglet de mod et ses boutons, puis notifie l'UI. | 124 |

### Détail des paramètres

#### `ui_pause_actions.executeAction(buttonId, payload)`

Exécute le bouton enregistré portant cet id.

- `buttonId` (*any*) : Id attribué par registerButton.
- `payload` (*any*) : Données transmises au callback du bouton.
- **renvoie** : any Résultat de buttonInstance.executeButton.

#### `ui_pause_actions.getAllButtonInfos()`

Renvoie les infos de tous les boutons enregistrés.

- **renvoie** : table Résultat de buttonInstance.getAllButtonInfos.

#### `ui_pause_actions.getVisibleModTabs()`

Renvoie les onglets de mods non vides, au format attendu par buildPauseTabs (tabId "mod:<id>", isModTab, label, icon, buttons, visible, enabled).

- **renvoie** : table[] Liste d'onglets.

#### `ui_pause_actions.registerButton(metadata, callback)`

Enregistre un bouton d'action et renvoie une copie des métadonnées avec buttonId. Si metadata.visible == false, rien n'est enregistré et les métadonnées sont renvoyées telles quelles.

- `metadata` (*table|nil*) : Description du bouton (nil devient {}).
- `callback` (*function|nil*) : Fonction appelée à l'exécution ; défaut : fonction renvoyant false.
- **renvoie** : table Copie des métadonnées, avec buttonId si enregistré.

#### `ui_pause_actions.registerModButton(button)`

Ajoute ou met à jour un bouton de mod dans un onglet (déplace le bouton si son tabId change) et notifie l'UI.

- `button` (*table*) : Champs : id et tabId (requis), label, icon, componentName, props, card2ComponentName, card2Props.
- **renvoie** : table {success = true} ou {success = false, reason = "missing_id_or_tab" | "unknown_tab"}.

#### `ui_pause_actions.registerModTab(tab)`

Crée ou met à jour un onglet de mod (conserve l'ordre des boutons existants) et notifie l'UI.

- `tab` (*table*) : Champs : id (requis), label (défaut id), icon, card2ComponentName, card2Props.
- **renvoie** : table {success = true} ou {success = false, reason = "missing_id"}.

#### `ui_pause_actions.saveCareerThen(callback)`

Mémorise un callback puis lance career_saveSystem.saveCurrent(). Le callback est appelé dans onSaveFinished s'il n'a pas plus de 30 s.

- `callback` (*function*) : Fonction sans argument appelée après la sauvegarde.

#### `ui_pause_actions.unregisterModButton(id)`

Retire un bouton de mod ; supprime l'onglet "mods" s'il devient vide ; notifie l'UI.

- `id` (*string*) : Id du bouton.
- **renvoie** : table {success = true} ou {success = false, reason = "not_found"}.

#### `ui_pause_actions.unregisterModTab(id)`

Supprime un onglet de mod et ses boutons, puis notifie l'UI.

- `id` (*string*) : Id de l'onglet.
- **renvoie** : table {success = true} ou {success = false, reason = "not_found"}.

**Évènements UI (guihooks.trigger) :** `PauseModActionsChanged`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/actions.lua`.*
