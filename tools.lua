local Tools = Classes.class()

function Tools.getCurrentTimeMs()
    return CLU.getUnixTime() * 1000
end

function Tools.loadStr(str)
    ls = loadstring(str)
    return ls()
end

function Tools.sleep(n)
    print("sleeping " .. n .. " ms")
    local t0 = os.clock()
    while os.clock() - t0 <= n/1000 do end
end

return Tools