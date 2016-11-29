local CLU = Classes.class()

local CLU_REF = CLU_0d1cf0d6

function CLU.clearLog()
    CLU_REF:execute(1)
end

function CLU.log(txt)
    CLU_REF:execute(0, txt)
end

function CLU.getUnixTime()
    return CLU_REF:get(13)
end

return CLU