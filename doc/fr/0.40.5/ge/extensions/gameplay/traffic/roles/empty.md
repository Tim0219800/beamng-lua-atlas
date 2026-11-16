# `gameplay_traffic_roles_empty`

*Fichier : `lua/ge/extensions/gameplay/traffic/roles/empty.lua` · VM : Game Engine (GE) · 17 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/traffic/roles/empty")` (fichier sous extensions/ mais pas une extension classique)

Rôle de trafic minimal (« empty »). Il hérite de baseRole mais vide la table d'actions : aucune action supplémentaire ni IA spécifique n'est appliquée au véhicule. Utile pour un véhicule de trafic qu'on veut laisser totalement passif.

## Remarques

- Le module renvoie un constructeur : require('/lua/ge/extensions/gameplay/traffic/baseRole')(C, ...) enveloppe la classe C.
- init copie les baseActions de baseRole dans self.actions puis met self.baseActions à nil.

## Classe `C`

Classe du rôle, complétée par baseRole.

Le module renvoie un constructeur : `local obj = require("gameplay_traffic_roles_empty")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Appelé à la création du rôle. Copie les actions de base (self.baseActions) dans self.actions, puis supprime self.baseActions ; aucune action propre au rôle n'est ajoutée. | 9 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/roles/empty.lua`.*
