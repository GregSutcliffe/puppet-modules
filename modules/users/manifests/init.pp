class users (
  $admins = undef,
  $users  = undef
) {
  include sudo

  if $admins == undef {
    # nothing to do
  }
  else {
    create_resources(users::admin, $admins)
  }

  if $users == undef {
    # nothing to do
  }
  else {
    create_resources(users::user, $users)
  }

  if $::hostname == "minerva" {
    sudo::directive { "nicki":
      ensure  => present,
      content => "nicki ALL=(ALL) ALL\n",
    }
  }

}
