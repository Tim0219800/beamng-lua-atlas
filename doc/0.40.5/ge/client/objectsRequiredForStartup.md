# `client_objectsRequiredForStartup`

*Fichier : `lua/ge/client/objectsRequiredForStartup.lua` · VM : Game Engine (GE) · 528 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/objectsRequiredForStartup")`

Crée, à l'import, les objets GUI de base nécessaires au démarrage : le curseur « DefaultCursor » (GuiCursor, point chaud (4,4) sous macOS, (1,1) ailleurs) et les GuiControlProfile du moteur Torque, par exemple GuiDefaultProfile, GuiSolidDefaultProfile, GuiTransparentProfile, GuiToolTipProfile, GuiWindowProfile, GuiTextProfile (et variantes Right, AutoSize, Medium, Big, ML, Array), GuiTextEditProfile, GuiButtonProfile, GuiCheckBoxProfile, GuiScrollProfile, GuiSliderProfile, GuiPopUpMenuProfile, GuiTabBookProfile, GuiConsoleProfile, GuiRadioProfile, GuiMonospace et GuiCEFProfile. Un profil définit couleurs, police (Arial 14 par défaut), bitmap et bordures des contrôles GUI. Aucune fonction exportée.

## Remarques

- GuiDefaultProfile est créé sans test d'existence, comme DefaultCursor et GuiToolTipProfile, GuiModelessDialogProfile, GuiFrameSetProfile, GuiWindowProfile et la plupart des profils de texte ; seuls quelques profils (GuiSolidDefaultProfile, GuiTransparentProfile, GuiGroupBorderProfile, GuiTabBorderProfile) sont protégés par scenetree.findObject.
- Les profils de catégorie « Core » portent category = "Core".
- Incohérence probable : la dernière variable du fichier, nommée guiMonospace (police rouge ColorI(255,0,6), tab et canKeyFocus vrais), est enregistrée sous le nom « GuiCEFProfile » en plus du profil « GuiMonospace » créé plus haut.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/objectsRequiredForStartup.lua`.*
