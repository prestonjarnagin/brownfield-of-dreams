class DashboardFacade

  def initialize(params)
    @_repos
  end

  def repos
    search_result.map do |repo_data|
      Repo.new(repo_data)
    end
  end

  def service
    GithubService.new({oath_key: ENV["github_key"]})
  end

  def search_result
    @_search_result ||= service.response_repos
  end
end
