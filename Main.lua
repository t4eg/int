require "Roller"

cluName = "clu"

kotlowniaRoller = Roller:new("kotlownia_roller", "kotlownia_roller_up", "kotlownia_roller_down", 4000, 2000)

kotlowniaRoller.open()

local clock = os.clock
function sleep(n)  -- seconds
local t0 = clock()
while clock() - t0 <= n do end
end

sleep(1)

kotlowniaRoller.close()
