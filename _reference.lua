local debug = true

function print2(txt)
    if debug then
        print(txt)
    end
end

-------------------------------------------------------

CLU_0d1cf0d6 = {}

function CLU_0d1cf0d6.execute(num, val)
    if num == 0 then
        print2("CLU log " .. val)
    elseif num == 1 then
        print2("CLU clear log")
    end
end

_DOUT = require "_DOUT"

DOUT_8076 = _DOUT.new("DOUT_8076")
DOUT_6711 = _DOUT.new("DOUT_6711")
