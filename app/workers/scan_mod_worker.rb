class ScanModWorker
  include Sidekiq::Worker

  def perform(mod_id)
    mod = Mod.find(mod_id)

    uri = URI.parse(mod.repo)

    repo = GITHUB.get("/repos#{uri.path}")
    repoData = JSON.parse(repo.body)

    mod.update(
      author: repoData["owner"]["login"],
      description: repoData["description"],
      watchers: repoData["watchers_count"],
      stars: repoData["stargazers_count"],
      forks: repoData["forks_count"],
      repo_updated_at: repoData["updated_at"],
      repo_created_at: repoData["created_at"]
    )

    ScanReadmeWorker.perform_async(mod.id)
  end
end