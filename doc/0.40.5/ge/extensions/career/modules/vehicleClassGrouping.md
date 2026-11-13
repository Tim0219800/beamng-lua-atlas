# `career_modules_vehicleClassGrouping`

*Fichier : `lua/ge/extensions/career/modules/vehicleClassGrouping.lua` · VM : Game Engine (GE) · 139 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_vehicleClassGrouping` : `extensions.load("career_modules_vehicleClassGrouping")`, puis la globale `career_modules_vehicleClassGrouping`

Génère des groupes de véhicules par classe de performance (S, A, B, C, D) pour le système core_multiSpawn (adversaires, courses). Parcourt tous les modèles Car/Truck et leurs configs, filtre par modèle, config et type de config, garde ceux dont la classe (gameplay_vehiclePerformance.getClassFromConfig) correspond, puis mélange le résultat. Fournit aussi un coefficient d'agressivité de l'IA par classe.

## Remarques

- Coefficients d'agressivité : S 1, A 0,9, B 0,8, C 0,7, D 0,6 ; classe par défaut B.
- Filtres par défaut : modèles exclus atv, utv, us_semi, midtruck, citybus, racetruck, rockbouncer, simple_traffic ; types de config exclus Police, Service, Powerglow.
- Avec performanceIndexTarget, ne garde que les configs dans la fenêtre ±performanceIndexWindow (5 par défaut) ; si aucune, prend les 10 plus proches. Si le groupe reste vide, une entrée de secours {model='midsize'} est ajoutée.
- Le « smart shuffle » entrelace les modèles pour éviter les doublons successifs du même modèle.
- L'argument mode (« default » ou « drag ») est lu mais n'a pas d'effet dans le code.

**Dépendances (chargées avant) :** `gameplay_vehiclePerformance`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_vehicleClassGrouping.generateGroup(class, mode, modelFilter, configFilter, configTypeFilter, invertedFilters, randomizePaint, smartShuffle, performanceIndexTarget, performanceIndexWindow)` | Construit un groupe de véhicules d'une classe donnée, utilisable par core_multiSpawn. | 50 |
| `career_modules_vehicleClassGrouping.getAggressionMultiplier(class)` | Retourne le coefficient d'agressivité de l'IA pour une classe. | 37 |

### Détail des paramètres

#### `career_modules_vehicleClassGrouping.generateGroup(class, mode, modelFilter, configFilter, configTypeFilter, invertedFilters, randomizePaint, smartShuffle, performanceIndexTarget, performanceIndexWindow)`

Construit un groupe de véhicules d'une classe donnée, utilisable par core_multiSpawn.

- `class` (*string|nil*) : Classe de performance, défaut "B".
- `mode` (*string|nil*) : "default" ou "drag" (sans effet).
- `modelFilter` (*table<string, any>|nil*) : Modèles à exclure (clé = modèle).
- `configFilter` (*table<string, any>|nil*) : Configs à exclure (clé "modèle/config").
- `configTypeFilter` (*table<string, any>|nil*) : Types de config à exclure.
- `invertedFilters` (*table<string, boolean>|nil*) : Ex. {modelFilter = true} inverse le filtre (liste blanche).
- `randomizePaint` (*boolean|nil*) : Peinture « (Random) », vrai par défaut.
- `smartShuffle` (*boolean|nil*) : Entrelacer les modèles, vrai par défaut.
- `performanceIndexTarget` (*number|nil*) : Indice de performance visé.
- `performanceIndexWindow` (*number|nil*) : Tolérance autour de la cible, défaut 5.
- **renvoie** : table {name = "Class X", type = "custom", data = {{model, config, paintName}, ...}}.

#### `career_modules_vehicleClassGrouping.getAggressionMultiplier(class)`

Retourne le coefficient d'agressivité de l'IA pour une classe.

- `class` (*string|nil*) : Classe S/A/B/C/D, défaut "B".
- **renvoie** : number Coefficient (1 si classe inconnue).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"gameplay_vehiclePerformance"}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/vehicleClassGrouping.lua`.*
