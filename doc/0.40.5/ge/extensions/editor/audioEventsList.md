# `editor_audioEventsList`

*Fichier : `lua/ge/extensions/editor/audioEventsList.lua` · VM : Game Engine (GE) · 284 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_audioEventsList` : `extensions.load("editor_audioEventsList")`, puis la globale `editor_audioEventsList`

Fenêtre d'éditeur « SFX Previewer » (menu Audio) qui liste tous les événements sonores (FMOD « event:>... » et fichiers son) du jeu et permet de les écouter. La liste vient de Sim.getSFXTrackSet() ; elle est affichée en arborescence de dossiers ou filtrée par une recherche texte. Clic gauche sur un événement = lecture via Engine.Audio.playOnce('AudioGui', nom, {position}) à la position du véhicule joueur (ou 0,0,0) ; clic droit = copier le nom dans le presse-papiers. Utile à un moddeur pour retrouver le nom exact d'un événement à mettre dans un jbeam ou une scène.

## Remarques

- Dépend de editor_main ; aucune fonction publique en dehors des hooks de l'éditeur.
- Les événements dont le nom commence par « event:> » sont découpés sur « > » ; les autres (objets avec getSoundFilename) sont découpés sur « / » d'après le chemin du fichier son.
- L'arbre n'est reconstruit qu'à l'affichage de la fenêtre (onEditorToolWindowShow) ; la table eventsList n'est jamais vidée entre deux reconstructions (déduit du code : seul eventsTree est nettoyé).
- Le son en cours est arrêté puis supprimé (stop(-1) puis delete) avant d'en lancer un autre.

**Dépendances (chargées avant) :** `editor_main`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_audioEventsList.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (500x500) et l'entrée de menu dans le groupe « Audio ». *(interne)* *(hook)* | 273 |
| `editor_audioEventsList.onEditorToolWindowHide(windowName)` | Hook appelé quand une fenêtre d'outil est masquée ; pour « sfxPreviewer », sauvegarde l'état des fenêtres (editor.saveWindowsState). *(interne)* *(hook)* | 263 |
| `editor_audioEventsList.onEditorToolWindowShow(windowName)` | Hook appelé quand une fenêtre d'outil de l'éditeur est affichée ; si c'est « sfxPreviewer », reconstruit la liste des événements sonores. *(interne)* *(hook)* | 257 |
| `editor_audioEventsList.onUpdate(dtReal, dtSim, dtRaw)` | Dessine la fenêtre SFX Previewer (champ de recherche, navigation dans l'arbre des dossiers ou résultats de recherche, bouton « Stop Current Sound »). Ne fait rien si l'éditeur ou la fenêtre ne sont pas enregistrés. *(interne)* *(hook)* | 214 |
| `editor_audioEventsList.onWindowMenuItem()` | Appelé par l'entrée de menu Audio > SFX Previewer ; affiche la fenêtre. *(interne)* *(hook)* | 269 |

### Détail des paramètres

#### `editor_audioEventsList.onEditorToolWindowHide(windowName)`

Hook appelé quand une fenêtre d'outil est masquée ; pour « sfxPreviewer », sauvegarde l'état des fenêtres (editor.saveWindowsState).

- `windowName` (*string*) : Nom de la fenêtre masquée.

#### `editor_audioEventsList.onEditorToolWindowShow(windowName)`

Hook appelé quand une fenêtre d'outil de l'éditeur est affichée ; si c'est « sfxPreviewer », reconstruit la liste des événements sonores.

- `windowName` (*string*) : Nom de la fenêtre affichée.

#### `editor_audioEventsList.onUpdate(dtReal, dtSim, dtRaw)`

Dessine la fenêtre SFX Previewer (champ de recherche, navigation dans l'arbre des dossiers ou résultats de recherche, bouton « Stop Current Sound »). Ne fait rien si l'éditeur ou la fenêtre ne sont pas enregistrés.

- `dtReal` (*number*) : Durée réelle de la frame (s).
- `dtSim` (*number*) : Durée simulée de la frame (s).
- `dtRaw` (*number*) : Durée brute de la frame (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions à charger avant celle-ci : {"editor_main"}. |

## Appels vers le moteur (C++)

- `Sim.` `getSFXTrackSet`, `upcast`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/audioEventsList.lua`.*
