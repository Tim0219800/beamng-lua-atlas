# `ui_gridSelectorUtils_buttonModule`

*Fichier : `lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gridSelectorUtils_buttonModule` : `extensions.load("ui_gridSelectorUtils_buttonModule")`, puis la globale `ui_gridSelectorUtils_buttonModule`

Petit utilitaire des sélecteurs en grille : gère un registre de boutons d'action. Chaque bouton reçoit un identifiant numérique incrémental et un callback ; l'UI renvoie l'identifiant pour déclencher l'action. `create()` renvoie une instance indépendante.

## Exemple

```lua
local bm = ui_gridSelectorUtils_buttonModule.create()
local meta = bm.addButton(function(extra) return 'ok' end, {label = 'Go'})
bm.executeButton(meta.buttonId)
```

## Remarques

- addButton écrit `buttonId` dans la table meta fournie (ou une table créée) et la renvoie.
- executeButton logue une erreur si l'identifiant est inconnu et renvoie nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gridSelectorUtils_buttonModule.create()` | Crée une instance de gestion de boutons avec son propre compteur et sa propre table. | 4 |

### Détail des paramètres

#### `ui_gridSelectorUtils_buttonModule.create()`

Crée une instance de gestion de boutons avec son propre compteur et sa propre table.

- **renvoie** : table Instance avec getFreeButtonId, clearButtonFunctions, addButton, executeButton, getButtonInfo, getAllButtonInfos.

## Classe `instance`

Objet renvoyé par create().

| Méthode | Description | Ligne |
|---|---|---|
| `instance:addButton(callback, meta)` | Enregistre un callback et renvoie sa meta enrichie de `buttonId`. | dyn |
| `instance:clearButtonFunctions()` | Vide la table des boutons (le compteur n'est pas remis à zéro). | dyn |
| `instance:executeButton(buttonId, additionalData)` | Exécute le callback du bouton et renvoie son résultat. | dyn |
| `instance:getAllButtonInfos()` | Renvoie la table complète des boutons indexée par identifiant. | dyn |
| `instance:getButtonInfo(buttonId)` | Renvoie { callback, meta } d'un bouton. | dyn |
| `instance:getFreeButtonId()` | Incrémente le compteur et renvoie un nouvel identifiant. | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua`.*
