# `gameplay_missions_missionTypes_editorHelper`

*Fichier : `lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua` · VM : Game Engine (GE) · 1310 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/missions/missionTypes/editorHelper")` (fichier sous extensions/ mais pas une extension classique)

Classe de base pour écrire l'éditeur d'un type de mission dans l'éditeur du jeu (interface imgui). Un type de mission déclare ses champs missionTypeData avec des méthodes addXxx (nombre, texte, booléen, transformation 3D, véhicule modèle/config, fichier, course, classement, liste déroulante...) ; le helper sait ensuite fournir les valeurs par défaut (getNewData), charger une mission (setMission), vérifier ses champs (checkMission), dessiner les widgets et les gizmos 3D (draw). Le module renvoie une fabrique `function(derivedClass, ...)` qui crée l'objet, copie les clés de la classe dérivée, initialise elements et autoAdditionalAttributes puis appelle init() s'il existe.

## Exemple

```lua
-- editor.lua d'un type de mission (ancien style)
local C = {}
function C:init()
  self:addNumeric('Laps', 'laps', 3)
  self:addTransform('Start', 'start', {hasScl=false}, {drawMode='vehicle'})
end
return function() return gameplay_missions_missions.editorHelper(C) end
```

## Remarques

- Chaque élément est une table {type, label, fieldName, displayOptions, ...}. addElement leur donne un _id unique et convertit displayOptions.associatedStars (chaîne) en table {clé=true}.
- Un élément multi-champs écrit plusieurs clés dans missionTypeData : transform -> <fieldName>Pos / Rot / Scl ; modelconfig -> <fieldName>Model / Config / ConfigPath ; leaderboard -> <fieldName>BestResult / MediumResult / WorstResult (et Count côté interface).
- Gravités des problèmes de checkMission : « error » pour champ manquant, type différent ou modèle/config/fichier introuvable ; « warning » pour champ en trop (fixable = true).
- Bug : newDataFunctions.reward et newDataFunctions.simpleLapConfig valent `defaultValue`, une variable non définie à cet endroit (nil) : ces deux types n'ont donc aucune valeur par défaut dans getNewData ni de contrôle dans checkMission (traités comme nop). Les fonctions de SetMission existent pour eux.
- Bug : missionIdSetMission lit `mtd.value` au lieu de `mtd[e.fieldName]` : un champ missionId n'est jamais rechargé depuis la mission.
- Les couleurs defaultColors.default / orange / red sont construites avec 5 composantes (par ex. ImVec4(1,0.6,0,8,0.75)), signe d'une faute de frappe (0.8 attendu) ; seules les 4 premières sont prises en compte.
- gameplay_missions_missions.editorHelper(C, ...) ne renvoie pas ce fichier mais editor/util/editorElementHelper (contexte 'mission') ; ce module-ci n'est utilisé que par des appels directs (par ex. editor/missionEditor/genericTypeData.lua).

## Classe `C`

Classe d'éditeur de type de mission. Champs d'instance : elements (liste ordonnée), autoAdditionalAttributes, mission (mission en cours d'édition), mouseInfo (état de la souris pour les gizmos).

Le module renvoie un constructeur : `local obj = require("gameplay_missions_missionTypes_editorHelper")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addBool(label, fieldName, defaultValue, hideElementList, displayOptions)` | Case à cocher ; défaut false. Si hideElementList est donné, ces éléments sont déplacés juste après et masqués quand la case est décochée. | 32 |
| `C:addCustomElement(label, getNewFunction, setMissionFunction, drawFunction)` | Ajoute un élément personnalisé géré par vos propres fonctions. | 19 |
| `C:addDecoDummy(height)` | Décoration : espace vertical de hauteur donnée (1 par défaut). | 197 |
| `C:addDecoHeader(text, color)` | Décoration : titre coloré (default, orange, red, green, blue, white, black). | 193 |
| `C:addDecoSeparator()` | Décoration : ligne de séparation. | 195 |
| `C:addDecoSpacer()` | Décoration : espace vertical de 4 pixels. | 196 |
| `C:addDecoText(text, tooltip)` | Décoration : ligne de texte avec infobulle facultative. | 194 |
| `C:addDropdown(label, fieldName, values, defaultValue, valueTooltips)` | Liste déroulante de valeurs ; si la liste est vide, elle contient « issues Values! ». Défaut : premier élément. | 166 |
| `C:addElement(element)` | Ajoute un élément déjà construit à la liste (attribue _id, normalise displayOptions). Toutes les méthodes addXxx passent par elle et renvoient l'élément. | 198 |
| `C:addFile(label, fieldName, defaultValue, allowedExtensions, displayOptions)` | Chemin de fichier avec sélecteur de fichier. | 104 |
| `C:addFixedFile(label, filepathsInMissionfolder, displayOptions)` | Fichier attendu à un nom fixe dans le dossier de la mission (une chaîne, ou une liste dont un des fichiers est requis). Ne stocke aucune valeur. | 113 |
| `C:addLeaderboard(label, fieldName, defaultCount, defaultBest, defaultMedium, defaultWorst)` | Réglages de classement : nombre d'entrées et résultats de référence meilleur / moyen / pire. Défauts : 10, 80, 120, 200. | 141 |
| `C:addMissionId(label, fieldName, defaultValue, displayOptions)` | Champ contenant l'id d'une autre mission ; défaut « (none) ». | 176 |
| `C:addModelConfig(label, fieldName, defaultModel, defaultConfig, displayOptions)` | Choix d'un véhicule (modèle + configuration). Défaut : modèle « sbr », config « TT_RWD_S_M ». Stocké dans <fieldName>Model / Config / ConfigPath. | 93 |
| `C:addNumeric(label, fieldName, defaultValue, displayOptions)` | Champ numérique (flottant) ; défaut 0. | 22 |
| `C:addRace(label, fieldName, defaultValue, ...)` | Fichier de course (addFile filtré sur *.path.json) de type « race ». | 125 |
| `C:addReward(label, fieldName, defaultValue)` | Champ numérique de type « reward » (récompense). | 161 |
| `C:addSimpleLapConfig(label, fieldName, displayOptions)` | Configuration simple de tours (outil editor/util/lapConfigUtil). | 130 |
| `C:addSites(label, fieldName, defaultValue)` | Fichier de sites (addFile filtré sur *.sites.json) de type « sites ». | 136 |
| `C:addString(label, fieldName, defaultValue, len, displayOptions)` | Champ texte (tampon de 1024 caractères par défaut) ; défaut chaîne vide. | 26 |
| `C:addTransform(label, fieldName, valueOptions, displayOptions)` | Position / rotation / échelle éditables dans le monde 3D (gizmo transformUtil). Stockés dans <fieldName>Pos, <fieldName>Rot, <fieldName>Scl. | 55 |
| `C:checkMission(m, fix)` | Vérifie missionTypeData par rapport aux éléments : champs manquants, types différents, champs en trop, modèles/configs/fichiers inexistants. Renvoie la liste de problèmes {label, severity, fixable, data}. | 374 |
| `C:clear()` | Vide la liste des éléments. | 211 |
| `C:draw(filterOptions)` | Dessine tous les éléments (widgets imgui et gizmos 3D) ; marque mission._dirty quand une valeur change. filterOptions.onlyStar limite l'affichage aux éléments associés à une étoile. | 1024 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Dessine une boîte alignée sur trois axes à partir d'un coin avec debugDrawer. | 1179 |
| `C:drawTransformAsSphereDir(e)` | Dessine une transformation comme une sphère avec une flèche de direction. | 1066 |
| `C:drawTransformAsVehicle(e)` | Dessine une transformation comme un boîtier de véhicule (autres fonctions d'aide de dessin). | 1105 |
| `C:editingAnyTransform()` | Indique si une transformation (d'un élément ou du déclencheur de départ) est en cours d'édition. | 1011 |
| `C:getAllFieldNames()` | Liste tous les champs missionTypeData gérés par l'éditeur, avec leur type. | 1278 |
| `C:getNewData()` | Construit la table missionTypeData par défaut d'une nouvelle mission en rassemblant les valeurs par défaut de tous les éléments. | 256 |
| `C:setAutoAdditionalAttributes(key, auto)` | Active ou désactive la génération automatique d'un attribut additionnel de mission. | 1288 |
| `C:setMission(m)` | Charge une mission dans l'éditeur : mémorise self.mission et met à jour chaque widget depuis mission.missionTypeData, puis appelle valueChangedCallback. | 297 |
| `C:updateMouseInfo(mission)` | Met à jour mouseInfo : position caméra, rayon et impact du rayon sous la souris (collision de la forêt désactivée le temps du tir), état clic/maintien/relâché, élément survolé. | 946 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `Sim.` `getUniqueName`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua`.*
