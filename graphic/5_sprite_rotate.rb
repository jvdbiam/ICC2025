require 'dxruby'

s = Sprite.new(100, 100, Image.new(100, 100, C_WHITE))
dt = 10
Window.loop do
  exit if Input.key_down?(K_ESCAPE)
  s.angle += dt
  if s.angle<0 or s.angle > 270 then dt*=-1 end
  s.draw
end