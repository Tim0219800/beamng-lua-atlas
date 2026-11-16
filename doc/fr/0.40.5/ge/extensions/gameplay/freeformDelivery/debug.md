# `gameplay_freeformDelivery_debug`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/debug.lua` · VM : Game Engine (GE) · 671 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_debug` : `extensions.load("gameplay_freeformDelivery_debug")`, puis la globale `gameplay_freeformDelivery_debug`

Fenêtre imgui de debug « Freeform Delivery Debug » du mode de livraison libre. Quand elle est activée (setEnableDebugWindow(true)), elle collecte chaque frame l'état de la livraison courante et affiche des sections : état de la livraison, état du setup, attelages, véhicules, objectifs, zones cibles, itinéraires, places de parking et mise en veille des véhicules. Utile à un moddeur pour déboguer un fichier delivery.json.

## Exemple

```lua
gameplay_freeformDelivery_debug.setEnableDebugWindow(true)
```

## Remarques

- La fenêtre est contrôlée uniquement par enableDebugWindow (setEnableDebugWindow / getEnableDebugWindow). toggleDebugWindow ne modifie que debugWindowOpen, une variable jamais lue : l'appeler (comme le fait gameplay_freeformDelivery_freeformDelivery.load) n'ouvre donc rien.
- Quand le debug est désactivé, les données collectées sont vidées. Sans livraison chargée, la fenêtre affiche « No delivery loaded ».
- La collecte et le dessin se font dans onPreRender, pas dans onUpdate.

**Dépendances (chargées avant) :** `ui_imgui`, `gameplay_freeformDelivery_utils`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_debug.clearDebugData()` | Vide les données de debug collectées. | 663 |
| `gameplay_freeformDelivery_debug.getEnableDebugWindow()` | Indique si la fenêtre de debug est activée. | 654 |
| `gameplay_freeformDelivery_debug.onPreRender(dtReal, dtSim, dtRaw)` | Hook appelé avant le rendu de chaque frame : si la fenêtre est activée, met à jour les données de debug depuis gameplay_freeformDelivery_freeformDelivery puis dessine la fenêtre. *(interne)* *(hook)* | 638 |
| `gameplay_freeformDelivery_debug.setEnableDebugWindow(enabled)` | Active ou désactive l'affichage de la fenêtre de debug. La désactivation vide les données collectées. | 645 |
| `gameplay_freeformDelivery_debug.toggleDebugWindow()` | Inverse debugWindowOpen et logge le nouvel état ; sans effet visible (voir notes). | 658 |

### Détail des paramètres

#### `gameplay_freeformDelivery_debug.getEnableDebugWindow()`

Indique si la fenêtre de debug est activée.

- **renvoie** : boolean true si activée.

#### `gameplay_freeformDelivery_debug.onPreRender(dtReal, dtSim, dtRaw)`

Hook appelé avant le rendu de chaque frame : si la fenêtre est activée, met à jour les données de debug depuis gameplay_freeformDelivery_freeformDelivery puis dessine la fenêtre.

- `dtReal` (*number*) : Delta temps réel (inutilisé).
- `dtSim` (*number*) : Delta temps simulé (inutilisé).
- `dtRaw` (*number*) : Delta temps brut (inutilisé).

#### `gameplay_freeformDelivery_debug.setEnableDebugWindow(enabled)`

Active ou désactive l'affichage de la fenêtre de debug. La désactivation vide les données collectées.

- `enabled` (*boolean*) : true pour afficher la fenêtre.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | ui_imgui et gameplay_freeformDelivery_utils. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/debug.lua`.*
