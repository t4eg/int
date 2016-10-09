local classes = require "classes"
local Tools = require "Tools"

local Roller = classes.class()

function Roller:init(name, engineUp, engineDown, timeToOpen, timeToClose)
    self.engineUp = Tools.cluName .. "->" .. engineUp .. "->"
    self.engineDown = Tools.cluName .. "->" .. engineDown .. "->"
    self.name = name
    self.status = "stopped"
    self.position = nil
    self.timeToOpen = timeToOpen
    self.timeToClose = timeToClose
    self.startedAt = 0
end

function Roller:open()
    self:setPosition(1)
end

function Roller:close()
    self:setPosition(0)
end

function Roller:setPosition(newPosition)
    if newPosition < 0 or newPosition > 1 then
        error("Roller position cannot be lower then 0 or heigher then 1.")
    end

    -- in case position is unknown (system restart)
    if self.position == nil then
        if newPosition > 0.5 then
            newPosition = 1 -- open fully
            self.position = 0
        elseif newPosition <= 0.5 then
            newPosition = 0 -- close fully
            self.position = 1
        end
    end

    if self.status == "stopped" then
        local diff = self.position - newPosition
        if diff == 0 then
            return
        elseif diff > 0 then
            if Tools.execute(self.engineUp .. "Value()") == 1 then
                error("Cannot close roller while it is opening!")
            end
            self.status = "closing"
            self.startedAt = Tools.getCurrentTimeMs()
            Tools.execute(self.engineDown .. "SwitchOn(" .. diff * self.timeToClose .. ")")
        else
            if Tools.execute(self.engineDown .. "Value()") == 1 then
                error("Cannot open roller while it is closing!")
            end
            self.status = "opening"
            self.startedAt = Tools.getCurrentTimeMs()
            Tools.execute(self.engineUp .. "SwitchOn(" .. math.abs(diff) * self.timeToOpen .. ")")
        end
    else
        self:stop()
    end
end

function Roller:stop()
    Tools.execute(self.engineUp .. "SwitchOff(0)")
    Tools.execute(self.engineDown .. "SwitchOff(0)")
end

function Roller:onStopped()
    local timeDiff = Tools.getCurrentTimeMs() - self.startedAt
    if self.status == "opening" then
        if timeDiff > self.timeToOpen then
            timeDiff = self.timeToOpen
        end
        self.position = self.position + timeDiff / self.timeToOpen
        if self.position > 1 then
            self.position = 1
        end
    elseif self.status == "closing" then
        if timeDiff > self.timeToClose then
            timeDiff = self.timeToClose
        end
        self.position = self.position - timeDiff / self.timeToClose
        if self.position < 0 then
            self.position = 0
        end
    else
        error("Stopped while already was stopped.")
    end
    self.status = "stopped"
    Tools.log("stopped")
end

function Roller:getPosition()
    return self.position
end

function Roller:__tostring()
    return self.name
end

return Roller