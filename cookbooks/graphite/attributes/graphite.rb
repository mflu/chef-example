default[:graphite][:version] = "0.9.9"

default[:graphite][:carbon][:uri] = "http://launchpadlibrarian.net/82112362/carbon-#{node[:graphite][:version]}.tar.gz"
default[:graphite][:carbon][:checksum] = "b3d42e3b93c09"

default[:graphite][:whisper][:uri] = "http://launchpadlibrarian.net/82112367/whisper-#{node[:graphite][:version]}.tar.gz"
default[:graphite][:whisper][:checksum] = "66c05eafe8d86"

default[:graphite][:graphite_web][:uri] = "http://launchpadlibrarian.net/82112308/graphite-web-#{node[:graphite][:version]}.tar.gz"
default[:graphite][:graphite_web][:checksum] = "cc78bab7fb26b"

default[:graphite][:carbon][:max_creates_per_minute] = 50
default[:graphite][:carbon][:line_receiver][:interface] =   "127.0.0.1"
default[:graphite][:carbon][:line_receiver][:port] = 2003
default[:graphite][:carbon][:pickle_receiver][:interface] = "127.0.0.1"
default[:graphite][:carbon][:pickle_receiver][:port] = 2004
default[:graphite][:carbon][:cache_query][:interface] = "127.0.0.1"
default[:graphite][:carbon][:cache_query][:port] = 7002

default[:graphite][:password] = "change_me"
