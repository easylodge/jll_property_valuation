module Endpoints
  module Authentication

    def auth_ping()
      return get("auth/ping")
    end

    def auth_login()
      return post("auth/login", { "Username": username, "Password": password })
    end
  end
end