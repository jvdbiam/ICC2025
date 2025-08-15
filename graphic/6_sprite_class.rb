require 'dxruby'

class MySprite < Sprite
  @@image = Image.new(100, 100, C_WHITE)
  attr_accessor :dx

  def initialize(init_x = 100 , init_y = 100, dx = 2)
    super
    self.x = init_x
    self.y = init_y
    self.image = @@image
    self.dx = dx
  end

  def update
    self.x += self.dx
    if self.x<0 or self.x>Window.width - 100 then self.dx*=-1 end
  end
end

s = MySprite.new(100,100,2)

Window.loop do
  exit if Input.key_down?(K_ESCAPE)
  s.update
  s.draw
end