local Camera = {}

function Camera.new(x,y,angle,zoom)
  local self = setmetatable({}, {__index=Camera})
  self.x = x or 0
  self.y = y or 0
  self.angle = angle or 0
  self.zoom = zoom or 1
  
  function love.mousemoved(x, y, dx, dy)
    if love.mouse.isDown(2) then
        self.x = self.x - dx / self.zoom
        self.y = self.y - dy / self.zoom
    end
  end

  function love.wheelmoved(x, y)
      local scale_change = y * 0.1
      if self.zoom * (1 + scale_change) > 0.5 then
          self.zoom = self.zoom * (1 + scale_change)
      end
  end
  
  return self
end

function Camera:get_position() return self.x,self.y end
function Camera:get_angle() return self.angle end
function Camera:get_zoom() return self.zoom end

function Camera:set_position(x,y) self.x,self.y=x,y end
function Camera:set_angle(a) self.angle=a end
function Camera:set_zoom(a) self.zoom=a end



return Camera
