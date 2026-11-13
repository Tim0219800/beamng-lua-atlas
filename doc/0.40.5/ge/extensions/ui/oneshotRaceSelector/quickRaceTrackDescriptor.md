# `ui_oneshotRaceSelector_quickRaceTrackDescriptor`

*Fichier : `lua/ge/extensions/ui/oneshotRaceSelector/quickRaceTrackDescriptor.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_oneshotRaceSelector_quickRaceTrackDescriptor` : `extensions.load("ui_oneshotRaceSelector_quickRaceTrackDescriptor")`, puis la globale `ui_oneshotRaceSelector_quickRaceTrackDescriptor`

Descriptor de back-end gridSelector partagé par quickrace et lightRunner. Les deux tirent leurs listes de niveaux et de pistes de scenario_quickRaceLoader.getQuickraceList() et ne diffèrent que par le nom du back-end (les restrictions de véhicules et le comportement au départ sont gérés ailleurs). Le résultat de build est destiné à ui_oneshotRaceSelector_core.createBackend.

## Exemple

```lua
local descriptor = ui_oneshotRaceSelector_quickRaceTrackDescriptor.build("quickraceSelector")
local backend = ui_oneshotRaceSelector_core.createBackend(descriptor)
```

## Remarques

- level.name reprend levelInfo.title : id de traduction pour les niveaux normaux, texte brut pour les entrées synthétiques « Procedural Tracks » / « Track Editor Tracks ». _tr laisse passer les ids inconnus, donc l'appel est systématique.
- Les spécifications de piste affichent difficulté (via difficultyLabel), réversible, départ lancé, tours, auteurs et longueur (en m).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_oneshotRaceSelector_quickRaceTrackDescriptor.build(backendName)` | Renvoie la table descriptor (backendName, middlePathKey = "tracks", clés de titre quickrace, getLevels, getMiddleItems, middleName, noms d'affichage, levelToTile, middleToTile, getLevelDetails, getMiddleDetails) pour le back-end nommé. | 21 |

### Détail des paramètres

#### `ui_oneshotRaceSelector_quickRaceTrackDescriptor.build(backendName)`

Renvoie la table descriptor (backendName, middlePathKey = "tracks", clés de titre quickrace, getLevels, getMiddleItems, middleName, noms d'affichage, levelToTile, middleToTile, getLevelDetails, getMiddleDetails) pour le back-end nommé.

- `backendName` (*string*) : Nom du back-end ; sert aussi de base au fichier de sauvegarde des options d'affichage.
- **renvoie** : table Descriptor à passer à ui_oneshotRaceSelector_core.createBackend.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/oneshotRaceSelector/quickRaceTrackDescriptor.lua`.*
