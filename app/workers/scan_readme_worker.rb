class ScanReadmeWorker
  include Sidekiq::Worker

  def perform(mod_id)
    mod = Mod.find(mod_id)

    uri = URI.parse(mod.repo)

    readme = GITHUB.get("/repos#{uri.path}/readme")
    readmeData = JSON.parse(readme.body)

    if mod.readme.nil?
      mod.create_readme(
        content: readmeData["content"],
        url: readmeData["html_url"],
        encoding: readmeData["encoding"]
      )
    else
      mod.readme.update(
        content: readmeData["content"],
        url: readmeData["html_url"],
        encoding: readmeData["encoding"]
      )
    end
  end
end