# `editor_crawlEditor_presets`

*Fichier : `lua/ge/extensions/editor/crawlEditor/presets.lua` · VM : Game Engine (GE) · 979 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/crawlEditor/presets")` (fichier sous extensions/ mais pas une extension classique)

Gestionnaire de presets et de composants de l'éditeur Crawl (trails, frontières/boundaries, chemins/pathnodes). Le module renvoie une classe C (constructeur) et n'est pas une extension classique. Les presets sont stockés dans un fichier JSON par niveau (/levels/<niveau>/crawls/presets.json, ou settings/cloud/crawls/presets.json si aucun niveau n'est chargé) ; les « composants » sont délégués au module gameplay/crawl/saveSystem. Fournit aussi le menu ImGui « Components » et les dialogues de sauvegarde/gestion.

## Remarques

- Le chemin du fichier de presets (self.PRESETS_FILE) est calculé une seule fois dans init() à partir du niveau courant ; si le niveau change, il faut recréer l'objet.
- Les fonctions save/delete/import/export renvoient (boolean, chemin|nil) ; les fonctions load*Preset renvoient (objet|nil, chemin du fichier|nil).
- Un preset stocké est une table {name, category, data, created, modified} ; category vaut "trails", "boundaries" ou "pathnodes" (self.PRESET_CATEGORIES).
- Fichier d'export/import individuel : extension prévue self.PRESET_EXTENSION = ".preset.json".

## Classe `C`

Objet presets de l'éditeur Crawl. Champs principaux : presets (categories + metadata), PRESETS_FILE, PRESET_CATEGORIES, showSave*Dialog, showPresetManager(Ptr), *PresetName (buffers ImGui de 256 caractères).

Le module renvoie un constructeur : `local obj = require("editor_crawlEditor_presets")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:deleteBoundaryComponent(id)` | Supprime un composant de frontière via saveSystem. | 632 |
| `C:deleteBoundaryPreset(name)` | Supprime le preset de frontière et sauvegarde le fichier. Renvoie false, nil si le preset n'existe pas. | 469 |
| `C:deletePathnodeComponent(id)` | Supprime un composant de chemin via saveSystem. | 636 |
| `C:deletePathnodePreset(name)` | Supprime le preset de chemin et sauvegarde le fichier. | 484 |
| `C:deleteTrailComponent(id)` | Supprime un composant de trail via saveSystem. | 628 |
| `C:deleteTrailPreset(name)` | Supprime le preset de trail et sauvegarde le fichier. | 499 |
| `C:drawDialogs()` | Dessine les fenêtres ImGui de sauvegarde (frontière, chemin, trail) et le gestionnaire de composants ; appelé à chaque frame par l'éditeur Crawl. | 791 |
| `C:drawMenu(crawlData, trails, waypoints)` | Dessine les sous-menus ImGui listant les composants de trail, frontière et chemin (clic = chargement dans crawlData) et l'entrée « Manage Components... ». Mémorise crawlData, trails et waypoints pour les dialogues. | 697 |
| `C:exportPreset(category, name, filepath)` | Écrit un preset (table complète) dans un fichier JSON indépendant. | 640 |
| `C:getAllBoundaryComponents()` | Liste les composants de frontière du niveau courant via saveSystem. | 543 |
| `C:getAllPathnodeComponents()` | Liste les composants de chemin du niveau courant via saveSystem. | 548 |
| `C:getAllTrailComponents()` | Liste les composants de trail du niveau courant via saveSystem (dossier /levels/<niveau>/crawls/). | 538 |
| `C:getBoundaryPresetName()` | Renvoie le buffer ImGui (256 caractères) du nom saisi pour une frontière. | 693 |
| `C:getBoundaryPresets()` | Liste les presets de frontières sous forme de tableau {name, preset} (ordre non garanti, issu de pairs). | 514 |
| `C:getPathnodePresetName()` | Renvoie le buffer ImGui du nom saisi pour un chemin. | 694 |
| `C:getPathnodePresets()` | Liste les presets de chemins sous forme de {name, preset}. | 522 |
| `C:getShowPresetManager()` | Indique si la fenêtre de gestion des composants est affichée. | 687 |
| `C:getShowPresetManagerPtr()` | Renvoie le BoolPtr ImGui lié à la fenêtre de gestion. | 692 |
| `C:getShowSaveBoundaryDialog()` | Indique si le dialogue de sauvegarde de frontière est affiché. | 681 |
| `C:getShowSavePathnodeDialog()` | Indique si le dialogue de sauvegarde de chemin est affiché. | 683 |
| `C:getShowSaveTrailDialog()` | Indique si le dialogue de sauvegarde de trail est affiché. | 685 |
| `C:getTrailPresetName()` | Renvoie le buffer ImGui du nom saisi pour un trail. | 695 |
| `C:getTrailPresets()` | Liste les presets de trails sous forme de {name, preset}. | 530 |
| `C:importPreset(filepath, category)` | Lit un fichier de preset, vérifie nom, catégorie et données, l'ajoute à la catégorie (écrase un preset de même nom) et sauvegarde. | 657 |
| `C:init()` | Initialise la table de presets vide, les états des dialogues et les buffers ImGui, calcule le chemin du fichier de presets pour le niveau courant puis appelle loadPresets(). | 36 |
| `C:loadBoundaryComponent(id)` | Charge un composant de frontière par id via saveSystem. | 558 |
| `C:loadBoundaryPreset(name)` | Valide puis désérialise le preset de frontière nommé. | 400 |
| `C:loadPathnodeComponent(id)` | Charge un composant de chemin par id via saveSystem. | 563 |
| `C:loadPathnodePreset(name)` | Valide puis désérialise le preset de chemin nommé. | 423 |
| `C:loadPresets()` | Lit le fichier JSON de presets ; s'il n'existe pas, écrit immédiatement un fichier vide via savePresets(). | 280 |
| `C:loadTrailComponent(id)` | Charge un composant de trail par id via saveSystem. | 553 |
| `C:loadTrailPreset(name)` | Valide puis désérialise le preset de trail nommé. | 446 |
| `C:saveBoundaryComponent(name, boundary)` | Renomme la frontière puis l'enregistre comme composant via saveSystem. | 588 |
| `C:saveBoundaryPreset(name, boundary)` | Sérialise une frontière (boundary:onSerialize) et l'enregistre comme preset de catégorie boundaries, puis sauvegarde le fichier. Échoue si le nom est vide ou si la frontière n'a aucun sommet. | 307 |
| `C:savePathnodeComponent(name, path)` | Renomme le chemin puis l'enregistre comme composant via saveSystem. | 608 |
| `C:savePathnodePreset(name, path)` | Enregistre un chemin (nom, description, nœuds avec position, rotation, rayon par défaut 6.0, flags) comme preset pathnodes. | 338 |
| `C:savePresets()` | Met à jour la date de modification, crée le dossier si besoin (FS:directoryCreate) et écrit tout le fichier de presets. | 289 |
| `C:saveTrailComponent(name, trail)` | Renomme le trail (trail.name = name) puis l'enregistre comme composant via saveSystem. | 568 |
| `C:saveTrailPreset(name, trail)` | Sérialise un trail complet (chemin + frontière) et l'enregistre comme preset trails. | 369 |
| `C:setShowPresetManager(show)` | Affiche/masque la fenêtre de gestion et synchronise le pointeur ImGui. | 688 |
| `C:setShowSaveBoundaryDialog(show)` | Affiche/masque le dialogue de sauvegarde de frontière. | 682 |
| `C:setShowSavePathnodeDialog(show)` | Affiche/masque le dialogue de sauvegarde de chemin. | 684 |
| `C:setShowSaveTrailDialog(show)` | Affiche/masque le dialogue de sauvegarde de trail. | 686 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/presets.lua`.*
