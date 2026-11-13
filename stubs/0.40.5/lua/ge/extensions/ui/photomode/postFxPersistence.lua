---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/postFxPersistence.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sauvegarde et relecture sur disque de l'état des effets de post-traitement du mode photo (profondeur de champ, flou de mouvement, occlusion spéculaire, qualité SSAO/SSR/reflets/miroirs, visibilité des occupants). Le fichier sert à restaurer les réglages d'origine du joueur après une session photo. Les valeurs lues sont normalisées (booléens, nombres, chaînes) et les champs inconnus sont ignorés.
--- Accès : extension `ui_photomode_postFxPersistence` : `extensions.load("ui_photomode_postFxPersistence")`, puis la globale `ui_photomode_postFxPersistence`
---@class ui_photomode_postFxPersistence
---@field RESTORE_STATE_FILE string Chemin relatif du fichier de sauvegarde : "settings/photomodePostFxRestoreState.json".
ui_photomode_postFxPersistence = {}

--- Lit le fichier de sauvegarde et renvoie l'état normalisé des effets, ou nil si le fichier est absent, illisible ou sans champ connu.
---Source : lua/ge/extensions/ui/photomode/postFxPersistence.lua:145
---@return table|nil  État normalisé des effets.
function ui_photomode_postFxPersistence.loadRestoreState() end

--- Normalise la table d'effets puis l'écrit dans RESTORE_STATE_FILE. Renvoie nil, false si la table n'est pas valide ou ne contient aucun champ connu.
---Source : lua/ge/extensions/ui/photomode/postFxPersistence.lua:137
---@param effectsState table Table d'effets (champs listés dans les notes) ; les champs inconnus sont ignorés.
---@return table|nil  État normalisé, ou nil si rien à sauvegarder.
---@return boolean  true si l'écriture du fichier a réussi (une erreur est journalisée sinon).
function ui_photomode_postFxPersistence.saveRestoreState(effectsState) end

