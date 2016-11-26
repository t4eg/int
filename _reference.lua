function deepcopytable(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopytable(orig_key)] = deepcopytable(orig_value)
        end
        setmetatable(copy, deepcopytable(getmetatable(orig)))
    else -- number, string, boolean, etc
    copy = orig
    end
    return copy
end

-------------------------------------------------------

CLU_0d1cf0d6 = {}

function CLU_0d1cf0d6.execute(num, val)
    if num == 0 then
        print("CLU log " .. val)
    elseif num == 1 then
        print("CLU clear log")
    end
end

-------------------------------------------------------

_DOUT = {}
_DOUT.value = 0

function _DOUT:get(num)
    if num == 0 then
        print(self.name .. " get value")
        return _DOUT.value
    end
end

function _DOUT:set(num, val)
    if num == 0 then
        print(self.name .. " set value " .. val)
        _DOUT.value = val;
    end
end

function _DOUT:execute(num, val)
    if num == 0 then
        print(self.name .. " switch")
        if _DOUT.value == 0 then
            _DOUT.value = 1
        else
            _DOUT.value = 0
        end
        if _DOUT.onSwitchF ~= nil then
            _DOUT.onSwitchF()
        end
    elseif num == 1 then
        print(self.name .. " switchOn")
        _DOUT.value = 1
        if _DOUT.onSwitchOnF ~= nil then
            _DOUT.onSwitchOnF()
        end
    elseif num == 2 then
        print(self.name .. " switchOff")
        _DOUT.value = 0
        if _DOUT.onSwitchOffF ~= nil then
            _DOUT.onSwitchOffF()
        end
    end
end

function _DOUT:add_event(num, func)
    if num == 0 then
        _DOUT.onSwitchF = func
    elseif num == 1 then
        _DOUT.onSwitchOnF = func
    elseif num == 2 then
        _DOUT.onSwitchOffF = func
    end
end

-------------------------------------------------------

DOUT_8076 = deepcopytable(_DOUT)
DOUT_8076.name = "DOUT_8076"


DOUT_6711 = deepcopytable(_DOUT)
DOUT_6711.name = "DOUT_6711"