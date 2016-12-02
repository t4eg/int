local _ANALOG_IN = Classes().class()

function _ANALOG_IN:init(name)
    self.name = name
end

function _ANALOG_IN:set(num, val)
    if val == nil then
        val = 0
    end
    if num == 2 then
    elseif num == 3 then
    end
end

function _ANALOG_IN:add_event(num, func)
    if num == 0 then
        self.OnChangeValue = func
    elseif num == 1 then
        self.OnLowerValue = func
    elseif num == 2 then
        self.OnRiseValue = func
    elseif num == 3 then
        self.OnOutRange = func
    elseif num == 4 then
        self.OnSwitchOn = func
    elseif num == 5 then
        self.OnSwitchOff = func
    end
end

return _ANALOG_IN