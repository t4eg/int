local _DOUT = Classes().class()

function _DOUT:init(name)
    self.name = name
    self.value = 0
end

function _DOUT:get(num)
    if num == 0 then
        print2(self.name .. ".getValue() returns " .. self.value)
        return self.value
    end
end

function _DOUT:set(num, val)
    if num == 0 then
        print2(self.name .. ".setValue(" .. val .. ")")
        self.value = val;
    end
end

function _DOUT:execute(num, val)
    if val == nil then
        val = 0
    end
    if num == 0 then
        if self.value == 0 then
            self.value = 1
        else
            self.value = 0
        end
        print2(self.name .. ".switch() to " .. self.value)
        if self.OnChange ~= nil then
            self.OnChange()
        end
    elseif num == 1 then
        print2(self.name .. ".switchOn(" .. val .. ")")
        self.value = 1
        if self.onSwitchOnF ~= nil then
            self.onSwitchOnF()
        end
        if val ~= 0 then
            Tools.sleep(val)
            self:execute(2, 0)
        end
    elseif num == 2 then
        print2(self.name .. ".switchOff(" .. val .. ")")
        self.value = 0
        if self.onSwitchOffF ~= nil then
            self.onSwitchOffF()
        end
        if val ~= 0 then
            Tools.sleep(val)
            self:execute(1, 0)
        end
    end
end

function _DOUT:add_event(num, func)
    if num == 0 then
        self.OnChange = func
    elseif num == 1 then
        self.onSwitchOnF = func
    elseif num == 2 then
        self.onSwitchOffF = func
    end
end

return _DOUT