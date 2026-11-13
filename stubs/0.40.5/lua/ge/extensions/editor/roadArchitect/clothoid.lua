---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/clothoid.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Copyright (c) 2024, Enrico Bertolazzi, Marco Frego and BeamNG
---  All rights reserved.
---  Redistribution and use in source and binary forms, with or without
---  modification, are permitted provided that the following conditions are
---  met:
---      * Redistributions of source code must retain the above copyright
---        notice, this list of conditions and the following disclaimer.
---      * Redistributions in binary form must reproduce the above copyright
---        notice, this list of conditions and the following disclaimer in
---        the documentation and/or other materials provided with the distribution
---  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
---  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
---  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
---  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
---  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
---  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
---  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
---  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
---  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
---  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
---  POSSIBILITY OF SUCH DAMAGE.
---  The code in this module is heavily based on the code described here: https://ebertolazzi.github.io/Clothoids/
---  and also described in the following papers:
---  https://doi.org/10.1002/mma.3114
---  https://doi.org/10.1016/j.cam.2018.03.029
--- Accès : extension `editor_roadArchitect_clothoid` : `extensions.load("editor_roadArchitect_clothoid")`, puis la globale `editor_roadArchitect_clothoid`
---@class editor_roadArchitect_clothoid
editor_roadArchitect_clothoid = {}

--- Evaluates a Clothoid (Euler) spiral, at some parameter p in [0, geodesic length].
---  [INPUTS: Start point = start, Heading (rad) = theta0, Curvature = kappa, Rate of change of curvature of length = dKappa].
---Source : lua/ge/extensions/editor/roadArchitect/clothoid.lua:296
---@param start any
---@param theta0 any
---@param kappa any
---@param dKappa any
---@param p any
function editor_roadArchitect_clothoid.evaluate(start, theta0, kappa, dKappa, p) end

