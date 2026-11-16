# `career_modules_milestones_generalMilestones_delivery`

*Fichier : `lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua` · VM : Game Engine (GE) · 179 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_milestones_generalMilestones_delivery` : `extensions.load("career_modules_milestones_generalMilestones_delivery")`, puis la globale `career_modules_milestones_generalMilestones_delivery`

Jalons liés aux livraisons de la carrière : colis (parcel), véhicules, remorques, fluides et vrac sec livrés ; livraisons à l'heure, retardées ou en retard (parcelMods « timed ») ; nombre d'installations desservies (deliverToMilestone) ou ayant reçu des livraisons (deliverFromMilestone). Les valeurs viennent de career_modules_delivery_progress et career_modules_delivery_parcelMods.

## Remarques

- Paliers : parcel {5,25,50,100,150,250}, vehicle et trailer {1,4,9,25,35,50}, fluid et dryBulk {100,1000,10000,100000}, timed {1,8,20,50}, installations fournisseurs {1,4,9,16,25}, destinataires {1,4,9,16,25,35,45}.
- Tous les jalons utilisent minorLinear (100*(step+1)) et le filtre delivery/gameplay.
- Les labels de deliverToMilestone/deliverFromMilestone semblent inversés par rapport aux noms de clés (deliveredFromHere pour deliverToMilestone) : à vérifier côté traductions.
- Contrairement aux autres sous-systèmes, la sauvegarde de ces jalons n'est pas créée ici (elle l'est par milestones/general.lua).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_milestones_generalMilestones_delivery.onDeliveryFacilityProgressStatsChanged()` | Hook appelé quand les statistiques de progression des installations de livraison changent : vérifie chaque jalon, notifie les paliers atteints et avance notificationStep. *(interne)* *(hook)* | 165 |
| `career_modules_milestones_generalMilestones_delivery.onGeneralMilestonesCollect(milestonesList)` | Hook : construit les configurations de jalons de livraison et les ajoute à milestonesList. *(interne)* *(hook)* | 71 |
| `career_modules_milestones_generalMilestones_delivery.onGeneralMilestonesSetupCallbacks()` | Hook : fixe la cible de notification de chaque jalon de livraison. *(interne)* *(hook)* | 148 |
| `career_modules_milestones_generalMilestones_delivery.setNotificationTarget(milestoneConfig)` | Stocke dans milestoneConfig._target la cible du prochain palier à notifier, sauf si tous sont notifiés. | 154 |

### Détail des paramètres

#### `career_modules_milestones_generalMilestones_delivery.onGeneralMilestonesCollect(milestonesList)`

Hook : construit les configurations de jalons de livraison et les ajoute à milestonesList.

- `milestonesList` (*table[]*) : Liste à compléter.

#### `career_modules_milestones_generalMilestones_delivery.setNotificationTarget(milestoneConfig)`

Stocke dans milestoneConfig._target la cible du prochain palier à notifier, sauf si tous sont notifiés.

- `milestoneConfig` (*table*) : Configuration du jalon.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua`.*
