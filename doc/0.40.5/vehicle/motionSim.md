# `motionSim`

*Fichier : `lua/vehicle/motionSim.lua` · VM : Véhicule · 8 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("motionSim")`

Fichier obsolète conservé pour compatibilité : le require('motionSim') ne fait que loguer une erreur (renvoie vers https://go.beamng.com/protocols, le système de protocoles de télémétrie/simulateur de mouvement), affiche une trace de la pile (debug.tracesimple) pour retrouver le code fautif, et renvoie une table vide.

## Remarques

- Aucune fonction ni champ : tout accès à une fonction de ce module donnera nil. Utiliser le système de protocoles (module `protocols`) à la place.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/motionSim.lua`.*
