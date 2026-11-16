# `simtest`

*Fichier : `lua/console/simtest.lua` · VM : Console · 22 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("simtest")`

Script de benchmark de la console : il crée un véhicule pickup avec newVehicle():spawn en (0, 0, 0.1), active BeamEngine.enabled puis mesure, avec HighPerfTimer, le temps de 101 pas de simulation. S'exécute au chargement (test(100)).

## Remarques

- Définit les globales v (le véhicule) et hp (le chronomètre, global car sans local).

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `test(n)` | Exécute n+1 fois BeamEngine:update(1/2000, 1/2000) (pas de 0,5 ms) et affiche la durée de chaque pas en ms. | 11 |

**Globales affectées :** `v`

## Appels vers le moteur (C++)

- `BeamEngine:` `update`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/simtest.lua`.*
