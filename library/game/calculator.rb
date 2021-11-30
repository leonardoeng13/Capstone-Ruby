class Calculator
  def check_date(last_played_at)
    diff = Time.diff(Time.parse(Date.today) - Time.parse(last_played_at))
    true if diff.years > 2
    false
  end
end
