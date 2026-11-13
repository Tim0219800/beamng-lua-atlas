# `gameplay_rally_tools_loopToolbox`

*Fichier : `lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua` · VM : Game Engine (GE) · 1129 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/tools/loopToolbox")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre imgui de debug « Rally Loop Debug » (Loop Toolbox) pour la boucle de rallye, ouverte par gameplay_rallyLoop.toggleDebug(). Elle permet de choisir une mission `rallyLoop` du niveau courant, de la charger ou décharger (gameplay_rallyLoop.setup/unload), de sauter le compte à rebours ou la liaison (Skip), d'avancer ou reculer l'horloge de ±10 s et ±1 min, de mettre l'horloge en pause, et affiche validation, données de proximité, indices de mission, distances, durées, pénalités et planning. Les options de dessin (route, étiquettes, z au premier plan, panneaux, infos de debug) sont sauvegardées dans `/settings/rally/loopToolbox.json`. Le module renvoie un constructeur : `require(...)()`.

## Remarques

- Le bouton Skip n'est actif que si manager:canSkip() ; il émet le hook onGameplayInteract.
- Les cases « Vehicle BB » et « Leading Point » sont commentées dans l'interface, mais les champs drawVehBB et drawLeadingPoint sont toujours sauvegardés.
- Les panneaux de rallye (signboards) sont des objets de la scène dont la shapeName contient `s_rally_signboard_` ; findSignboards les repère et drawSignboardsDebug écrit leur nom au-dessus.

## Classe `C`

Fenêtre d'outils de la boucle de rallye. Champs principaux : missionDropdownItems, selectedMissionIndex, selectedMissionId, selectedMissionDir, drawRoute, drawLabels, drawZOnTop, drawSignboards, drawVehBB, drawLeadingPoint, showDebugInfo (BoolPtr imgui), signboards, syncedManager.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_tools_loopToolbox")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:applyManagerDrawFlags(manager)` | Transmet l'option showDebugInfo au manager de boucle (setDrawFlag) et retient ce manager comme synchronisé. | 102 |
| `C:draw(manager)` | Dessine tout le contenu de la fenêtre (à appeler entre im.Begin et im.End). | 384 |
| `C:drawDebug()` | Dessin 3D de debug : délègue à gameplay_rallyLoop.drawDebug avec les options zOnTop, route et étiquettes. | 1076 |
| `C:drawSignboardsDebug()` | Dessine le nom court de chaque panneau trouvé au-dessus de sa position (debugDrawer:drawTextAdvanced). | 1081 |
| `C:drawValidation(manager)` | Affiche les problèmes de validation du planning (bloquants en rouge, autres en orange) ou « Validation: OK ». | 356 |
| `C:findSignboards()` | Cherche dans la scène les panneaux de rallye et les mémorise dans self.signboards, avec leur position, shapeName et champ dynamique `flag`. | 150 |
| `C:formatDuration(seconds, showSubseconds)` | Formate une durée en [h:]mm:ss (ou avec dixièmes). | 332 |
| `C:getSelectedMissionId()` | Id de la mission choisie dans le menu (extrait de « Nom (id) »). | 139 |
| `C:init()` | Constructeur : initialise les options, charge les réglages sauvegardés et la liste des missions. | 21 |
| `C:loadSettings()` | Relit ce fichier et applique les options ; si le fichier est absent, crée des réglages par défaut tout à faux. Recherche les panneaux si leur affichage était activé. | 62 |
| `C:refreshMissionList()` | Remplit le menu déroulant avec les missions de type rallyLoop du niveau courant (« Nom (id) ») et sélectionne la mission sauvegardée si elle existe. | 108 |
| `C:saveSettings()` | Écrit la mission choisie et les options de dessin dans /settings/rally/loopToolbox.json. | 48 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGameplayInteract` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `debugDrawer:` `drawTextAdvanced`
- `obj:` `at`, `getClassName`, `getCount`, `getDynamicFields`, `getField`, `getID`, `getName`, `getObject`, `getPosition`, `getTransform`, `size`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua`.*
