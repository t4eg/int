local DOUT = Classes.class()

function DOUT:init(ref)
    self.ref = ref
end

function DOUT:getValue()
    return self.ref:get(0)
end

function DOUT:setValue(val)
    self.ref:set(0, val)
end

function DOUT:switch()
    self.ref:execute(0, 0)
end

function DOUT:switchOn(val)
    if val == nil then
        val = 0
    end
    self.ref:execute(1, val)
end

function DOUT:switchOff(val)
    if val == nil then
        val = 0
    end
    self.ref:execute(2, val)
end

function DOUT:onChange(f)
    self.ref:add_event(0, f)
end

function DOUT:onSwitchOn(f)
    self.ref:add_event(1, f)
end

function DOUT:onSwitchOff(f)
    self.ref:add_event(2, f)
end

return DOUT