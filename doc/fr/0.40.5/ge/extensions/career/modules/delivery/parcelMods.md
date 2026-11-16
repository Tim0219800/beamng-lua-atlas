# `career_modules_delivery_parcelMods`

*Fichier : `lua/ge/extensions/career/modules/delivery/parcelMods.lua` · VM : Game Engine (GE) · 326 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_parcelMods` : `extensions.load("career_modules_delivery_parcelMods")`, puis la globale `career_modules_delivery_parcelMods`

Définit les modificateurs (« mods ») de colis du mode carrière : timed, post, precious, supplies, large, fluid, dryBulk, parcel, hazardous. Chaque mod a un drapeau de déblocage (unlockFlag), une priorité de tri, une icône, des textes traduits et un gabarit (makeTemplate) qui produit la table attachée au colis. Sert à générer les mods d'un colis (generateModifiers), savoir s'ils sont débloqués et compter les statistiques de livraison par mod.

## Remarques

- Dans generateModifiers, la condition `item.slots >= largeSlotThreshold or item.weight >= heavyWeightThreshold and not parcelTemplate.modChance.large` est évaluée avec la priorité Lua (and avant or) : le test `not modChance.large` ne s'applique qu'au poids, pas aux slots. Un colis de 65 slots ou plus reçoit donc toujours un mod large, même si le gabarit a déjà une chance large (doublon possible).
- generateModifiers appelle math.randomseed(item.groupSeed) : la génération est déterministe par groupe, mais elle réinitialise le générateur aléatoire global.
- progressTemplate utilise la clé 'delivieries' (faute de frappe), alors que trackModifierStats incrémente 'delivered' : les compteurs 'delivieries' du gabarit ne sont jamais incrémentés.
- Les mods timed ont moneyMultipler (sic) 1.5, post 1.2, precious 2.5, large 1.2, supplies 1.0 ; le temps timed vaut distance/13 + 30*random + 30 secondes (timeUntilDelayed), timeUntilLate = 1.25 * ce temps + 15.
- calculateTimedModifierTime (distance/13 + 30*(1+random)) n'est pas utilisée par le mod timed lui-même, qui recalcule son propre temps dans makeTemplate.
- getModifierIcon, getLabelAndShortDescription et isImportant plantent si la clé n'existe pas (indexation de modifiers[key] sans test), contrairement à getModData.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_parcelMods.calculateTimedModifierTime(distance)` | Calcule un délai de livraison en secondes : distance/13 + 30 * (1 + random). | 207 |
| `career_modules_delivery_parcelMods.generateModifiers(item, parcelTemplate, distance)` | Tire les mods d'un colis selon les probabilités parcelTemplate.modChance (une pioche par clé, clés triées), ajoute le mod large pour les colis très gros ou très lourds (65 slots, poids 80), puis trie par priorité. | 218 |
| `career_modules_delivery_parcelMods.getLabelAndShortDescription(key)` | Renvoie le libellé traduit et la courte description traduite (chaîne vide si le mod n'en a pas). | 201 |
| `career_modules_delivery_parcelMods.getModData(key)` | Renvoie une copie des données d'un mod avec unlockLabel, label et shortDescription déjà traduits via _tr. | 188 |
| `career_modules_delivery_parcelMods.getModifierIcon(key)` | Renvoie le nom d'icône UI du mod. | 200 |
| `career_modules_delivery_parcelMods.getParcelModProgressLabel(key)` | Renvoie le texte traduit décrivant comment débloquer le mod. | 276 |
| `career_modules_delivery_parcelMods.getParcelModUnlockStatusSimple()` | Renvoie l'état de déblocage de chaque mod. | 268 |
| `career_modules_delivery_parcelMods.getProgress()` | Renvoie la table de progression (compteurs par type de mod : delivered, onTimeDeliveries, delayedDeliveries, lateDeliveries, lost…), utilisée pour la sauvegarde. | 184 |
| `career_modules_delivery_parcelMods.isImportant(key)` | Indique si le mod est marqué important (timed et precious). | 205 |
| `career_modules_delivery_parcelMods.isParcelModUnlocked(modKey)` | Indique si le drapeau de déblocage du mod est actif dans career_modules_unlockFlags. | 242 |
| `career_modules_delivery_parcelMods.lockedBecauseOfMods(modKeys)` | Pour un ensemble de mods, dit si au moins un est verrouillé et renvoie la définition du drapeau de plus haut niveau parmi ceux examinés. | 248 |
| `career_modules_delivery_parcelMods.onCareerActivated()` | Hook appelé à l'activation de la carrière : mémorise les références vers les autres extensions de livraison (parcelManager, cargoScreen, general, generator, progress, tutorial). *(interne)* *(hook)* | 6 |
| `career_modules_delivery_parcelMods.setProgress(data)` | Remplace les statistiques de progression par mod (chargement de sauvegarde). Sans argument, revient à une copie du gabarit par défaut. | 180 |
| `career_modules_delivery_parcelMods.trackModifierStats(cargo)` | Met à jour les statistiques à la livraison d'un colis : incrémente progress[type].delivered pour chaque mod, et pour timed classe la livraison à l'heure, retardée ou en retard selon le temps écoulé depuis cargo.loadedAtTimeStamp. | 279 |

### Détail des paramètres

#### `career_modules_delivery_parcelMods.calculateTimedModifierTime(distance)`

Calcule un délai de livraison en secondes : distance/13 + 30 * (1 + random).

- `distance` (*number*) : Distance du trajet en mètres.
- **renvoie** : number Temps en secondes.

#### `career_modules_delivery_parcelMods.generateModifiers(item, parcelTemplate, distance)`

Tire les mods d'un colis selon les probabilités parcelTemplate.modChance (une pioche par clé, clés triées), ajoute le mod large pour les colis très gros ou très lourds (65 slots, poids 80), puis trie par priorité.

- `item` (*table*) : Colis en cours de génération ; utilise groupSeed (graine), slots et weight.
- `parcelTemplate` (*table*) : Gabarit de colis avec la table modChance[modKey] = probabilité 0..1.
- `distance` (*number*) : Distance du trajet, transmise à makeTemplate (utile pour timed).
- **renvoie** : table Liste de tables de mod triée par priorité croissante.

#### `career_modules_delivery_parcelMods.getLabelAndShortDescription(key)`

Renvoie le libellé traduit et la courte description traduite (chaîne vide si le mod n'en a pas).

- `key` (*string*) : Clé du mod.
- **renvoie** : string Libellé traduit.
- **renvoie** : string Description courte traduite ou ''.

#### `career_modules_delivery_parcelMods.getModData(key)`

Renvoie une copie des données d'un mod avec unlockLabel, label et shortDescription déjà traduits via _tr.

- `key` (*string*) : Clé du mod (timed, post, precious, supplies, large, fluid, dryBulk, parcel, hazardous).
- **renvoie** : table|nil Données du mod, ou nil si la clé est inconnue.

#### `career_modules_delivery_parcelMods.getModifierIcon(key)`

Renvoie le nom d'icône UI du mod.

- `key` (*string*) : Clé du mod.
- **renvoie** : string Identifiant d'icône.

#### `career_modules_delivery_parcelMods.getParcelModProgressLabel(key)`

Renvoie le texte traduit décrivant comment débloquer le mod.

- `key` (*string*) : Clé du mod.
- **renvoie** : string Libellé traduit.

#### `career_modules_delivery_parcelMods.getParcelModUnlockStatusSimple()`

Renvoie l'état de déblocage de chaque mod.

- **renvoie** : table<string, boolean> modKey -> débloqué.

#### `career_modules_delivery_parcelMods.getProgress()`

Renvoie la table de progression (compteurs par type de mod : delivered, onTimeDeliveries, delayedDeliveries, lateDeliveries, lost…), utilisée pour la sauvegarde.

- **renvoie** : table Table de progression, par type de mod.

#### `career_modules_delivery_parcelMods.isImportant(key)`

Indique si le mod est marqué important (timed et precious).

- `key` (*string*) : Clé du mod.
- **renvoie** : boolean true si important.

#### `career_modules_delivery_parcelMods.isParcelModUnlocked(modKey)`

Indique si le drapeau de déblocage du mod est actif dans career_modules_unlockFlags.

- `modKey` (*string*) : Clé du mod.
- **renvoie** : boolean false si le mod est inconnu ou sans drapeau.

#### `career_modules_delivery_parcelMods.lockedBecauseOfMods(modKeys)`

Pour un ensemble de mods, dit si au moins un est verrouillé et renvoie la définition du drapeau de plus haut niveau parmi ceux examinés.

- `modKeys` (*table<string, any>*) : Table dont les clés sont des clés de mod.
- **renvoie** : boolean true si au moins un mod est verrouillé.
- **renvoie** : table|nil Définition de drapeau (level le plus haut), ou nil.

#### `career_modules_delivery_parcelMods.setProgress(data)`

Remplace les statistiques de progression par mod (chargement de sauvegarde). Sans argument, revient à une copie du gabarit par défaut.

- `data` (*table|nil*) : Table de progression sauvegardée, ou nil pour réinitialiser.

#### `career_modules_delivery_parcelMods.trackModifierStats(cargo)`

Met à jour les statistiques à la livraison d'un colis : incrémente progress[type].delivered pour chaque mod, et pour timed classe la livraison à l'heure, retardée ou en retard selon le temps écoulé depuis cargo.loadedAtTimeStamp.

- `cargo` (*table*) : Colis livré, avec modifiers et loadedAtTimeStamp.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/parcelMods.lua`.*
