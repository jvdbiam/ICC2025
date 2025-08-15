require 'dxruby'

sound = Sound.new("Ring10.wav")  # wave file
bgm = Sound.new("town.mid")  # MIDI file

bgm.play

Window.loop do
  if Input.key_push?(K_Z) then  # Z key for play
    sound.play
  end
end
