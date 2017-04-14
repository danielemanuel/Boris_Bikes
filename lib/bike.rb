class Bike
  def working?
    return true unless @broken
    false
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end
end
