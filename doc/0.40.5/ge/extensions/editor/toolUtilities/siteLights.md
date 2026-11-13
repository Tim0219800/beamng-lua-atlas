# `editor_toolUtilities_siteLights`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteLights.lua` · VM : Game Engine (GE) · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteLights` : `extensions.load("editor_toolUtilities_siteLights")`, puis la globale `editor_toolUtilities_siteLights`

Un seul endroit qui transforme un enregistrement de lumière en objet de scène, pour tous les outils de la suite. Chaque lumière est une lumière de nuit dès qu'elle est posée : sombre de jour, allumée après le crépuscule, commutée par l'environnement (core_environment). Fournit la création (spawn), la mise à jour (apply), un drapeau pour redemander à l'environnement de rescanner la scène (markDirty) et une boucle légère à appeler chaque frame (flush) qui garde les lumières neuves en phase avec le jour et la nuit.

## Exemple

```lua
local lights = extensions.editor_toolUtilities_siteLights
local obj = lights.spawn(folder, 'MyLamp_1', {px = x, py = y, pz = z + 6, glow = lights.TONES.warm, radius = 18, brightness = 2})
-- chaque frame de l'outil :
lights.flush()
```

## Remarques

- Enregistrement de lumière : { px, py, pz, glow ou col ({r,g,b}), brightness, radius } pour une ampoule (PointLight) ; plus { dx, dy, dz, cone } pour un projecteur (SpotLight). La classe est fixée à la création et doit correspondre à l'enregistrement. cone par défaut 70 degrés, angle intérieur = 0.6 * cone, la portée vient de radius (champ range).
- Un enregistrement avec always = true est allumé jour et nuit (un tunnel est sombre à midi) et exclu de toute commutation jour/nuit.
- Les lumières sont créées avec canSave = false et castShadows = false ; une lumière sans always démarre éteinte (isEnabled false) avec nightLight = 1 et est confiée à l'environnement.
- Le rescan de l'environnement parcourt toute la scène (des secondes sur une carte urbaine) : markDirty sans objet attend settleMs = 250 ms de calme ; avec un objet, celui-ci est mis dans l'état jour/nuit courant sans rescan et suivi toutes les 500 ms (followMs).
- Un nom nil laisse la lumière sans nom, ce qui l'enregistre environ 3 ms plus vite ; la passe de crépuscule de l'environnement les repère par id, donc elle commute quand même. Une lumière du même nom existante est supprimée avant la création.
- Si l'environnement est resté sans scan (rechargement Lua), flush le détecte (nuit mais lumières non activées, sur deux vérifications consécutives) et redemande un rescan.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteLights.apply(obj, lt)` | Règle une lumière existante d'après un enregistrement : rayon (ou portée et angles pour un projecteur), luminosité, couleur, ombres désactivées, position, et rotation vers (dx, dy, dz) pour un projecteur. | 108 |
| `editor_toolUtilities_siteLights.flush()` | À appeler chaque frame par chaque outil qui crée des lumières. Peu coûteux tant que rien n'est dû : effectue le rescan différé, suit l'état jour/nuit de l'environnement (core_environment.getLightState) et commute (setLightEnabled, ou couleur d'instance pour une lentille émissive) les objets marqués. | 57 |
| `editor_toolUtilities_siteLights.markDirty(obj)` | Signale qu'une lumière est neuve (avec obj : elle sera mise dans l'état jour/nuit courant) ou qu'un rescan complet de la scène est dû (sans obj : fait après une pause de 250 ms). La suppression d'une lumière n'a pas besoin de rescan : l'environnement ignore celles qui ont disparu. | 49 |
| `editor_toolUtilities_siteLights.spawn(folder, name, lt)` | Crée un objet lumière pour un enregistrement (SpotLight s'il porte une direction, sinon PointLight), l'enregistre sous name et l'ajoute à folder. Renvoie nil si la création échoue. Sauf always, la lumière est confiée à l'environnement via markDirty. | 135 |

### Détail des paramètres

#### `editor_toolUtilities_siteLights.apply(obj, lt)`

Règle une lumière existante d'après un enregistrement : rayon (ou portée et angles pour un projecteur), luminosité, couleur, ombres désactivées, position, et rotation vers (dx, dy, dz) pour un projecteur.

- `obj` (*userdata*) : Objet PointLight ou SpotLight.
- `lt` (*table*) : Enregistrement de lumière.

#### `editor_toolUtilities_siteLights.markDirty(obj)`

Signale qu'une lumière est neuve (avec obj : elle sera mise dans l'état jour/nuit courant) ou qu'un rescan complet de la scène est dû (sans obj : fait après une pause de 250 ms). La suppression d'une lumière n'a pas besoin de rescan : l'environnement ignore celles qui ont disparu.

- `obj` (*userdata|nil*) : Lumière ou élément lumineux neuf.

#### `editor_toolUtilities_siteLights.spawn(folder, name, lt)`

Crée un objet lumière pour un enregistrement (SpotLight s'il porte une direction, sinon PointLight), l'enregistre sous name et l'ajoute à folder. Renvoie nil si la création échoue. Sauf always, la lumière est confiée à l'environnement via markDirty.

- `folder` (*userdata|nil*) : Groupe de scène parent.
- `name` (*string|nil*) : Nom d'objet (nil = sans nom).
- `lt` (*table*) : Enregistrement de lumière.
- **renvoie** : userdata|nil Objet lumière créé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `TONES` | table<string, number[]> | Teintes nommées : warm {1.00, 0.72, 0.34} (sodium), white {1.00, 0.95, 0.88}, cool {0.78, 0.87, 1.00} (iodures métalliques). Évite que deux sites voisins soient éclairés de couleurs différentes. |

## Appels vers le moteur (C++)

- `core_environment.` `getLightState`, `refreshnightLightsObjects`
- `obj:` `getField`, `isSubClassOf`, `postApply`, `preApply`, `registerObject`, `setField`, `setLightEnabled`, `setPosition`, `updateInstanceRenderData`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteLights.lua`.*
