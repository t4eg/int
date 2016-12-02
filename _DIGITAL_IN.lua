local _DIGITAL_IN = Classes().class()

function _DIGITAL_IN:init(name)
    self.name = name
    self.value = 0
    self.threshold = 0
    self.holdDelay = 500
    self.holdInterval = 50
end

function _DIGITAL_IN:get(num)
    if num == 0 then
        print2(self.name .. ".getValue() returns " .. self.value)
        return self.value
    elseif num == 1 then
        print2(self.name .. ".getThreshold() returns " .. self.threshold)
        return self.threshold
    elseif num == 2 then
        print2(self.name .. ".getHoldDelay() returns " .. self.holdDelay)
        return self.holdDelay
    elseif num == 3 then
        print2(self.name .. ".getHoldInterval() returns " .. self.holdInterval)
        return self.holdInterval
    end
end

function _DIGITAL_IN:set(num, val)
    if val == nil then
        val = 0
    end
    if num == 1 then
        print2(self.name .. ".setThreshold(" .. val .. ")")
        self.threshold = val
    elseif num == 2 then
        print2(self.name .. ".setHoldDelay(" .. val .. ")")
        self.holdDelay = val
    elseif num == 3 then
        print2(self.name .. ".setHoldInterval(" .. val .. ")")
        self.holdInterval = val
    end
end

function _DIGITAL_IN:add_event(num, func)
    if num == 0 then
        self.OnChange = func
    elseif num == 1 then
        self.OnSwitchOn = func
    elseif num == 2 then
        self.OnSwitchOff = func
    elseif num == 3 then
        self.OnShortPress = func
    elseif num == 4 then
        self.OnLongPress = func
    elseif num == 5 then
        self.OnHold = func
    end
end

function _DIGITAL_IN:change()
    if self.OnChange ~= nil then
        self.OnChange()
    end
end

function _DIGITAL_IN:switchOn()
    if self.OnSwitchOn ~= nil then
        self.OnSwitchOn()
    end
end

function _DIGITAL_IN:switchOff()
    if self.OnSwitchOff ~= nil then
        self.OnSwitchOff()
    end
end

function _DIGITAL_IN:shortPress()
    if self.OnShortPress ~= nil then
        self.OnShortPress()
    end
end

function _DIGITAL_IN:longPress()
    if self.OnLongPress ~= nil then
        self.OnLongPress()
    end
end

function _DIGITAL_IN:hold()
    if self.OnHold ~= nil then
        self.OnHold()
    end
end

return _DIGITAL_IN