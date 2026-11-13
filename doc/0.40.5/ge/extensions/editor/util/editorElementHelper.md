# `editor_util_editorElementHelper`

*Fichier : `lua/ge/extensions/editor/util/editorElementHelper.lua` · VM : Game Engine (GE) · 1563 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/util/editorElementHelper")` (fichier sous extensions/ mais pas une extension classique)

Aide d'éditeur qui construit des formulaires imgui pilotés par des « éléments » déclarés (numérique, texte, booléen, transform 3D, modèle/config de véhicule, fichier, course, sites, classement, liste déroulante, filtre de véhicules, sélecteur de zones, décorations…). Utilisé surtout par l'éditeur de missions/quêtes/tests : une classe dérivée déclare ses éléments dans init(), puis on appelle setContainer(c) pour charger les valeurs, draw() pour afficher/éditer, getNewData() pour obtenir les valeurs par défaut et checkContainer() pour détecter les champs manquants ou mal typés. Le module renvoie un constructeur : require('/lua/ge/extensions/editor/util/editorElementHelper')(derivedClass, mode) ; les clés de derivedClass sont copiées dans l'objet.

## Exemple

```lua
local helper = require('/lua/ge/extensions/editor/util/editorElementHelper')({
  init = function(self)
    self:addNumeric('Durée', 'duration', 60)
    self:addBool('Actif', 'enabled', true)
  end
}, 'mission')
helper:setContainer(mission) -- lit mission.missionTypeData
helper:draw()
```

## Remarques

- Le mode détermine le champ de données du conteneur : 'quest' -> questTypeData, 'test' -> test, sinon missionTypeData.
- Chaque élément reçoit un _id unique (compteur de module) ; displayOptions.associatedStars en string est converti en table {clé = true}.
- Transform : écrit trois champs <fieldName>Pos, <fieldName>Rot, <fieldName>Scl (vec3/quat convertis en tables). Modèle/config : <fieldName>Model, Config, ConfigPath. Classement : <fieldName>Count, BestResult, MediumResult, WorstResult. Sélecteur de zones : <fieldName>_initialZones et _destinationZones.
- addFile avertit si l'extension .prefab est utilisée au lieu de .prefab.json.
- Bugs du code : dans newDataFunctions, reward et simpleLapConfig valent la variable inexistante `defaultValue` (nil), donc ces éléments ne produisent pas de données par défaut ; defaultColors.default/orange/red utilisent ImVec4 avec 5 arguments (1,0.6,0,8,0.75) au lieu de 4 ; elementIdSetContainer lit ctd.value au lieu de ctd[e.fieldName] ; checkContainerFunctions.elementId pointe vers elementIdSetContainer.
- editingAnyTransform consulte aussi extensions.editor_missionEditor.getStartTriggerWindow(), ce qui lie ce helper à l'éditeur de missions.

## Classe `C`

Instance du helper d'éléments (avec elements, autoAdditionalAttributes, mode, typeDataFieldName, container).

Le module renvoie un constructeur : `local obj = require("editor_util_editorElementHelper")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addBigDecoHeader(text, color)` | Décoration : grand titre (couleur par nom : default, orange, red, green, blue, white, black). | 240 |
| `C:addBool(label, fieldName, defaultValue, hideElementList, displayOptions)` | Case à cocher, défaut false. Avec hideElementList, ces éléments sont déplacés juste après et masqués (hidden) tant que la case est décochée. | 35 |
| `C:addContainerId(label, fieldName, idType, defaultValue, displayOptions)` | Référence à un autre élément du conteneur par identifiant, défaut « (none) » ; idType est ignoré par le code. | 212 |
| `C:addCustomElement(label, getNewFunction, setContainerFunction, drawFunction)` | Élément personnalisé : getNewFunction(e) renvoie une liste {fieldName, value}, setContainerFunction(e, données) charge les valeurs, drawFunction dessine. Les trois valent nop par défaut. | 22 |
| `C:addDecoDummy(height)` | Décoration : espace vertical de hauteur donnée (défaut 1). | 245 |
| `C:addDecoHeader(text, color)` | Décoration : titre de section coloré. | 241 |
| `C:addDecoSeparator()` | Décoration : séparateur. | 243 |
| `C:addDecoSpacer()` | Décoration : espace vertical de 4. | 244 |
| `C:addDecoText(text, tooltip)` | Décoration : texte simple avec infobulle facultative. | 242 |
| `C:addDropdown(label, fieldName, values, defaultValue, valueTooltips)` | Liste déroulante ; si values est vide, elle contient « issues Values! ». Défaut : première valeur. | 177 |
| `C:addElement(element)` | Ajoute un élément déjà construit à la liste : lui donne un _id unique, normalise displayOptions et le renvoie. | 246 |
| `C:addFile(label, fieldName, defaultValue, allowedExtensions, displayOptions)` | Sélecteur de fichier (chaîne de 1024 caractères) ; allowedExtensions est une liste de paires {description, motif}. | 107 |
| `C:addFixedFile(label, filepathsInfolder, displayOptions)` | Fichier(s) attendu(s) à un emplacement fixe dans le dossier ; une chaîne ou une liste (un seul des fichiers est requis). | 120 |
| `C:addLeaderboard(label, fieldName, defaultCount, defaultBest, defaultMedium, defaultWorst)` | Classement : nombre d'entrées et temps/résultats meilleur, moyen, pire. Défauts : 10, 80, 120, 200. | 152 |
| `C:addModelConfig(label, fieldName, defaultModel, defaultConfig, displayOptions)` | Sélecteur de modèle et configuration de véhicule ; défaut sbr / TT_RWD_S_M. | 96 |
| `C:addNumeric(label, fieldName, defaultValue, displayOptions)` | Champ numérique (FloatPtr), défaut 0. | 25 |
| `C:addRace(label, fieldName, defaultValue, ...)` | Fichier de parcours (*.path.json), élément de type 'race'. | 136 |
| `C:addReward(label, fieldName, defaultValue)` | Champ numérique de type 'reward'. | 172 |
| `C:addSimpleLapConfig(label, fieldName, displayOptions)` | Configuration de tours simple (lapConfigUtil), défaut {}. | 141 |
| `C:addSites(label, fieldName, defaultValue)` | Fichier de sites (*.sites.json), élément de type 'sites'. | 147 |
| `C:addString(label, fieldName, defaultValue, len, displayOptions)` | Champ texte (ArrayChar), longueur 1024 par défaut, défaut vide. | 29 |
| `C:addTransform(label, fieldName, valueOptions, displayOptions)` | Transform 3D éditable (position, rotation, échelle) avec gizmo (transformUtil). valueOptions : defaultPos, defaultRot, defaultScl, hasPos, hasRot, hasScl, oneDimScale ; displayOptions : drawMode ('sphere' par défaut, 'vehicle', 'sphereDir', 'halfBox', 'fullBox'), drawColor (défaut {1,0.25,0,0.5}). | 58 |
| `C:addVehicleFilter(label, fieldName, displayOptions)` | Filtre de véhicules (vehicleFilterUtil) : filtre de base, réglages de probabilité, ajouts/retraits manuels, maxVehicles (0 = tous), popAttribute (« Population »), véhicules auxiliaires et remorques chargées. | 187 |
| `C:addZoneSelector(label, fieldName, globalInfoFolderFieldName, displayOptions)` | Sélecteur de zones initiales et de destination (zoneSelectorUtil), lues dans le fichier de sites du dossier indiqué par globalInfoFolderFieldName. | 217 |
| `C:checkContainer(c, fix, tags)` | Contrôle un conteneur : champs manquants, types différents de ceux attendus, modèles/configs inexistants, fichiers introuvables, etc. Renvoie une liste de problèmes {label, severity, fixable, data}. Le paramètre fix permet de corriger les problèmes réparables (déduit du code). | 496 |
| `C:clear()` | Vide la liste des éléments. | 259 |
| `C:draw(filterOptions)` | Dessine le formulaire (éléments visibles) et gère l'édition des transforms par clic dans la vue 3D (en mode objectSelect, survol d'un transform = « Click to Edit »). | 1287 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Dessine une boîte alignée sur des axes (coin, vecteurs x, y, z, couleur) avec debugDrawer. | 1420 |
| `C:drawTransformAsSphereDir(e)` | Dessine un transform sous forme de sphère avec direction (debugDrawer). | 1327 |
| `C:drawTransformAsVehicle(e)` | Dessine un transform sous forme d'emprise de véhicule (debugDrawer). | 1346 |
| `C:editingAnyTransform()` | Vrai si un transform du helper (ou le transform de déclencheur de départ de l'éditeur de missions) est en cours d'édition. | 1271 |
| `C:getAllFieldNames()` | Liste des noms de champs gérés avec leur type, tous éléments confondus. | 1519 |
| `C:getNewData()` | Rassemble les valeurs par défaut de tous les éléments dans une table fieldName -> valeur (nouveau conteneur). | 327 |
| `C:setAutoAdditionalAttributes(key, auto)` | Active (défaut true) ou désactive la gestion automatique d'attributs supplémentaires pour la clé donnée. | 1529 |
| `C:setContainer(c)` | Mémorise le conteneur et charge dans chaque élément les valeurs de c[typeDataFieldName] ; appelle valueChangedCallback des éléments concernés. C.setContainerBaseFunction est un alias. | 380 |
| `C:updateMouseInfo(container)` | Met à jour mouseInfo : position caméra, rayon souris, impact du rayon (collision de la forêt désactivée le temps du tir), état bouton enfoncé/maintenu et transform survolé le plus proche. | 1203 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `Sim.` `getUniqueName`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/util/editorElementHelper.lua`.*
