class users (
  $users  = undef
) {
  include sudo

  if $users == undef {
    # nothing to do
  }
  else {
    create_resources(users::user, $users)
  }

}
