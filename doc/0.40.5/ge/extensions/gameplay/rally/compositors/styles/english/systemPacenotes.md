# `gameplay_rally_compositors_styles_english_systemPacenotes`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/styles/english/systemPacenotes.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/compositors/styles/english/systemPacenotes")` (fichier sous extensions/ mais pas une extension classique)

Notes système en anglais (annonces du copilote qui ne viennent pas des virages) : compte à rebours de départ (five à go), avertissements de temps (60, 30, 15, 10 secondes), vérification de l'intercom et des ceintures, nouvelle minute de départ, faux départ. Le fichier renvoie le résultat de systemPacenotes.localized(...) (module notebook/systemPacenotes) à partir d'une table nom -> texte ou liste de variantes {text, weight}.

## Remarques

- AVERTISSEMENT du fichier : toute modification d'une chaîne impose de régénérer les fichiers audio.
- 'precountdown' a deux variantes pondérées : 'Good luck!' (poids 0,5) et 'Best of luck!' (poids 0,1).
- Noms définis : precountdown, countdown5 à countdown1, countdowngo, warningSeconds60/30/15/10, commsCheck, beltsCheck, rescheduled, falseStart. Ils sont validés par styleValidator via systemPacenotes.validate.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/styles/english/systemPacenotes.lua`.*
