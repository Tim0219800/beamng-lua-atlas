# `core_quickAccess`

*Fichier : `lua/vehicle/extensions/core/quickAccess.lua` · VM : Véhicule · 338 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_quickAccess` : `extensions.load (VM véhicule)("core_quickAccess")`, puis la globale `core_quickAccess`

Proxy côté véhicule du menu radial (quick access) du GE Lua : les modules du véhicule y déclarent des entrées de menu (addEntry), le GE demande la liste (requestItems) puis signale la sélection d'un élément (selectItem). Gère aussi les entrées du régulateur de vitesse (cruise control) et les catégories de base du menu véhicule.

## Exemple

```lua
extensions.core_quickAccess.addEntry({
  level = "/root/playerVehicle/lights/",
  title = "Mon action", icon = "lowBeam", uniqueID = "monAction",
  onSelect = function() print("clic") return {"hide"} end
})
```

## Remarques

- addEntry doit rester synchronisé avec GE/core/quickAccess/addEntry (commentaire du code). Champs d'une entrée : title (clé de traduction ou {txt, context}), level (défaut '/root/playerVehicle/general/'), onSelect/onSecondarySelect/onTertiarySelect(item), onDeselect/onSecondaryDeselect/onTertiaryDeselect, goto (niveau cible), generator(entries) (fonction qui ajoute dynamiquement des entrées au niveau), uniqueID (remplace une entrée existante du même niveau), icon, color, priority, startSlot/endSlot, desc, holdRepeat, originalActionInfo.
- Le niveau est normalisé : préfixé par '/root/playerVehicle' s'il ne commence pas par '/root/playerVehicle/' ou '/root/sandbox/', et terminé par '/'. Le contrôle `type(args.level) ~= 'string'` est fait après les appels string.startswith : un niveau non chaîne produit une erreur avant d'atteindre ce contrôle.
- Valeurs de retour possibles d'un onSelect : nil (masquer le menu), {'hide'}, {'reload'} (recharge le menu 2 frames plus tard) ou {'goto', niveau}, {'error', raison}.
- Le menu est reconstruit à chaque requestItems : les generator sont exécutés sur une copie profonde de l'arbre, les entrées avec generator sont retirées et chaque entrée reçoit objID et id = niveau .. titre .. index.
- Cruise control : à onInit, si le véhicule a des roues motrices, une entrée niveau '/root/playerVehicle/cruise_control/' ajoute 4 boutons (activer/désactiver, +/reprise, -/fixer, annuler) qui pilotent l'extension cruiseControl. adjustCruiseSpeed change la consigne de ±1 km/h ou ±1 mph (selon uiUnitLength), exprimé en m/s.
- registerMenu est obsolète : il écrit un log d'erreur et ne fait rien ; utiliser addEntry.
- updateGFX n'est actif que pendant le délai de rechargement ; il est mis à nil sinon (extensions.hookUpdate).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_quickAccess.addEntry(_args)` | Ajoute (ou remplace via uniqueID) une entrée de menu pour ce véhicule. | 20 |
| `core_quickAccess.adjustCruiseSpeed(direction)` | Augmente ou diminue la consigne du régulateur d'un cran (1 km/h ou 1 mph) si l'extension cruiseControl est chargée. | 181 |
| `core_quickAccess.onExtensionLoaded()` | Appelé au chargement : ajoute les catégories de base du menu véhicule (aides à la conduite, éclairage, actions rapides, fonctionnalités du véhicule, régulateur de vitesse). *(interne)* *(hook)* | 305 |
| `core_quickAccess.onInit()` | Hook d'initialisation du véhicule : déclare les entrées du régulateur de vitesse s'il y a des roues motrices. *(interne)* *(hook)* | 188 |
| `core_quickAccess.registerMenu()` | Obsolète : écrit une erreur dans le log (utiliser addEntry). | 333 |
| `core_quickAccess.requestItems(level)` | Interface pour le GE : génère l'arbre complet (exécute les generator) et le renvoie au GE via core_quickAccess.vehicleItemsCallback. | 102 |
| `core_quickAccess.selectItem(id, buttonDown, actionIndex)` | Interface pour le GE : exécute l'action d'une entrée désignée par son id selon que le bouton est enfoncé ou relâché et selon l'index d'action (1 principal, 2 secondaire, 3 tertiaire). Le résultat est renvoyé au GE via vehicleItemSelectCallback. | 135 |
| `core_quickAccess.updateGFX(dt)` | Boucle temporaire (valeur nil au repos) qui compte 2 frames avant de notifier le GE d'une demande 'reload'. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `core_quickAccess.addEntry(_args)`

Ajoute (ou remplace via uniqueID) une entrée de menu pour ce véhicule.

- `_args` (*table*) : Description de l'entrée (voir notes).
- **renvoie** : boolean true si ajoutée, false si le niveau est invalide.

#### `core_quickAccess.adjustCruiseSpeed(direction)`

Augmente ou diminue la consigne du régulateur d'un cran (1 km/h ou 1 mph) si l'extension cruiseControl est chargée.

- `direction` (*number*) : Positif pour augmenter, négatif pour diminuer (0 et non-nombre sont ignorés).

#### `core_quickAccess.requestItems(level)`

Interface pour le GE : génère l'arbre complet (exécute les generator) et le renvoie au GE via core_quickAccess.vehicleItemsCallback.

- `level` (*string*) : Niveau demandé (le GE reçoit l'arbre complet et le niveau).
- **renvoie** : boolean Toujours true.

#### `core_quickAccess.selectItem(id, buttonDown, actionIndex)`

Interface pour le GE : exécute l'action d'une entrée désignée par son id selon que le bouton est enfoncé ou relâché et selon l'index d'action (1 principal, 2 secondaire, 3 tertiaire). Le résultat est renvoyé au GE via vehicleItemSelectCallback.

- `id` (*string*) : Identifiant généré par requestItems.
- `buttonDown` (*boolean*) : true à l'appui, false au relâchement.
- `actionIndex` (*integer*) : 1, 2 ou 3.
- **renvoie** : boolean|any true, ou le résultat de itemSelectCallback en cas de goto/erreur.

#### `core_quickAccess.updateGFX(dt)`

Boucle temporaire (valeur nil au repos) qui compte 2 frames avant de notifier le GE d'une demande 'reload'. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps en secondes.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `updateGFX`

## Appels vers le moteur (C++)

- `obj:` `getId`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/core/quickAccess.lua`.*
