local G

function G:clearLog()
    CLU_0d1cf0d6:execute(1)
end

local DOUT = classes.class()

function DOUT:init(device)
    self.device = device
end

function DOUT:setValue(val)
    self.device:set(0, val)
end


G.DOUT = DOUT















return G