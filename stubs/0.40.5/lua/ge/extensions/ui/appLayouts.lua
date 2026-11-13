---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appLayouts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les dispositions (layouts) des apps de l'interface : lecture, création, copie, renommage, suppression et réinitialisation des fichiers `*.uilayout.json`, ainsi que l'ajout, le retrait et le déplacement des apps dans un layout. Les layouts d'origine sont dans `/settings/ui_apps/originalLayouts/`, ceux de l'utilisateur dans `/settings/ui_apps/layouts/`. Une table type de layout vers fichier est mémorisée dans `/temp/ui-layout-map.json`. Sert aux moddeurs qui veulent changer les apps affichées par code ; l'éditeur Vue s'appuie sur les mêmes fonctions.
--- Accès : extension `ui_appLayouts` : `extensions.load("ui_appLayouts")`, puis la globale `ui_appLayouts`
---@class ui_appLayouts
---@field dependencies table<integer, string> Extensions chargées avant : `{'ui_apps'}`.
ui_appLayouts = {}

--- Ajoute une app à la fin d'un layout, avec un placement facultatif. Refuse les apps obsolètes.
---Source : lua/ge/extensions/ui/appLayouts.lua:528
---@param layoutId string Fichier du layout.
---@param appName string Nom de l'app.
---@param placement table|nil Position et taille de l'app.
---@return boolean  true si ajoutée.
function ui_appLayouts.addApp(layoutId, appName, placement) end

--- Remplace le placement d'une app d'un layout et écrit le fichier.
---Source : lua/ge/extensions/ui/appLayouts.lua:573
---@param layoutId string Fichier du layout.
---@param appInstanceIdOrIndex integer|string Indice 0-based ou "appName-<idx>".
---@param placement table Nouveau placement.
---@return boolean  true si appliqué.
function ui_appLayouts.applyPlacementPatch(layoutId, appInstanceIdOrIndex, placement) end

--- Remplace les réglages d'une app d'un layout et écrit le fichier.
---Source : lua/ge/extensions/ui/appLayouts.lua:600
---@param layoutId string Fichier du layout.
---@param appInstanceIdOrIndex integer|string Indice 0-based ou "appName-<idx>".
---@param settings table Nouveaux réglages de l'app.
---@return boolean  true si appliqué.
function ui_appLayouts.applySettingsPatch(layoutId, appInstanceIdOrIndex, settings) end

--- Efface la préférence de layout d'un type.
---Source : lua/ge/extensions/ui/appLayouts.lua:678
---@param layoutType string Type de layout.
---@return boolean  true si une préférence existait.
function ui_appLayouts.clearLayoutForType(layoutType) end

--- Crée un nouveau layout. Sans `filename`, un nom libre est déduit du titre dans le dossier utilisateur. Titre par défaut "My Layout", type par défaut "custom".
---Source : lua/ge/extensions/ui/appLayouts.lua:455
---@param data table|nil Champs facultatifs : title, type, apps, description, devonly, version, filename.
---@return string|nil  Nom de fichier créé, nil si aucun nom n'est disponible.
function ui_appLayouts.createLayout(data) end

--- Supprime le fichier d'un layout, sauf s'il fait partie du contenu officiel (un message est loggé et rien n'est supprimé).
---Source : lua/ge/extensions/ui/appLayouts.lua:267
---@param filenameToDelete string Fichier à supprimer.
---@return boolean  true si le layout a été trouvé (même si la suppression a été refusée), false sinon.
function ui_appLayouts.deleteLayout(filenameToDelete) end

--- Copie un layout dans un nouveau fichier (titre « <titre> copy » par défaut) en retirant le drapeau `default`.
---Source : lua/ge/extensions/ui/appLayouts.lua:497
---@param filename string Fichier du layout source.
---@param newTitle string|nil Titre de la copie.
---@return string|nil  Nom du fichier de la copie, nil en cas d'échec.
function ui_appLayouts.duplicateLayout(filename, newTitle) end

--- Liste tous les layouts disponibles (originaux sans copie utilisateur + fichiers utilisateur), après mise à jour des fichiers utilisateur depuis les originaux et filtrage des apps supprimées.
---Source : lua/ge/extensions/ui/appLayouts.lua:101
---@return table<integer, table>  Layouts avec `apps`, `title`, `type`, `filename`, `resettable`, `userFileExists`, `default`.
function ui_appLayouts.getAvailableLayouts() end

--- Renvoie le layout actuellement actif (après filtrage des apps obsolètes), ou nil.
---Source : lua/ge/extensions/ui/appLayouts.lua:355
---@return table|nil  Layout courant.
function ui_appLayouts.getCurrentLayout() end

--- Renvoie le fichier de layout mémorisé pour un type.
---Source : lua/ge/extensions/ui/appLayouts.lua:687
---@param layoutType string Type de layout.
---@return string|nil  Nom du fichier, ou nil.
function ui_appLayouts.getLayoutForType(layoutType) end

--- Renvoie le mode de caméra de chaque joueur (multi-siège) ; "unicycle" si le joueur marche.
---Source : lua/ge/extensions/ui/appLayouts.lua:643
---@return table<integer, table>  Liste de `{player, name}`.
function ui_appLayouts.getPlayerCameraModes() end

--- Renvoie une copie de la table type de layout vers fichier.
---Source : lua/ge/extensions/ui/appLayouts.lua:692
---@return table<string, string>  Préférences par type.
function ui_appLayouts.getTypeLayoutMap() end

--- Indique si le mode édition est actif.
---Source : lua/ge/extensions/ui/appLayouts.lua:634
---@return boolean  État du mode édition.
function ui_appLayouts.isEditing() end

--- Hook appelé quand la caméra d'un joueur change. Envoie `PlayerCameraModeChanged` à l'UI avec `{player, name}`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appLayouts.lua:657
---@param player integer|nil Indice du joueur (0 par défaut).
---@param camName string|nil Nom du mode de caméra.
function ui_appLayouts.onCameraChanged(player, camName) end

--- Retire une app d'un layout par indice (0-based) ou par identifiant "nom-indice".
---Source : lua/ge/extensions/ui/appLayouts.lua:548
---@param layoutId string Fichier du layout.
---@param appInstanceIdOrIndex integer|string Indice 0-based ou "appName-<idx>".
---@return boolean  true si retirée.
function ui_appLayouts.removeApp(layoutId, appInstanceIdOrIndex) end

--- Change le titre d'un layout. Refuse les layouts du contenu officiel.
---Source : lua/ge/extensions/ui/appLayouts.lua:482
---@param filename string Fichier du layout.
---@param title string Nouveau titre.
---@return boolean  true si renommé.
function ui_appLayouts.renameLayout(filename, title) end

--- Réinitialise un layout utilisateur en supprimant son fichier, ce qui fait réapparaître l'original. Refuse les fichiers hors du dossier utilisateur.
---Source : lua/ge/extensions/ui/appLayouts.lua:299
---@param filenameToReset string|nil Fichier utilisateur à réinitialiser.
---@param layoutType string|nil Type utilisé pour retrouver l'original si le fichier n'en a pas.
---@return string|boolean  Nom de fichier du layout réinitialisé, ou false en cas d'échec.
function ui_appLayouts.resetLayout(filenameToReset, layoutType) end

--- Recharge le layout mémorisé par setUsedLayout comme layout courant. Renvoie le layout courant tel quel si aucun n'a été choisi.
---Source : lua/ge/extensions/ui/appLayouts.lua:443
---@return table|nil  Layout courant.
function ui_appLayouts.resetUsedLayout() end

--- Enregistre un layout sur disque (champ `filename` obligatoire) puis notifie les consommateurs.
---Source : lua/ge/extensions/ui/appLayouts.lua:261
---@param data table Layout à écrire, avec `filename`.
function ui_appLayouts.saveLayout(data) end

--- Définit le layout courant à partir d'un nom de fichier ou d'une table de layout, puis notifie le changement. Renvoie nil si le fichier est introuvable.
---Source : lua/ge/extensions/ui/appLayouts.lua:360
---@param layoutOrFilename string|table Chemin du fichier du layout ou table de layout.
---@return table|nil  Le layout courant.
function ui_appLayouts.setCurrentLayout(layoutOrFilename) end

--- Active ou désactive le mode édition des layouts.
---Source : lua/ge/extensions/ui/appLayouts.lua:629
---@param enabled boolean Nouvel état.
---@return boolean  État enregistré.
function ui_appLayouts.setEditing(enabled) end

--- Mémorise le layout à utiliser pour un type de layout.
---Source : lua/ge/extensions/ui/appLayouts.lua:665
---@param layoutType string Type de layout.
---@param filename string Fichier du layout (doit exister).
---@return boolean  true si enregistré.
function ui_appLayouts.setLayoutForType(layoutType, filename) end

--- Choisit le layout à utiliser à partir d'un nom de fichier ou d'un type. Un choix explicite par fichier est mémorisé comme préférence du type, sauf s'il s'agit du layout par défaut du type (la préférence est alors effacée).
---Source : lua/ge/extensions/ui/appLayouts.lua:415
---@param idOrType string Nom de fichier du layout ou type de layout.
---@return table|nil  Layout activé, nil s'il est introuvable.
function ui_appLayouts.setUsedLayout(idOrType) end

