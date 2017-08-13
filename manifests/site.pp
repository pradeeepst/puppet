node default {
class { 'apache': }
apache::vhost { 'redirect.example.com non-ssl':
  servername      => 'stan.pradeepst.com',
  port            => '80',
  docroot         => '/var/www/html',
  redirect_status => 'permanent',
  redirect_dest   => 'https://stan.pradeepst.com'
}

apache::vhost { 'redirect.example.com 8080':
  servername => 'stan.pradeepst.com',
  port       => '8080',
  docroot    => '/var/www/html',
}

exec { "install-instance-id":
    command => "/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id > /var/www/html/index.html"
}
}
