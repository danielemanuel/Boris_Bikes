class Van
  def collect_broken
    raise RuntimeError, 'There are no broken bikes' unless @broken
  end
end
