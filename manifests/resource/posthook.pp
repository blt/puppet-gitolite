# Sets the availability of a post-receive hook that sends an AMQP message per
# push.
#
# Parameters:
#
#  [*ensure*] - Enable or disable the posthook (present|absent)
#  [*root*]   - Set the root of gitolite repositories. Default '/var/lib/git/repositories'
#  [*mquser*] - Set the RabbitMQ user that the hook will use.
#   *mqpass*  - Set the RabbitMQ user's password.
#  [*mqhost*] - Set the RabbitMQ host to communicate with. Default 'mq0'.
#  [*mqcert*] - Set the RabbitMQ certified client certificate. Default '/etc/rabbitmq/ssl/client/cert.pem
#  [*mqkey*]  - Set the RabbitMQ client private key. Default '/etc/rabbitmq/ssl/client/key.pem
#  [*mqport*] - Set the RabbitMQ port to communicate over. Default 5671.
#
define gitolite::resource::posthook(
  $ensure=file, $root='/var/lib/git/repositories',
  $mquser='git', $mqpass, $mqhost='mq0', $mqcert='/etc/rabbitmq/ssl/client/cert.pem',
  $mqkey='/etc/rabbitmq/ssl/client/key.pem', $mqport='5671') {

  $hook = "${root}/${title}.git/hooks/post-receive"
  file { $hook:
    ensure  => $ensure,
    mode    => 0755,
    content => template('gitolite/posthook.erb'),
  }

}

