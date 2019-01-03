module ApplicationHelper
  def date_helper(date)
    t = Time.parse(date)
    t.strftime('%B %e, %Y')
  end
end
