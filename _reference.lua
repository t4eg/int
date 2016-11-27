local debug = true

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

local function print2(txt)
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

-------------------------------------------------------

_DOUT = {}
_DOUT.value = 0

function _DOUT:get(num)
    if num == 0 then
        print2(self.name .. ".getValue() returns " .. _DOUT.value)
        return _DOUT.value
    end
end

function _DOUT:set(num, val)
    if num == 0 then
        print2(self.name .. "setValue(" .. val .. ")")
        _DOUT.value = val;
    end
end

function _DOUT:execute(num, val)
    if val == nil then
        val = 0
    end
    if num == 0 then
        if _DOUT.value == 0 then
            _DOUT.value = 1
        else
            _DOUT.value = 0
        end
        print2(self.name .. ".switch() to " .. _DOUT.value)
        if _DOUT.onSwitchF ~= nil then
            _DOUT.onSwitchF()
        end
    elseif num == 1 then
        print2(self.name .. ".switchOn(" .. val .. ")")
        _DOUT.value = 1
        if _DOUT.onSwitchOnF ~= nil then
            _DOUT.onSwitchOnF()
        end
        if val ~= 0 then
            Tools.sleep(val)
            _DOUT:execute(2,0)
        end
    elseif num == 2 then
        if self.name == nil then print("self.name null") end
        if val == nil then print("val null") end

        print2(self.name .. ".switchOff(" .. val .. ")")
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