require "Yaci"
require "Tools"

Roller = newclass("Roller")

function Roller:init(name, engineUp, engineDown, timeToOpen, timeToClose)
    self.engineUp = cluName .. "->" .. engineUp .. "->"
    self.engineDown = cluName .. "->" .. engineDown .. "->"
    self.name = name
    self.status = "stopped"
    self.position = false
    self.timeToOpen = timeToOpen
    self.timeToClose = timeToClose
    self.startedAt = 0
end

function Roller:setPosition(newPosition)
    if newPosition < 0 or newPosition > 1 then
        error("Roller position cannot be lower then 0 or heigher then 1.")
    end

    -- in case position is unknown (system restart)
    if self.position == nil then
        if newPosition == 1 then
            self.position = 0
        elseif newPosition == 0 then
            self.position = 1
        else
            -- dont know exact position of roller, so cant move it to other exact position
            newPosition = 1 -- so just opening
            self.position = 0
        end
    end

    if self.status == "stopped" then
        local diff = self.position - newPosition
        if diff == 0 then
            return
        elseif diff > 0 then
            if loadstring(engineUp .. "Value()") == 1 then
                error("Cannot close roller while it is opening!")
            end
            self.status = "closing"
            Tools.log("closing")
            self.startedAt = Tools:getCurrentTime()
            loadstring(engineDown .. "SwitchOn(" .. diff * self.timeToClose .. ")")
        else
            if loadstring(engineDown .. "Value()") == 1 then
                error("Cannot open roller while it is closing!")
            end
            self.status = "opening"
            Tools.log("opening")
            self.startedAt = Tools:getCurrentTime()
            loadstring(engineUp .. "SwitchOn(" .. diff * self.timeToOpen .. ")")
        end
    else
        self.stop()
    end
    return nil
end

function Roller:open()
    self.setPosition(1)
end

function Roller:close()
    self.setPosition(0)
end

function Roller:stop()
    loadstring(engineUp .. "SwitchOff(0)")
    loadstring(engineDown .. "SwitchOff(0)")
    --self.status = "stopped"
end

function Roller:onStopped()
    local timeDiff = Tools:getCurrentTime() - self.startedAt
    if self.status == "opening" then
        self.position = self.position + timeDiff/self.timeToOpen
    elseif self.status == "closing" then
        self.position = self.position - timeDiff/self.timeToClose
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