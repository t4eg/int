require "Yaci"

Tools = newclass("Tools")

function Tools:getCurrentTime()
    return os.clock() * 1000
end

function Tools:log(txt)
    print(txt)
    --clu->AddToLog(txt)
end
