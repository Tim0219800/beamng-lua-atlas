---@meta
-- tim19Atlas stub generated from lua/common/libs/luaqrcode/qrencode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- The qrcode library is licensed under the 3-clause BSD license (aka "new BSD")
--- To get in contact with the author, mail to <gundlach@speedata.de>.
--- Please report bugs on the [github project page](http://speedata.github.com/luaqrcode/).
---  Copyright (c) 2012, Patrick Gundlach
---  All rights reserved.
---  Redistribution and use in source and binary forms, with or without
---  modification, are permitted provided that the following conditions are met:
---    * Redistributions of source code must retain the above copyright
---      notice, this list of conditions and the following disclaimer.
---    * Redistributions in binary form must reproduce the above copyright
---      notice, this list of conditions and the following disclaimer in the
---      documentation and/or other materials provided with the distribution.
---    * Neither the name of the <organization> nor the
---      names of its contributors may be used to endorse or promote products
---      derived from this software without specific prior written permission.
---  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
---  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
---  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
---  DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
---  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
---  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
---  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
---  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
---  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
---  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--- Overall workflow
--- The steps to generate the qrcode, assuming we already have the codeword:
--- 1. Determine version, ec level and mode (=encoding) for codeword
--- 1. Encode data
--- 1. Arrange data and calculate error correction code
--- 1. Generate 8 matrices with different masks and calculate the penalty
--- 1. Return qrcode with least penalty
--- Each step is of course more or less complex and needs further description
--- Helper functions
--- We start with some helper functions
---  To calculate xor we need to do that bitwise. This helper table speeds up the num-to-bit
---  part a bit (no pun intended)
--- Accès : `require("libs/luaqrcode/qrencode")`
---@class libs_luaqrcode_qrencode
local libs_luaqrcode_qrencode = {}

--- The main function. We connect everything together. Remember from above:
--- 1. Determine version, ec level and mode (=encoding) for codeword
--- 1. Encode data
--- 1. Arrange data and calculate error correction code
--- 1. Generate 8 matrices with different masks and calculate the penalty
--- 1. Return qrcode with least penalty
---  If ec_level or mode is given, use the ones for generating the qrcode. (mode is not implemented yet)
---Source : lua/common/libs/luaqrcode/qrencode.lua:1220
---@param str any
---@param ec_level any
---@param mode any
function libs_luaqrcode_qrencode.qrcode(str, ec_level, mode) end

return libs_luaqrcode_qrencode
