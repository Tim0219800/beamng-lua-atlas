# `ui_multiseat_assignmentCache`

*Fichier : `lua/ge/extensions/ui/multiseat/assignmentCache.lua` · VM : Game Engine (GE) · 23 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_multiseat_assignmentCache` : `extensions.load("ui_multiseat_assignmentCache")`, puis la globale `ui_multiseat_assignmentCache`

Cache en mémoire des affectations multi-sièges (multiseat). Il garde une copie profonde de la valeur passée à set et en renvoie une copie à get, en journalisant la raison de chaque accès. Son mode de déchargement est « manual », donc le cache survit au déchargement automatique des extensions.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_multiseat_assignmentCache.get(reason)` | Renvoie une copie profonde des affectations mémorisées et journalise la raison. | 16 |
| `ui_multiseat_assignmentCache.onInit()` | Hook d'initialisation de l'extension ; passe le mode de déchargement à « manual » via setExtensionUnloadMode et journalise. *(interne)* *(hook)* | 6 |
| `ui_multiseat_assignmentCache.set(value, reason)` | Remplace les affectations mémorisées par une copie profonde de value et journalise la raison. | 11 |

### Détail des paramètres

#### `ui_multiseat_assignmentCache.get(reason)`

Renvoie une copie profonde des affectations mémorisées et journalise la raison.

- `reason` (*string|nil*) : Raison, utilisée seulement pour le log.
- **renvoie** : any Copie des affectations, nil si rien n'a été défini.

#### `ui_multiseat_assignmentCache.set(value, reason)`

Remplace les affectations mémorisées par une copie profonde de value et journalise la raison.

- `value` (*any*) : Affectations à mémoriser (copiées avec deepcopy).
- `reason` (*string|nil*) : Raison, utilisée seulement pour le log.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/multiseat/assignmentCache.lua`.*
