# `gameplay_missions_missionTypes_baseMission`

*Fichier : `lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/missions/missionTypes/baseMission")` (fichier sous extensions/ mais pas une extension classique)

Classe de base des types de mission (non-flowgraph). Le module renvoie une fabrique `function(derivedClass, ...)` : elle crée un objet à partir de la table d'options, lui donne la métatable C, appelle init(), copie dans l'objet toutes les clés de la classe dérivée (qui écrasent donc les méthodes de base), puis rappelle init(). Fournit des méthodes vides onStart / onUpdate / onStop que les types de mission surchargent, et la traduction des clés de progression.

## Exemple

```lua
-- dans un type de mission : local C = {}
-- ... définir C:init(), C:onStart() ...
-- return require('/lua/ge/extensions/gameplay/missions/missionTypes/baseMission')(C, ...)
```

## Remarques

- init() est appelé DEUX fois par la fabrique : une fois avec la version de base (avant la copie des clés dérivées), une fois après (version dérivée si elle existe). Une init dérivée doit donc supporter d'être exécutée sur un objet déjà initialisé ; seule la valeur de retour du second appel est renvoyée (2e valeur de retour de la fabrique).
- Les clés de la classe dérivée sont copiées dans l'objet lui-même (o[k] = v), pas dans une métatable : elles masquent les méthodes de C.
- C.__index = C est réassigné à chaque création d'objet (inoffensif).

## Classe `C`

Classe de base d'une mission. L'objet porte les données de la mission (missionType, etc.) fournies via la table d'options.

Le module renvoie un constructeur : `local obj = require("gameplay_missions_missionTypes_baseMission")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:getProgressKeyTranslation(progressKey)` | Renvoie la clé de traduction d'une clé de progression (« default », « custom ») ; si elle est inconnue, renvoie la clé telle quelle. | 13 |
| `C:init()` | Appelé à la création d'une mission de ce type. Définit self.missionTypeLabel = "bigMap.missionLabels."..self.missionType et self.progressKeyTranslations = {default, custom} (clés de traduction missions.progressKeyLabels.*). | 8 |
| `C:onStart()` | Appelé au démarrage de la mission. Vide dans la base, à surcharger. | 23 |
| `C:onStop(data)` | Appelé à l'arrêt de la mission. `data` (la tentative) peut être nil. Vide dans la base. | 27 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame pendant la mission. Vide dans la base, à surcharger. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua`.*
