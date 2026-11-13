# `core_cameraModes_smoothFree`

*Fichier : `lua/ge/extensions/core/cameraModes/smoothFree.lua` · VM : Game Engine (GE) · 15 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/smoothFree")` (fichier sous extensions/ mais pas une extension classique)

Caméra libre cinématique : construit une caméra du mode free, fixe groupOrder = 20 (après la caméra libre simple) et active le lissage via setSmoothedCam(true). Sert de second membre du groupe de caméras non liées : la touche caméra alterne free <-> smoothFree. Pas de classe propre : le constructeur renvoie un objet « free ».

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/smoothFree.lua`.*
