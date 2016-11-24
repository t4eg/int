local DOUT = Classes.class()

function DOUT:init(dout_ref)
    self.dout_ref = dout_ref
end

function DOUT:getValue()
    self.dout_ref:get(0)
end

function DOUT:setValue(val)
    self.dout_ref:set(0, val)
end

function DOUT:switch()
    self.dout_ref:execute(0, 0)
end

function DOUT:switchOn(val)
    self.dout_ref:execute(1, val)
end

function DOUT:switchOff(val)
    self.dout_ref:execute(2, val)
end

function DOUT:onChange(f)
    self.dout_ref:add_event(0, f)
end

function DOUT:onSwitchOn(f)
    self.dout_ref:add_event(1, f)
end

function DOUT:onSwitchOff(f)
    self.dout_ref:add_event(2, f)
end

return DOUT