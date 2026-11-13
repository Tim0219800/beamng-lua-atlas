# `console_lib`

*Fichier : `lua/console/console-lib.lua` · VM : Console · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("console-lib")`

Bibliothèque d'aide de la VM console (BeamNG sans jeu) : crée des objets Lua factices pour que le code de véhicule/physique puisse tourner hors du jeu complet, fabrique des objets `ground_model` à partir de la description JSON des matériaux de sol, et lit art/groundmodels.json. Utilisée par bananabench.

## Remarques

- `initConsole` définit des GLOBALES factices : physicsEngineEvent, vehicleReset, map (setNameForId, objectData), gameplay_statistic (metricAdd), core_sounds (setEngineSoundParameter, setEngineSoundParameterList, initExhaustSound, setExhaustSoundNodes, initEngineSound), toutes sans effet.
- `createGroundModel` est marqué TODO dans le source : code dupliqué depuis environment.lua (submitGroundModel). Valeurs par défaut : roughnessCoefficient 0, defaultDepth 0, staticFrictionCoefficient 1, slidingFrictionCoefficient 0.7, hydrodynamicFriction 0.01 (accepte aussi la clé mal orthographiée `hydrodnamicFriction`), stribeckVelocity 6, strength 1, fluidDensity 200, flowConsistencyIndex 10000, flowBehaviorIndex 0.5, dragAnisotropy 0, skidMarks false, shearStrength 0.
- collisiontype : si c'est une chaîne, elle est convertie en identifiant de matériau particules (particles.getOrAddMaterialIDByName), sinon 0.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `console_lib.createGroundModel(v)` | Crée et remplit un objet natif `ground_model()` à partir d'une table de paramètres (coefficients de frottement, profondeur, rugosité, fluide…) avec les valeurs par défaut listées dans les notes. | 27 |
| `console_lib.initConsole()` | Crée les globales factices nécessaires pour exécuter du code de véhicule hors du jeu (map, gameplay_statistic, core_sounds, physicsEngineEvent, vehicleReset). | 6 |
| `console_lib.readGroundModels()` | Lit et renvoie le contenu de art/groundmodels.json. | 52 |

### Détail des paramètres

#### `console_lib.createGroundModel(v)`

Crée et remplit un objet natif `ground_model()` à partir d'une table de paramètres (coefficients de frottement, profondeur, rugosité, fluide…) avec les valeurs par défaut listées dans les notes.

- `v` (*table*) : Description d'un matériau de sol (entrée de art/groundmodels.json).
- **renvoie** : userdata Objet ground_model natif.

#### `console_lib.readGroundModels()`

Lit et renvoie le contenu de art/groundmodels.json.

- **renvoie** : table|nil Tables des modèles de sol décodées.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/console-lib.lua`.*
