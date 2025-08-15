require 'dxruby'

def player_hit(player, enemy)
  puts "Game Over!"
  exit
end

class MySprite < Sprite
  @@image = Image.load('data.png') 
  def initialize(init_x = 300 , init_y = 350)
    super
    self.x = init_x
    self.y = init_y
    self.image = @@image
  end

  def update
    self.x += Input.x * 5
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

  def shot
    self.vanish
  end
end

class Box < Sprite
    @@image = Image.load('look.jpg') 
      def initialize
    super
    self.x = rand(570)
    self.y = -70
    @dx = rand(2) * 2 - 1
    @dy = 2
    self.image = @@image
  end
  
  def update
    self.x += @dx
    self.y += @dy
    if self.y > Window.height then self.vanish end
  end

  def hit
    self.vanish
  end
end

s = [MySprite.new()]
missiles = []
enemies = [Box.new]
Window.loop do
  exit if Input.key_down?(K_ESCAPE)
  if Input.key_push?(K_SPACE) || Input.pad_down?(P_BUTTON0) then 
    missiles.append(Missile.new(s[0].x+35, s[0].y),8) 
  end
  if rand(60)==0 then enemies.append(Box.new) end
  Sprite.update(s)
  Sprite.update(missiles)
  Sprite.update(enemies)
  Sprite.draw(s)
  Sprite.draw(missiles)
  Sprite.draw(enemies)
  Sprite.check(missiles, enemies)
  Sprite.check(s, enemies) do |player, enemy|
      player_hit(player, enemy)
    end
end