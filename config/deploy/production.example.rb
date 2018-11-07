set :stage, :production
set :rails_env, :production
set :branch, "<BRANCH NAME>"

server "<SERVER HOST>", user: "<DEPLOY USER>", roles: %w{app db web}

set :ssh_options, {
    keys: %w(<KEYS PATH>),
    forward_agent: true,
    auth_methods: %w(publickey password)
}
set :passenger_restart_with_touch, true