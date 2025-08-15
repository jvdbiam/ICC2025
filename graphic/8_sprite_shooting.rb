require 'dxruby'

class MySprite < Sprite
  @@image = Image.load('data.png') 
  def initialize(init_x = 300 , init_y = 350)
    super
    self.x = init_x
    self.y = init_y
    self.image = @@image
  end

  def update
    self.x += Input.x * 2
    self.x=0 if self.x<0 ; self.x=550 if self.x>550
  end
end

class Missile < Sprite
    @@image = Image.new(20, 50, C_YELLOW)
    attr_accessor :dy
    def initialize(init_x,init_y,dy=4)
        super
        self.x = init_x
        self.y = init_y
        self.image = @@image
        self.dy = dy
    end

    def update
        self.y -= dy
        if self.y < -50 then
            self.vanish
        end
    end
end

s = [MySprite.new()]

Window.loop do
  exit if Input.key_down?(K_ESCAPE)
  if Input.key_push?(K_SPACE) then 
    s.append(Missile.new(s[0].x+35, s[0].y),8) 
  end
  Sprite.update(s)
  Sprite.draw(s)
end