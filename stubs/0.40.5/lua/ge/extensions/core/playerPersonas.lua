---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/playerPersonas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_playerPersonas` : identité visuelle des joueurs locaux en multi-joueur (multiseat). Une 'persona' regroupe un nom affiché, une icône, une couleur et éventuellement un véhicule favori, numérotées à partir de 1 (joueur 0 = persona 1). Les valeurs par défaut sont générées : nom traduit 'ui.multiseat.playerTag', icône tirée d'un pool (décalage aléatoire par session), couleur d'une palette de 8 teintes (calculées en OKLCH). Un moddeur s'en sert pour récupérer le nom, la couleur et l'icône d'un joueur local.
--- Accès : extension `core_playerPersonas` : `extensions.load("core_playerPersonas")`, puis la globale `core_playerPersonas`
---@class core_playerPersonas
core_playerPersonas = {}

--- Remplace en place la couleur d'une persona par le gris 'solo' et recalcule colorHex et vehicleFallbackPaint.
---Source : lua/ge/extensions/core/playerPersonas.lua:140
---@param persona table Persona renvoyée par get/preview.
---@return table  La même table (ou la valeur reçue si ce n'est pas une table).
function core_playerPersonas.applySoloColor(persona) end

--- Efface les données enregistrées d'une persona (retour aux valeurs par défaut).
---Source : lua/ge/extensions/core/playerPersonas.lua:171
---@param personaNumber integer Numéro de persona.
---@return boolean  true si quelque chose a été effacé.
function core_playerPersonas.clear(personaNumber) end

--- Efface toutes les personas enregistrées.
---Source : lua/ge/extensions/core/playerPersonas.lua:179
---@return boolean  true si quelque chose a été effacé.
function core_playerPersonas.clearAll() end

--- Construit et renvoie la persona du numéro donné (valeurs enregistrées + valeurs par défaut).
---Source : lua/ge/extensions/core/playerPersonas.lua:134
---@param personaNumber integer Numéro de persona >= 1.
---@return table|nil  Persona, ou nil si le numéro n'est pas valide.
function core_playerPersonas.get(personaNumber) end

--- Nom par défaut : traduction de 'ui.multiseat.playerTag' avec { number }, sinon 'Player N' si core_locales n'est pas chargé.
---Source : lua/ge/extensions/core/playerPersonas.lua:106
---@param personaNumber integer Numéro de persona.
---@return string  Nom par défaut.
function core_playerPersonas.getDefaultDisplayName(personaNumber) end

--- Icône par défaut d'une persona, prise dans le pool avec un décalage aléatoire fixé pour la session.
---Source : lua/ge/extensions/core/playerPersonas.lua:114
---@param personaNumber integer Numéro de persona.
---@return string  Nom d'icône.
function core_playerPersonas.getDefaultIcon(personaNumber) end

--- Renvoie une copie de la liste des icônes de persona disponibles.
---Source : lua/ge/extensions/core/playerPersonas.lua:232
---@return string[]  Noms d'icônes.
function core_playerPersonas.getIconPool() end

--- Convertit un indice de joueur local (0, 1, 2...) en numéro de persona (indice + 1).
---Source : lua/ge/extensions/core/playerPersonas.lua:148
---@param player integer Indice de joueur >= 0.
---@return integer|nil  Numéro, ou nil si invalide.
function core_playerPersonas.getNumberForPlayer(player) end

--- Renvoie le compteur de révision, incrémenté à chaque changement des personas.
---Source : lua/ge/extensions/core/playerPersonas.lua:237
---@return integer  Révision courante.
function core_playerPersonas.getRevision() end

--- Incrémente la révision sans rien modifier, pour forcer les interfaces à se rafraîchir.
---Source : lua/ge/extensions/core/playerPersonas.lua:186
function core_playerPersonas.invalidate() end

--- Indique si une icône fait partie du pool des icônes de persona.
---Source : lua/ge/extensions/core/playerPersonas.lua:233
---@param icon string Nom d'icône.
---@return boolean  true si valide.
function core_playerPersonas.isPersonaIcon(icon) end

--- Construit une persona purement par défaut (sans les valeurs enregistrées) pour un numéro (1 si invalide).
---Source : lua/ge/extensions/core/playerPersonas.lua:230
---@param personaNumber integer|nil Numéro de persona.
---@return table  Persona par défaut.
function core_playerPersonas.preview(personaNumber) end

--- Remplace toutes les personas par celles d'une table (clés = numéros, ou champ number de chaque élément) puis incrémente la révision.
---Source : lua/ge/extensions/core/playerPersonas.lua:197
---@param values table Table de personas { id, displayName, icon, color, vehicle }.
---@return boolean  false si values n'est pas une table.
function core_playerPersonas.replaceAll(values) end

--- Restaure l'état à partir d'un instantané de snapshot() et incrémente la révision.
---Source : lua/ge/extensions/core/playerPersonas.lua:219
---@param value table Instantané avec champ personas.
---@return boolean  false si l'instantané est invalide.
function core_playerPersonas.restoreSnapshot(value) end

--- Enregistre les données d'une persona (id, displayName, icon, color, vehicle) et incrémente la révision.
---Source : lua/ge/extensions/core/playerPersonas.lua:154
---@param personaNumber integer Numéro >= 1.
---@param data table { id, displayName, icon, color = {r,g,b}, vehicle }
---@return boolean  true si enregistré, false si les arguments sont invalides.
function core_playerPersonas.set(personaNumber, data) end

--- Copie profonde de l'état : { personas, revision }.
---Source : lua/ge/extensions/core/playerPersonas.lua:190
---@return table  Instantané.
function core_playerPersonas.snapshot() end

