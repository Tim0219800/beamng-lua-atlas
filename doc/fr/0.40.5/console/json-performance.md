# `json_performance`

*Fichier : `lua/console/json-performance.lua` · VM : Console · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("json-performance")`

Script de benchmark de la console (hors jeu) : il compare la vitesse de décodage JSON, d'encodage/décodage lpack (texte et binaire) et de string.buffer sur tous les fichiers *.jbeam du dossier /vehicles. Il s'exécute dès qu'on le charge, sans exporter de fonction. Utile seulement pour mesurer des performances, pas pour un mod.

## Remarques

- Le script s'exécute entièrement au chargement (require) et affiche les temps et débits en MB/s avec print.
- Il lit les fichiers avec FS:findFiles('/vehicles', '*.jbeam', -1, false, false) puis readFile ; chaque test est répété 6 fois (variable locale reruns).
- Le débit affiché pour le décodage lpack est calculé sur la taille empaquetée (totalPackSize), pas sur la taille JSON d'origine.

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/json-performance.lua`.*
