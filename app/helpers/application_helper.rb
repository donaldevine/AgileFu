module ApplicationHelper
	def avatar_url(user)
		gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

end
