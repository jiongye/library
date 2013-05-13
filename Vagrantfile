# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "library"
  config.vm.box_url = "https://www.cubby.com/pl/library.box/_d3498727b3174016a387df714d0d46c8"

  config.vm.network :forwarded_port, guest: 80, host: 8080

end
