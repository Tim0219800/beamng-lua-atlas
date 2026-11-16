# `powertrain_hydraulicWinch`

*Fichier : `lua/vehicle/powertrain/hydraulicWinch.lua` · VM : Véhicule · 1 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `hydraulicWinch` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Fichier vide (0 octet) dans BeamNG.drive 0.40.5. Il ne définit ni `new`, ni champ, ni fonction. Utiliser un composant `hydraulicWinch` dans le jbeam `powertrain` ferait échouer le chargement du module (require renvoie true au lieu d'une table, donc l'appel de `new` échouerait). Aucun autre fichier Lua du jeu ne référence `hydraulicWinch`.

## Remarques

- Bug / reliquat : fichier présent mais vide. Pour un treuil réel, voir electricWinch (prototype) ou linearActuator, hydraulicCylinder, hydraulicPump.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/hydraulicWinch.lua`.*
