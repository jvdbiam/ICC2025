require 'dxruby'

image = Image.new(100, 100, C_WHITE)
s1 = Sprite.new(0, 0, image)
s2 = Sprite.new(200, 0, image)
dx = 2; dy = 2
Window.loop do
  exit if Input.key_down?(K_ESCAPE)
  s1.x += dx
  s2.y += dy
  if s1.x<0 or s1.x>Window.width - 100 then dx*=-1 end
  if s2.y<0 or s2.y>Window.height - 100 then dy*=-1 end
  s1.draw
  s2.draw
end