# `resave_pcs`

*Fichier : `lua/console/resave-pcs.lua` · VM : Console · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("resave-pcs")`

Script utilitaire de la console qui rouvre puis ré-enregistre toutes les configurations de véhicule (*.pc) du dossier vehicles/. Pour chaque véhicule, il fait apparaître l'objet dans le slot 0, charge chaque config avec partmgmt.loadLocal puis la sauve avec partmgmt.saveLocal. ResaveConfigs() est lancée automatiquement à la fin du fichier.

## Remarques

- Les véhicules « common », « box » et « bathtub » sont ignorés (connus pour échouer au spawn d'après le commentaire du code).
- Les commandes loadLocal/saveLocal sont envoyées par be:queueLuaCommand (VM véhicule) ; BeamEngine:update(2, 2) est appelé après chaque config pour les exécuter.
- Le script se lance à l'import : il supprime tous les objets (BeamEngine:deleteAllObjects) à chaque véhicule traité.

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `ResaveConfigs()` | Parcourt tous les dossiers de vehicles/, fait apparaître chaque véhicule, et recharge puis sauvegarde chacune de ses configs .pc. Affiche la progression avec io.write et le nombre total de configs ré-enregistrées. | 43 |

## Appels vers le moteur (C++)

- `BeamEngine:` `deleteAllObjects`, `getSlot`, `spawnObject`, `update`
- `FS:` `closeDirectory`, `fileExists`, `openDirectory`
- `be:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/resave-pcs.lua`.*
