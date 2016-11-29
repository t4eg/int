local _CLU = Classes().class()

function _CLU:init(name)
    self.name = name
end

function _CLU:execute(num, val)
    if num == 0 then
        print2("CLU log: " .. val)
    elseif num == 1 then
        print2("CLU clear log")
    end
end

function _CLU:get(num)
    if num == 13 then
        return os.clock() --time since lua started
    end
end

return _CLU