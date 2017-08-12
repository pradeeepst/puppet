node default {
class { 'apache': }
apache::vhost { 'redirect.example.com non-ssl':
  servername      => '54.252.168.214',
  port            => '80',
  docroot         => '/var/www/redirect',
  redirect_status => 'permanent',
  redirect_dest   => 'https://54.252.168.214/'
}

apache::vhost { 'redirect.example.com 8080':
  servername => '54.252.168.214',
  port       => '8080',
  docroot    => '/var/www/redirect',
}

exec { "install-instance-id":
    command => "/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id > /var/www/redirect/index.html"
}
}
