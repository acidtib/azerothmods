module Github
  class Client
    include HTTParty
    format :json

    def initialize()
      self.class.base_uri("https://api.github.com")
    end

    def get(path, options = {})
      options = default_request_options.merge(options)
      self.class.get(path, options)
    end

    private

    def default_request_options
      { 
        headers: { 
          "Accept" => "application/vnd.github.v3+json",
          "Authorization" => "token #{ENV["GITHUB_TOKEN"]}"
        }
      }
    end
  end
end