# `core_input_vibrationDebug`

*Fichier : `lua/ge/extensions/core/input/vibrationDebug.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_input_vibrationDebug` : `extensions.load("core_input_vibrationDebug")`, puis la globale `core_input_vibrationDebug`

Extension GE `core_input_vibrationDebug` : fenêtre ImGui de debug « Vibration Debug » pour régler en direct les paramètres des vibrations de manette (haptics) du véhicule du joueur. Chaque champ modifié envoie une commande à l'extension haptics côté véhicule. Utile pour tester le retour de force, pas pour une API durable.

## Remarques

- La fenêtre est dessinée à chaque onUpdate tant que l'extension est chargée ; les champs ne s'affichent que si un véhicule joueur existe.
- Commandes envoyées au véhicule : haptics.setWheelSlipForceMultiplier(x), haptics.setJerkForceMultiplier(x), haptics.setWheelSlipMin(x), haptics.setJerkMin(x).
- Incohérence : valeur initiale de wheelSlipMin = 2.0, mais onVehicleSwitched la remet à 4 (jerkMin 30 et multiplicateurs 1 identiques) ; les valeurs affichées ne sont pas renvoyées au nouveau véhicule, seul l'affichage est réinitialisé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_input_vibrationDebug.onUpdate()` | Hook par image : dessine la fenêtre ImGui et envoie au véhicule joueur 0 les nouvelles valeurs de multiplicateur de force (glissement des roues, à-coups) et de seuils minimaux. *(interne)* *(hook)* | 14 |
| `core_input_vibrationDebug.onVehicleSwitched()` | Hook au changement de véhicule : remet les champs de la fenêtre à leurs valeurs par défaut (multiplicateurs 1, wheelSlipMin 4, jerkMin 30) sans les renvoyer au véhicule. *(interne)* *(hook)* | 34 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/input/vibrationDebug.lua`.*
