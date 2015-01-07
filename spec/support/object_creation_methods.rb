def create_user(overrides = {})
  User.create!(
  {first_name: "Frank",
    last_name: "Sinatra",
    password: "password",
    email: "frank@example.com",
    admin: false}.merge(overrides)
    )
end
