class Point

  def initialize(n)
    @start = n
    @current = n
  end

  def start
    @start
  end

  def current
    @current
  end

  def iterate
    if @current%2 == 0
      @current /= 2
    else
      @current = 3*@current + 1
    end
  end

  def setCurrent(pos)
    @current = pos
  end

  def to_s
    "(n: #@start, current: #@current)"
  end

end

print "Calculate period of map from 1 to…"
max = gets.to_i
periods = Array.new(max,0)
    
(0..max).each do |i|
  point = Point.new(i+1)
  period = 0
  while point.current != 1 && period<=1000 do
    point.iterate
    period += 1
    if point.current<=point.start
      period += periods[point.current-1]
      point.setCurrent(1)
    end
  end
  periods[point.start-1] = period
  print "#{period} "
end

print "\n"