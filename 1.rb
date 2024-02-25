s = [attack: 1, release: 0.5, sustain: 0.5] # short one
define :s_play do |n, c|
  play *([n] + s)
  c.times do # let's add some color to the short notes
    sample :glitch_bass_g, amp: 1
    sleep 1.5/c
  end
end

l = [attack: 1, release: 2.5, sustain: 0.5] # long one
define :l_play do |n|
  play *([n] + l)
  sleep 3.5
end

2.times do
  use_synth :pulse
  ns = [:E5, :C6, :B5, :A5, :Gs5, :A5]
  (0..ns.length-1).each { |i| # not sure if this was necessary :))
    s_play ns[i], i % 2 == 0 ? 8 : 2
  }
  l_play :E5

  use_synth :beep
  s_play :C6, 2
  s_play :B5, 1
  s_play :A5, 2
  l_play :F5
  l_play :E5
end