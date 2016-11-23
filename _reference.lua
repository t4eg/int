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

function CLU_0d1cf0d6.execute(num)
    if num == 1 then print("CLU clear log")
    end
end

-------------------------------------------------------

_DOUT = {}

function _DOUT:get(num)
    if num == 0 then print(self.name .. " get value")
    end
end

function _DOUT:set(num, val)
    if num == 0 then print(self.name .. " set value " .. val)
    end
end

function _DOUT:execute(num, val)
    if num == 0 then print(self.name .. " switch")
    elseif num == 1 then print(self.name .. " switchOn")
    elseif num == 2 then print(self.name .. " switchOff")
    end
end

-------------------------------------------------------

DOUT_6711 = deepcopytable(_DOUT)
DOUT_6711.name = "DOUT_6711"


DOUT_2651 = deepcopytable(_DOUT)
DOUT_2651.name = "DOUT_2651"