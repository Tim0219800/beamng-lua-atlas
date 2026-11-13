---@meta
-- tim19Atlas stub generated from lua/ge/extensions/trackbuilder/trackBuilder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Interface ImGui de l'éditeur de circuits (Track Builder). Elle pilote le moteur de spline `util_trackBuilder_splineTrack` (chargé via `extensions['util_trackBuilder_splineTrack']`) : ajout et suppression de pièces, modificateurs (largeur, inclinaison, etc.), matériaux, bordures, sous-circuits, sauvegarde avec capture d'écran, mode conduite et modes de peinture (Select, Paint, ChangeMesh, Merge). Un moddeur s'en sert surtout pour ouvrir ou fermer l'éditeur (enter, exit, toggleTrackBuilder) et savoir s'il est actif (isActive). L'éditeur s'ouvre par la route UI `trackBuilder`, par défaut sur le niveau `glow_city`.
--- Accès : extension `trackbuilder_trackBuilder` : `extensions.load("trackbuilder_trackBuilder")`, puis la globale `trackbuilder_trackBuilder`
---@class trackbuilder_trackBuilder
trackbuilder_trackBuilder = {}

--- Ouvre le Track Builder. Si le niveau demandé n'est pas déjà chargé (ou si forceLoad est vrai), le charge en freeroam puis ouvre l'éditeur ; sinon l'ouvre directement. Un niveau introuvable est loggé en erreur et rien n'est fait.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3577
---@param levelName string|nil Nom du niveau (par exemple "glow_city").
---@param forceLoad boolean|nil Force le rechargement du niveau même s'il est déjà chargé.
function trackbuilder_trackBuilder.enter(levelName, forceLoad) end

--- Ferme le Track Builder s'il est actif, sans naviguer lui-même (le routeur garde la navigation), et libère la route de gameplay.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3599
function trackbuilder_trackBuilder.exit() end

--- Annule une entrée en attente, ferme l'éditeur s'il est actif, puis appelle `returnToMainMenu()`.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3609
function trackbuilder_trackBuilder.exitToMainMenu() end

--- Ferme la fenêtre de l'éditeur, restaure le style ImGui BeamNG et réinitialise l'état. Si la fermeture n'est pas pilotée par le routeur, rend la route de gameplay en naviguant vers `play`. Sans effet si non initialisé.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3530
function trackbuilder_trackBuilder.hideTrackBuilder() end

--- Indique si l'éditeur est initialisé et sa fenêtre ouverte.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3573
---@return boolean  true si actif.
function trackbuilder_trackBuilder.isActive() end

--- Hook appelé à la fin d'une mission/niveau. Ferme l'éditeur sauf si une entrée est en attente de chargement de niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3631
function trackbuilder_trackBuilder.onClientEndMission() end

--- Hook appelé par le routeur UI à l'entrée de la route `trackBuilder`. Réserve la route de gameplay et appelle enter avec `params.level` ("glow_city" par défaut) et `params.forceLoad`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3617
---@param context any Contexte de la route (non utilisé).
---@param toRoute table Route d'arrivée ; son champ `params` est lu.
---@param fromRoute any Route de départ (non utilisé).
---@param data any Données de route (non utilisées).
function trackbuilder_trackBuilder.onRouteEnter(context, toRoute, fromRoute, data) end

--- Hook appelé par le routeur UI quand on quitte la route : ferme l'éditeur s'il est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3625
---@param context any Contexte de la route (non utilisé).
---@param toRoute any Route d'arrivée (non utilisé).
---@param fromRoute any Route de départ (non utilisé).
---@param data any Données de route (non utilisées).
function trackbuilder_trackBuilder.onRouteLeave(context, toRoute, fromRoute, data) end

--- Hook appelé à chaque frame. Affiche la fenêtre principale ou la barre du mode conduite, ou rien pendant la prise de capture d'écran de sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:2894
function trackbuilder_trackBuilder.onUpdate() end

--- Hook appelé quand la fenêtre du jeu est redimensionnée. Mémorise la taille d'affichage utilisée par le style.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3343
---@param size table Taille de l'écran avec champs `x` et `y`.
function trackbuilder_trackBuilder.onWindowResized(size) end

--- Affiche l'éditeur : passe en caméra de jeu si la caméra n'est pas libre, puis ouvre la fenêtre.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3521
function trackbuilder_trackBuilder.showTrackBuilder() end

--- Ouvre ou ferme la fenêtre ImGui. À l'ouverture : initialise, récupère le moteur de spline et applique le style ; à la fermeture : désélectionne, masque les marqueurs, et supprime le circuit s'il a 2 pièces ou moins (hors glow_city). Émet toujours le hook `onTrackBuilderWindowToggled(open)`.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3477
---@param show boolean true pour ouvrir, false pour fermer.
function trackbuilder_trackBuilder.showTrackBuilderWindow(show) end

--- Ouvre l'éditeur (en réglant la route de gameplay et en naviguant vers `trackBuilder`) ou le ferme s'il est ouvert.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3552
function trackbuilder_trackBuilder.toggleTrackBuilder() end

--- Table locale de fonctions internes de l'interface (non exportée). Elles modifient le circuit via le moteur de spline puis rafraîchissent les valeurs affichées ; `currentIndex` désigne la pièce sélectionnée.
---@class trackbuilder_trackBuilder_tbFunctions
local trackbuilder_trackBuilder_tbFunctions = {}

--- Démarre le mode conduite : circuit en haute qualité, marqueurs masqués, reset du véhicule 0 et placement sur la pièce donnée, caméra de jeu.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3102
---@param index integer|nil Indice de la pièce de départ.
function trackbuilder_trackBuilder_tbFunctions.drive(index) end

--- Fusionne des segments de circuit via le moteur de spline.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3148
---@param segments table Segments à fusionner.
function trackbuilder_trackBuilder_tbFunctions.mergeMultiTrack(segments) end

--- Applique la valeur d'un modificateur à la pièce courante et reconstruit le circuit.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3070
---@param field string Nom du modificateur.
function trackbuilder_trackBuilder_tbFunctions.modifierChange(field) end

--- Retire un modificateur de la pièce courante.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3078
---@param field string Nom du modificateur.
function trackbuilder_trackBuilder_tbFunctions.modifierRemove(field) end

--- Déplace un modificateur sur la pièce précédente ou suivante.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3085
---@param name string Nom du modificateur.
---@param offset integer 1 ou -1.
function trackbuilder_trackBuilder_tbFunctions.modifierShift(name, offset) end

--- Déplace le curseur : 1 suivant, -1 précédent (avec bouclage), 'first' ou 'last'. Recentre le marqueur et relit les infos de la pièce.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:2966
---@param off integer|string 1, -1, 'first' ou 'last'.
function trackbuilder_trackBuilder_tbFunctions.navigate(off) end

--- Supprime la pièce courante (si l'indice est supérieur à 2), reconstruit le circuit et recule d'une pièce.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3020
function trackbuilder_trackBuilder_tbFunctions.pieceDeleted() end

--- Ajoute ou remplace une pièce avec les paramètres de l'interface. Ctrl remplace, Shift insère après la pièce courante, sans touche ajoute à la fin. Replace le curseur au début si le circuit vient de se fermer.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3031
---@param replace boolean|nil true remplace, false insère ; nil déduit des touches Ctrl/Shift.
function trackbuilder_trackBuilder_tbFunctions.pieceUpdated(replace) end

--- Relit les paramètres de la pièce courante et les valeurs des modificateurs dans l'interface.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:2983
function trackbuilder_trackBuilder_tbFunctions.refreshPieceInfo() end

--- Relit la position et le cap du circuit (cap converti en degrés) dans l'interface.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3127
function trackbuilder_trackBuilder_tbFunctions.refreshTrackPositionRotation() end

--- Passe à un autre sous-circuit et sélectionne sa dernière pièce.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3135
---@param index integer Indice du sous-circuit.
function trackbuilder_trackBuilder_tbFunctions.switchSubTrack(index) end

--- Termine le mode conduite : caméra libre, marqueurs réaffichés, mode Select.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3117
function trackbuilder_trackBuilder_tbFunctions.unDrive() end

---@type number
i = nil
