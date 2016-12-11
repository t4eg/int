local DIGITAL_IN = Classes.class()

function DIGITAL_IN:init(ref)
    self.ref = ref
end

function DIGITAL_IN:getValue()
    return self.ref:get(0)
end

function DIGITAL_IN:getThreshold()
    return self.ref:get(1)
end

function DIGITAL_IN:getHoldDelay()
    return self.ref:get(2)
end

function DIGITAL_IN:getHoldInterval()
    return self.ref:get(3)
end

function DIGITAL_IN:setThreshold(val)
    self.ref:set(1, val)
end

function DIGITAL_IN:setHoldDelay(val)
    self.ref:set(2, val)
end

function DIGITAL_IN:setHoldInterval(val)
    self.ref:set(3, val)
end

function DIGITAL_IN:onChange(f)
    self.ref:add_event(0, f)
end

function DIGITAL_IN:onSwitchOn(f)
    self.ref:add_event(1, f)
end

function DIGITAL_IN:onSwitchOff(f)
    self.ref:add_event(2, f)
end

function DIGITAL_IN:onShortPress(f)
    self.ref:add_event(3, f)
end

function DIGITAL_IN:onLongPress(f)
    self.ref:add_event(4, f)
end

function DIGITAL_IN:onHold(f)
    self.ref:add_event(5, f)
end

function DIGITAL_IN:onClick(f)
    self.ref:add_event(6, f)
end

return DIGITAL_IN