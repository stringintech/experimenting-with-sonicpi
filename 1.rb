s = [attack: 1, release: 0.5, sustain: 0.5] # short one
define :s_play do |n|
  play *([n] + s)
  sleep 1.5
end

l = [attack: 1, release: 2.5, sustain: 0.5] # long one
define :l_play do |n|
  play *([n] + l)
  sleep 3.5
end

2.times do
  use_synth :pulse
  s_play :E5
  s_play :C6
  s_play :B5
  s_play :A5
  s_play :Gs5
  s_play :A5
  l_play :E5
  use_synth :beep
  s_play :C6
  s_play :B5
  s_play :A5
  l_play :F5
  l_play :E5
end