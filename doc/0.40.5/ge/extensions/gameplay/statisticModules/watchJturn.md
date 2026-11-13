# `gameplay_statisticModules_watchJturn`

*Fichier : `lua/ge/extensions/gameplay/statisticModules/watchJturn.lua` · VM : Game Engine (GE) · 112 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_statisticModules_watchJturn` : `extensions.load("gameplay_statisticModules_watchJturn")`, puis la globale `gameplay_statisticModules_watchJturn`

Module de statistiques qui détecte les « J-turns » (demi-tour en marche arrière puis marche avant) du véhicule joueur et incrémente la métrique « vehicle/jturn » via gameplay_statistic.metricAdd. Il est appelé par gameplay_statistic avec la fonction workload à chaque tour de surveillance.

## Remarques

- Condition : vitesse > 8 m/s ; direction du véhicule opposée à la vitesse (produit scalaire < -0,96) = marche arrière ; puis retour à l'avant (> 0,96) avec direction initiale de recul opposée à la vitesse actuelle (< -0,90) pendant plus d'1 s. Délai max de 4 s après le dernier recul, sinon annulé.
- Le commentaire du code indique que simTime « is probably broken » : il est cumulé à partir de dtSim.
- La fonction onPreRender (debug) est commentée à l'export et référence une variable vpos non définie : ne pas l'activer.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_statisticModules_watchJturn.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; ne fait rien. *(interne)* *(hook)* | 91 |
| `gameplay_statisticModules_watchJturn.onVehicleResetted(vid)` | Hook appelé quand un véhicule est réinitialisé : annule la détection s'il s'agit du véhicule suivi. *(interne)* *(hook)* | 87 |
| `gameplay_statisticModules_watchJturn.onVehicleSwitched(oldid, newid, player)` | Hook appelé au changement de véhicule contrôlé : annule la détection. *(interne)* *(hook)* | 94 |
| `gameplay_statisticModules_watchJturn.workload(v, vid, dtSim)` | Analyse un véhicule à chaque appel (vitesse, direction) et compte un J-turn quand la séquence recul puis marche avant est détectée. *(interne)* | 29 |

### Détail des paramètres

#### `gameplay_statisticModules_watchJturn.onVehicleResetted(vid)`

Hook appelé quand un véhicule est réinitialisé : annule la détection s'il s'agit du véhicule suivi.

- `vid` (*integer*) : Identifiant du véhicule.

#### `gameplay_statisticModules_watchJturn.onVehicleSwitched(oldid, newid, player)`

Hook appelé au changement de véhicule contrôlé : annule la détection.

- `oldid` (*integer*) : Ancien véhicule.
- `newid` (*integer*) : Nouveau véhicule.
- `player` (*integer*) : Indice du joueur.

#### `gameplay_statisticModules_watchJturn.workload(v, vid, dtSim)`

Analyse un véhicule à chaque appel (vitesse, direction) et compte un J-turn quand la séquence recul puis marche avant est détectée.

- `v` (*userdata*) : Objet véhicule.
- `vid` (*integer*) : Identifiant du véhicule ; un changement de véhicule annule la détection.
- `dtSim` (*number*) : Temps simulé écoulé en secondes.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/statisticModules/watchJturn.lua`.*
