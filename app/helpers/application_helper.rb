module ApplicationHelper
  def cp(path)
    "active" if current_page?(path)
  end

  def sort_by(data)
    case data
    when "repo_created_at"
      return "Date Created"
    when "repo_updated_at"
      return "Last Updated"
    when "stars"
      return "Popularity"
    end
  end
end
