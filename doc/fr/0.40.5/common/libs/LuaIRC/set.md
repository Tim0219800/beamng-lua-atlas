# `libs_LuaIRC_set`

*Fichier : `lua/common/libs/LuaIRC/set.lua` · VM : Commun (GE + véhicule) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/LuaIRC/set")`

Partie de la bibliothèque tierce LuaIRC. Module "irc.set" : un ensemble de connexions IRC surveillées ensemble avec socket.select. Permet de gérer plusieurs clients et de ne traiter que ceux qui ont des données à lire.

## Remarques

- Dans set:remove, self.connections est à la fois indexé par socket et par position ; la suppression par position (remove(self.connections, k)) suppose que sockets et connections restent alignés.
- L'objet passé à new peut définir un champ timeout, utilisé par select.

## Classe `set`

Ensemble de connexions IRC.

| Méthode | Description | Ligne |
|---|---|---|
| `set:add(connection)` | Ajoute une connexion (sa socket est ajoutée à la liste surveillée). | 20 |
| `set:poll()` | Comme select, mais en cas de timeout renvoie toutes les connexions (pour qu'elles puissent faire leur travail périodique). | 53 |
| `set:remove(connection)` | Retire une connexion de l'ensemble. | 28 |
| `set:select()` | Appelle socket.select sur les sockets avec self.timeout et renvoie la liste des connexions prêtes à lire. | 40 |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `new(t)` | Transforme la table t en ensemble (champs connections et sockets créés vides, métatable set). | 14 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/LuaIRC/set.lua`.*
