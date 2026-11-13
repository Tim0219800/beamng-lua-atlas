---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx/ssao.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Occlusion ambiante en espace écran (SSAO, avec normales courbées / GTAO). À l'import, crée l'objet « SSAOPostFx » (PostEffectSSAO) s'il manque, puis règle sa propriété bentNormals d'après le réglage PostFXSpecularOcclusionEnabled, et crée « SSAOVizPostFx » pour visualiser #ssaoMask. Le module garde en mémoire le contraste et le rayon courants et les transmet à l'objet.
--- Accès : globale `ssaoModule`
---@class ssaoModule
ssaoModule = {}

--- Fixe $SSAOPostFx::Enable à true et rétablit le contraste (2) et le rayon (1,5) par défaut.
---Source : lua/ge/client/postFx/ssao.lua:35
function ssaoModule.applyDefaults() end

--- Retourne le contraste mémorisé.
---Source : lua/ge/client/postFx/ssao.lua:44
---@return number  Contraste courant.
function ssaoModule.getContrast() end

--- Retourne le rayon mémorisé.
---Source : lua/ge/client/postFx/ssao.lua:45
---@return number  Rayon courant.
function ssaoModule.getRadius() end

--- Active ou désactive un effet de débogage (GTAOBentNormalsVizPostFx, créé à la demande) qui affiche la carte des normales courbées #gtaoOutput. Sans coût tant qu'il est désactivé.
---Source : lua/ge/client/postFx/ssao.lua:49
---@param enabled boolean true pour afficher, false pour masquer.
function ssaoModule.setBentNormalDebugEnabled(enabled) end

--- Mémorise le contraste du SSAO et l'applique à SSAOPostFx (méthode setContrast de l'objet). Ignoré si la valeur n'est pas convertible en nombre.
---Source : lua/ge/client/postFx/ssao.lua:15
---@param value number|string Nouveau contraste.
function ssaoModule.setContrast(value) end

--- Mémorise le rayon du SSAO et l'applique à SSAOPostFx. Ignoré si la valeur n'est pas numérique.
---Source : lua/ge/client/postFx/ssao.lua:25
---@param value number|string Nouveau rayon (unité de la scène, déduit du code).
function ssaoModule.setRadius(value) end

