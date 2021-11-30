class Calculator
  def check_date(last_played_at)
    diff = Date.today - Date.parse(last_played_at)
    true if diff > 2.years.ago.to_date
    false
  end
end
