#DEGREE = "\x00\xB0"

def dms(angle)
  degrees = angle.floor
  minutes = angle % 1 * 60
  seconds = minutes % 1 * 60
  "%(#{degrees}°#{format('%02d',minutes)}'#{format('%02d', seconds)}\")"
end

puts dms(30) # == %(30°00'00")
puts dms(76.73) # == %(76°43'48")
puts dms(254.6) # == %(254°36'00")
puts dms(93.034773) # == %(93°02'05")
puts dms(0) # == %(0°00'00")
puts dms(360) # == %(360°00'00")
puts dms(360) # == %(0°00'00")
