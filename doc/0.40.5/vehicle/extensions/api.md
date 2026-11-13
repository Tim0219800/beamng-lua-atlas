# `api`

*Fichier : `lua/vehicle/extensions/api.lua` · VM : Véhicule · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `api` : `extensions.load (VM véhicule)("api")`, puis la globale `api`

Extension véhicule qui démarre un petit serveur HTTP/JSON local (utils/httpJsonServer) sur localhost:23512 au chargement de l'extension. Il répond à deux routes : v1/ping et v1/getData (nœuds, poutres et triangles du véhicule, pour un éditeur externe). L'extension est chargée par véhicule ; le serveur est démarré une seule fois dans ce VM.

## Exemple

```lua
-- requête externe : POST/GET http://localhost:23512/v1/ping  ->  {"ok": true}
-- http://localhost:23512/v1/getData -> [nodes, beams, tris]
```

## Remarques

- Format de v1/getData : tableau {nodes, beams, tris}. nodes[k] = {cid, {x, y, z}, nodeWeight} (nœuds sans wheelTreadBeamDeform) ; beams[k] = {cid, {id1, id2}, beamSpring, beamDamp} (poutres sans wheelID) ; tris[k] = {{id1, id2, id3}} (triangles ayant un cid).
- Le port (23512) et l'hôte (localhost) sont codés en dur ; une requête sans uri renvoie nil (erreur HTTP 500).
- Le serveur est traité dans updateGFX (httpJsonServer.update) : il ne répond qu'une fois par frame, et seulement tant que l'extension est chargée.
- onExtensionLoaded écrit un log de niveau erreur ('INIT WEBSERVER TO PORT ...') même en fonctionnement normal.
- jsonRequest (client HTTP POST avec corps data=<json>) est défini mais n'est jamais appelé ni exporté.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `api.onExtensionLoaded()` | Appelé au chargement de l'extension : démarre une fois le serveur HTTP JSON sur localhost:23512 avec le gestionnaire de requêtes interne. *(interne)* *(hook)* | 108 |
| `api.onVehicleLoaded()` | Hook appelé quand le véhicule est chargé ; corps vide (code de débogage commenté). *(interne)* *(hook)* | 125 |
| `api.updateGFX()` | Appelé chaque frame : traite les connexions en attente du serveur HTTP. *(interne)* | 129 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/api.lua`.*
