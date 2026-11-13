# `jbeam_sections_events`

*Fichier : `lua/common/jbeam/sections/events.lua` · VM : Commun (GE + véhicule) · 337 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/events")`

Traite les sections jbeam d'interaction : events (évènements d'entrée, simplement nettoyés), triggers (zones de déclenchement 3D box/sphère créées dans le moteur avec addTrigger, position, rotation, taille, couleur, label, meshes à surligner) et triggerEventLinks / triggerEventLinks2 (liens entre un trigger et une action d'entrée). Construit vehicle.triggerEventLinksDict[triggerId][entrée] = liste de liens et migre les anciens liens (v1, vers vehicle.events) vers le format v2 (inputActions). Charge l'extension core_vehicleTriggers si au moins un trigger a été créé.

## Remarques

- Un trigger : id de référence idRef et axes idX, idY (nœuds), rotation en degrés (convertie en radians), translation, baseTranslation(+Global/Elastic/Rigid), type 'box' (size = vec3) ou 'sphere' (size = nombre), label, color {r,g,b,a}, mesh (chaîne ou liste) à mettre en surbrillance, alphaOnUsed. Les variantes baseTranslationGlobal* tiennent compte des rotations/déplacements du composant (écrites aussi sous 'xxxWithNodeTransforms').
- Le cid du trigger doit être égal à l'id renvoyé par le moteur (addTrigger) ; sinon erreur 'Trigger cId desync' et le trigger est ignoré.
- triggerEventLinks2 : champs obligatoires triggerId, triggerInput, inputAction ; inputAction peut avoir la forme 'namespace:action' (namespace par défaut 'vehicle'). Les liens v1 (triggerEventLinks) exigent targetEventId, triggerId et action et déclenchent un avertissement 'Legacy' dans le journal ; ils sont convertis en actions d'entrée du véhicule (vehicle.inputActions, ctx 'vlua', cat 'vehicle_specific').
- Lors de la conversion v1, le label du trigger, s'il est non vide, devient le titre de l'action et est vidé sur le trigger.
- Les lignes avec un champ manquant sont ignorées avec un print (et non un log) du contenu.
- Les triggers ne sont créés que quand l'objet véhicule moteur existe (VM GE).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_events.process(objID, vehicleObj, vehicle)` | Traite events, triggers et liens trigger-évènement du véhicule (crée les triggers dans le moteur et remplit vehicle.triggerEventLinksDict). *(interne)* | 324 |

### Détail des paramètres

#### `jbeam_sections_events.process(objID, vehicleObj, vehicle)`

Traite events, triggers et liens trigger-évènement du véhicule (crée les triggers dans le moteur et remplit vehicle.triggerEventLinksDict).

- `objID` (*integer*) : Identifiant du véhicule (non utilisé).
- `vehicleObj` (*userdata*) : Objet véhicule moteur (addTrigger, getTrigger).
- `vehicle` (*table*) : Données jbeam du véhicule (modifiées en place).

**Charge les extensions :** `core_vehicleTriggers`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/events.lua`.*
