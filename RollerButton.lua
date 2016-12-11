local RollerButton = Classes.class()

function RollerButton:init(buttonUp, buttonDown)
    self.buttonUp = buttonUp
    self.buttonDown = buttonDown
    self.buttonUp:onClick(function() self:onClick("up") end)
    self.buttonDown:onClick(function() self:onClick("down") end)
end

function RollerButton:setRoller(...)
    self.rollers = arg
end

function RollerButton:onClick(direction)
    if self.rollers == nil then
        return
    end
    for i, roller in ipairs(self.rollers) do
        if direction == "up" then
            roller:open()
        elseif direction == "down" then
            roller:close()
        end
    end
end

return RollerButton