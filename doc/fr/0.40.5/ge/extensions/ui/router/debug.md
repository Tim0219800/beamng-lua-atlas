# `ui_router_debug`

*Fichier : `lua/ge/extensions/ui/router/debug.lua` · VM : Game Engine (GE) · 297 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_debug` : `extensions.load("ui_router_debug")`, puis la globale `ui_router_debug`

Fenêtre ImGui « Router Debugger » pour inspecter le routeur d'interface : route courante, route en attente, fil d'Ariane, champ de saisie pour naviguer vers une route ou revenir en arrière, et arbre des routes enregistrées regroupées par module (préfixe avant le premier point). Outil de développement ; chargé à la demande (la ligne de chargement dans ui_router est commentée).

## Exemple

```lua
extensions.load("ui_router_debug")
ui_router_debug.toggle()
```

## Remarques

- À son chargement, la fenêtre s'ouvre automatiquement sauf si la globale disableHwWarnings est vraie.
- Les tables sont affichées récursivement sauf la clé « children ».
- Le bouton Navigate appelle extensions.ui_router.navigate(nom) puis vide la saisie ; Back appelle extensions.ui_router.back(). Le dernier résultat est affiché.

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_debug.close()` | Ferme la fenêtre de debug. | 282 |
| `ui_router_debug.onExtensionLoaded()` | Hook appelé au chargement : demande l'ouverture automatique de la fenêtre sauf si disableHwWarnings est vrai. *(interne)* *(hook)* | 237 |
| `ui_router_debug.onUpdate()` | Hook appelé à chaque frame : ouvre la fenêtre si demandé, puis dessine « Router Debugger » (taille initiale 450x600) avec route courante, route en attente, fil d'Ariane, actions et modules de routes. *(interne)* *(hook)* | 242 |
| `ui_router_debug.open()` | Ouvre la fenêtre de debug. | 274 |
| `ui_router_debug.toggle()` | Inverse l'état d'ouverture de la fenêtre de debug. | 288 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Dépendance déclarée : ui_imgui (indiquée par la page auto-générée). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/debug.lua`.*
