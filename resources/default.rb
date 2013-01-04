actions :enable, :disable

attribute :name, :name_attribute => true

attribute :upstream, :kind_of => [TrueClass,FalseClass], :default => true
attribute :servers,  :kind_of => Array,  :default => []
attribute :sockets,  :kind_of => Array,  :default => []

attribute :hostname, :kind_of => String, :default => "_"
attribute :port,     :kind_of => Fixnum, :default => 80
attribute :root_path,:kind_of => String, :required => true
attribute :ssl_key,  :kind_of => String
attribute :ssl_cert, :kind_of => String
attribute :log_dir,  :kind_of => String, :default => "/var/log/nginx/"
attribute :nginx_dir,:kind_of => String, :default => "/etc/nginx/"

def initialize(*args)
  super
  @action = :enable
end
