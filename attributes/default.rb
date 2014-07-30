default["godoc"]["user"] = "godoc"
default["godoc"]["home"] = "#{node['go']['gopath']}/godoc"
default["godoc"]["nginx-proxy"] = false
default["godoc"]["servername"] = "godoc.#{node['domain']}"
