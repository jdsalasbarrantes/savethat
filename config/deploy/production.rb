set :stage, :production
set :rails_env, :production
set :branch, "master"

server "<SERVER HOST>", user: "<SERVER USER>", roles: %w{app db web}

set :ssh_options, {
    keys: %w(PATH TO KEY),
    forward_agent: true,
    auth_methods: %w(publickey password)
}
set :passenger_restart_with_touch, true