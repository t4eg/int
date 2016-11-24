local Tools = Classes.class()

Tools.cluName = "clu"

function Tools.getCurrentTimeMs()
    return os.clock() * 1000
end

function Tools.loadStr(str)
    ls = loadstring(str)
    return ls()
end

function Tools.sleep(n)
    local t0 = os.clock()
    while os.clock() - t0 <= n do end
end

return Tools