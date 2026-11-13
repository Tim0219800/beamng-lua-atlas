# `ui_router_managers_guardManager`

*Fichier : `lua/ge/extensions/ui/router/managers/guardManager.lua` · VM : Game Engine (GE) · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_managers_guardManager` : `extensions.load("ui_router_managers_guardManager")`, puis la globale `ui_router_managers_guardManager`

Registre des gardes de navigation du routeur. reloadGuards parcourt le dossier lua/ge/extensions/ui/router/guards/, charge chaque fichier et enregistre les fonctions de sa table M.guards sous leur clé. Les routes référencent ces clés dans leurs listes de gardes (enterGuards, exitGuards) ; executeGuards les exécute dans l'ordre. Un moddeur peut ajouter ses propres gardes avec addGuard.

## Exemple

```lua
extensions.ui_router_managers_guardManager.addGuard("monGarde", function(route, params, context)
  return true -- false bloque la navigation
end)
```

## Remarques

- Une garde est appelée avec (route, params, context) ; seule la valeur exacte false bloque (result.failedGuard = clé de la garde) : un retour nil laisse passer. Les clés de garde inconnues sont ignorées avec un avertissement.
- addGuard n'écrase pas une clé existante (avertissement) ; updateGuard exige qu'elle existe.
- Les gardes sont chargées avec require("ge/extensions/ui/router/guards/<fichier>") après FS:findFiles("/lua/ge/extensions/ui/router/guards/", "*.lua") : un fichier de ce dossier sans table M.guards est chargé mais ne fournit rien (cas de guards/default.lua).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_managers_guardManager.addGuard(key, fn)` | Ajoute une garde sous la clé donnée ; ne fait rien (avertissement) si la clé existe déjà. | 26 |
| `ui_router_managers_guardManager.executeGuards(specifiedGuards, route, params, context)` | Exécute dans l'ordre les gardes listées ; s'arrête à la première qui renvoie false. | 46 |
| `ui_router_managers_guardManager.reloadGuards()` | Vide le registre puis recharge toutes les gardes des fichiers du dossier guards/. Appelée au chargement de ui_router. | 9 |
| `ui_router_managers_guardManager.removeGuard(key)` | Supprime la garde de clé donnée. | 42 |
| `ui_router_managers_guardManager.updateGuard(key, fn)` | Remplace une garde existante ; ne fait rien (avertissement) si la clé est inconnue. | 34 |

### Détail des paramètres

#### `ui_router_managers_guardManager.addGuard(key, fn)`

Ajoute une garde sous la clé donnée ; ne fait rien (avertissement) si la clé existe déjà.

- `key` (*string*) : Clé de la garde.
- `fn` (*function*) : Fonction (route, params, context) -> boolean.

#### `ui_router_managers_guardManager.executeGuards(specifiedGuards, route, params, context)`

Exécute dans l'ordre les gardes listées ; s'arrête à la première qui renvoie false.

- `specifiedGuards` (*string[]*) : Clés de gardes à exécuter.
- `route` (*table*) : Route visée (ou de la route courante pour les gardes de sortie).
- `params` (*table|nil*) : Paramètres de route.
- `context` (*table|nil*) : Contexte (par exemple {routeName, options} pour les gardes de sortie).
- **renvoie** : table {result = valeur de la dernière garde exécutée (true par défaut), failedGuard = clé de la garde bloquante}.

#### `ui_router_managers_guardManager.removeGuard(key)`

Supprime la garde de clé donnée.

- `key` (*string*) : Clé de la garde.

#### `ui_router_managers_guardManager.updateGuard(key, fn)`

Remplace une garde existante ; ne fait rien (avertissement) si la clé est inconnue.

- `key` (*string*) : Clé de la garde.
- `fn` (*function*) : Nouvelle fonction.

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/managers/guardManager.lua`.*
