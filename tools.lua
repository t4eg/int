local Tools = Classes.class()

Tools.cluName = "clu"
Tools.isLocal = false

function Tools.getCurrentTimeMs()
    return os.clock() * 1000
end



function Tools.execute(str)
    if Tools.isLocal then
        print("execute: " .. str)
    else
        ls = loadstring(str)
        return ls()
    end
end

-- seconds
function Tools.sleep(n)
    local t0 = os.clock()
    while os.clock() - t0 <= n do end
end

return Tools