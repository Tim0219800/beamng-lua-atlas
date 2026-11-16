# `outgauge`

*Fichier : `lua/vehicle/extensions/outgauge.lua` · VM : Véhicule · 7 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `outgauge` : `extensions.load (VM véhicule)("outgauge")`, puis la globale `outgauge`

Fichier obsolète : il se contente d'écrire une erreur dans le log (avec la trace d'appel) disant que quelque chose a tenté d'utiliser l'ancienne extension outgauge, et renvoie une table vide. Le protocole OutGauge est géré ailleurs (voir https://go.beamng.com/protocols et le module protocols).

## Remarques

- Le module renvoie {} : toute fonction appelée dessus sera nil.
- L'erreur de log se produit au chargement du fichier (require/extensions.load).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/outgauge.lua`.*
