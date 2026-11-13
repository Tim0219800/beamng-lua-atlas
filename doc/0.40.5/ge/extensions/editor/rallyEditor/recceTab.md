# `editor_rallyEditor_recceTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/recceTab.lua` · VM : Game Engine (GE) · 174 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/recceTab")` (fichier sous extensions/ mais pas une extension classique)

Onglet « Recce » de l'éditeur de rallye. Il charge l'enregistrement de reconnaissance de la mission (driveline + « cuts », via gameplay/rally/recce), affiche le nombre de points et la longueur de la driveline, permet de la sous-échantillonner (seuil de rectitude entre 0.98 et 1.0) et d'importer un pacenote par cut dans le notebook. Peut dessiner en 3D les étiquettes de timestamp de la driveline. Le module renvoie un constructeur de classe C.

## Remarques

- Aucune fonction exportée : on obtient une instance avec require(...)(rallyEditor).
- Plus le seuil de rectitude est proche de 1, plus on garde de points (infobulle de l'interface).
- Dans drawSectionV3, self.originalDrivelineSize et self.recce.driveline sont utilisés sans test si refresh() a échoué : erreur possible dans ce cas.

## Classe `C`

Instance de l'onglet Recce (windowDescription = 'Recce').

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_recceTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:downsample()` | Remplace la driveline du recce par une version sous-échantillonnée selon straightnessThreshold. | 54 |
| `C:draw(mouseInfo)` | Dessine l'onglet (ne fait rien sans notebook). | 156 |
| `C:drawDebugEntrypoint(mouseInfo)` | Dessin debug 3D : appelle recce:drawDebugRecce avec l'option d'étiquettes. | 161 |
| `C:drawSectionV3()` | Dessine l'interface : rafraîchir, étiquettes, infos driveline/cuts, bouton Import, bouton Downsample et curseur de seuil. | 59 |
| `C:formatDistance(dist)` | Formate une distance en « 123.456m », ou en km au-delà de 950 m. | 43 |
| `C:import()` | Crée les données de pacenotes depuis les cuts, les ajoute au notebook (appendPacenotes) et affiche l'onglet Pacenotes. | 147 |
| `C:init(rallyEditor)` | Constructeur : mémorise rallyEditor ; recce = nil, drawLabels = false. | 14 |
| `C:refresh()` | Recrée l'objet Recce pour le dossier de la mission et charge driveline et cuts ; mémorise la taille d'origine. Log d'erreur en cas d'échec. | 138 |
| `C:selected()` | Appelé quand l'onglet est sélectionné : recharge le recce (refresh) et émet onEditorEditModeChanged(nil, nil). | 29 |
| `C:setPath(path)` | Définit le notebook courant. | 24 |
| `C:unselect()` | Appelé quand l'onglet est quitté : émet onEditorEditModeChanged(nil, nil). | 37 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/recceTab.lua`.*
