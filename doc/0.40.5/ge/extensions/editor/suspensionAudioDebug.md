# `editor_suspensionAudioDebug`

*Fichier : `lua/ge/extensions/editor/suspensionAudioDebug.lua` · VM : Game Engine (GE) · 155 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_suspensionAudioDebug` : `extensions.load("editor_suspensionAudioDebug")`, puis la globale `editor_suspensionAudioDebug`

Petite fenêtre de débogage de l'éditeur (menu Audio) qui trace les sons de suspension du véhicule joueur. À chaque frame elle demande au véhicule (queueLuaCommand) de renvoyer sounds.getBeamSounds() vers la GE dans editor_suspensionAudioDebug.beamSounds, puis affiche, pour chaque roue (avant/arrière, gauche/droite), des courbes sur 200 échantillons de l'impulsion, du pitch et du volume. La position de la roue est déduite de la position du noeud id1 de la poutre.

## Remarques

- La position est déduite du signe de pos.y (<0 = Front, sinon Rear) et pos.x (<0 = Right, sinon Left), d'après les coordonnées jbeam du véhicule.
- Le commentaire du code précise que l'impulsion affichée n'est pas vraiment du stress : le nommage est approximatif dans sounds.lua.
- Rien n'est affiché sans véhicule joueur ni vdata.
- Le fichier est présenté dans le code comme une petite application d'exemple à copier avant modification.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_suspensionAudioDebug.onEditorGui()` | Hook de dessin appelé chaque frame : récupère les sons de poutres du véhicule, met à jour les historiques et dessine les courbes par roue. *(interne)* *(hook)* | 19 |
| `editor_suspensionAudioDebug.onEditorInitialized()` | Hook d'initialisation de l'éditeur : enregistre la fenêtre (500x200) et l'entrée de menu dans le groupe Audio. *(interne)* *(hook)* | 134 |
| `editor_suspensionAudioDebug.onExtensionLoaded()` | Hook de chargement de l'extension ; vide. *(interne)* *(hook)* | 127 |
| `editor_suspensionAudioDebug.onExtensionUnloaded()` | Hook de déchargement de l'extension ; vide. *(interne)* *(hook)* | 131 |
| `editor_suspensionAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player)` | Hook appelé au changement de véhicule : vide les historiques et remet le compteur à 1. *(interne)* *(hook)* | 139 |
| `editor_suspensionAudioDebug.open()` | Affiche la fenêtre 'Suspension Audio Debug'. | 122 |

### Détail des paramètres

#### `editor_suspensionAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player)`

Hook appelé au changement de véhicule : vide les historiques et remet le compteur à 1.

- `oldVehicle` (*any*) : Ancien véhicule.
- `newVehicle` (*any*) : Nouveau véhicule.
- `player` (*any*) : Joueur concerné.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/suspensionAudioDebug.lua`.*
