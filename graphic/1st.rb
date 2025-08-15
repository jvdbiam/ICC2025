require 'dxruby'
image = Image.load('data.png')  # loading the 'data.png'
Window.width=640;Window.height=480  # Window settings
x=0;y=0 #Declare the variables
Window.loop do
  exit if Input.key_down?(K_ESCAPE)
  dx = Input.x  # difference of x axis
  dy = Input.y  # difference of y axis

  if Input.pad_down?(P_BUTTON0) then  # z key or Geme pad button 0
    dx = dx * 2
    dy = dy * 2
  end

  x = x + dx
  y = y + dy
  Window.draw(x, y, image) 
end