# `test_dyncol`

*Fichier : `lua/console/test_dyncol.lua` · VM : Console · 26 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("test_dyncol")`

Script de test de la console pour les collisions dynamiques : supprime tous les objets, fait apparaître un pickup en (0, 0, 0.1) puis lance test(5000), soit 5001 pas de BeamEngine:update(1/2000, 1/2000). Les spawns supplémentaires (hatch, second pickup) sont commentés.

## Remarques

- Définit la globale v. Le chronométrage dans test() est commenté (et contient une faute : hp:stop().-" ms").

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `test(n)` | Exécute n+1 pas de simulation de 0,5 ms (BeamEngine:update(1/2000, 1/2000)). | 15 |

**Globales affectées :** `v`

## Appels vers le moteur (C++)

- `BeamEngine:` `deleteAllObjects`, `update`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/test_dyncol.lua`.*
