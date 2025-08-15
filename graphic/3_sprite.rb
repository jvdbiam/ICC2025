require 'dxruby'
image = Image.load('pic.png')
s = Sprite.new(100, 100, Image.load('pic.png'))
dx = 8
Window.loop do
  exit if Input.key_down?(K_ESCAPE)
  s.x += dx
  if s.x<0 or s.x>Window.width - 100 then dx*=-1 end
  s.draw
end