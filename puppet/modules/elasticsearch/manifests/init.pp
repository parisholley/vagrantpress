class elasticsearch::install{
  package { "default-jdk": ensure => present,}

  exec{"download elasticsearch":
    cwd     => "/opt/",
    command => "/usr/bin/wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.2.tar.gz"
  }  
  exec{"extract elasticsearch":
    cwd     => "/opt/",
    command => "/bin/tar -xvf elasticsearch-0.90.2.tar.gz",
    require => Exec["download elasticsearch"]
  }  
  exec{"run elasticsearch":
    cwd     => "/opt/",
    command => "/opt/elasticsearch-0.90.2/bin/elasticsearch -p es.pid",
    require => [Exec["extract elasticsearch"],Package["default-jdk"]]
  }
  exec{"create index":
    cwd     => "/opt/",
    command => "/bin/sleep 10; /usr/bin/curl -XPUT http://127.0.0.1:9200/wordpress; exit 0",
    require => Exec["run elasticsearch"]
  }
}
