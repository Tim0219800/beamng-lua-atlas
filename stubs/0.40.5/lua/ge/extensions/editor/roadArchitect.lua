---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre principale de l'éditeur Road Architect du world editor : outil de création de routes, profils, groupes de prefabs, jonctions (dont auto-jonction), terraformage, import/export OpenDRIVE (.xodr) et conversion de DecalRoad en routes Road Architect. Ce fichier est surtout l'interface ImGui et l'orchestration ; la logique est déléguée aux modules editor/roadArchitect/* (roads, profiles, groups, junctions, link, render, terraform, staticMeshMgr, utilities, openDriveImport, openDriveExport). Il ne sert à un moddeur que pour comprendre le cycle de vie (enregistrement du mode d'édition, sérialisation de session) ou en ouvrant l'éditeur.
--- Accès : extension `editor_roadArchitect` : `extensions.load("editor_roadArchitect")`, puis la globale `editor_roadArchitect`
---@class editor_roadArchitect
editor_roadArchitect = {}

--- Relit temp/roadArchitect.json après un rechargement Lua et reconstruit profils (d'abord), routes, groupes, jonctions et liste des groupes placés ; met à jour les conditions des routes, recalcule les données de rendu et les drapeaux de voies du profil de la route sélectionnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadArchitect.lua:8073
function editor_roadArchitect.onDeserialized() end

--- Callback de rendu de l'éditeur, appelé à chaque frame par le world editor. Sort immédiatement si Road Architect n'est pas actif ; sinon lit l'état de la souris (position projetée sur la carte, clics gauche/droit, double-clic) et dessine les fenêtres ImGui et les aides visuelles de l'outil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadArchitect.lua:7697
function editor_roadArchitect.onEditorGui() end

--- Appelé à l'initialisation du world editor. Enregistre le mode d'édition roadArchitectEditMode (icône autobahn), ajoute l'entrée « Convert to Road Architect » au menu contextuel de l'arbre de scène, enregistre les fenêtres de l'outil (principale, matériaux, meshes, nœuds, profils, groupes, import), récupère le terrain, et vide les routes/jonctions si le niveau a changé depuis la dernière session.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadArchitect.lua:7947
function editor_roadArchitect.onEditorInitialized() end

--- Sérialise la session (routes, profils, groupes, jonctions, groupes placés) dans temp/roadArchitect.json avant un rechargement Lua. Ferme d'abord les fenêtres de liste de profils/groupes et de sélection de mesh si ouvertes, puis retire routes, meshes et decals de la scène.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadArchitect.lua:7993
---@return table  { d = { name = 'roadArchitectSerializationData' } } ; les données elles-mêmes sont écrites dans le fichier temporaire.
function editor_roadArchitect.onSerialize() end

