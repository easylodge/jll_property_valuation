module Endpoints
  module Authentication

    # returns response code 200 if successful
    def ping()
      endpoint = "auth/ping"
      return get(endpoint: endpoint)
    end

    # returns [Hash]
    def login()
      endpoint = "auth/login"
      body = { "Username": username, "Password": password }

      return post(endpoint: endpoint, body: body)
    end
  end
end