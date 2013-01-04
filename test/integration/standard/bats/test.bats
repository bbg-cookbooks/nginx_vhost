#!/usr/bin/env bats

@test "it should render the conf file" {
  [ -f /etc/nginx/sites-available/test ]
}
