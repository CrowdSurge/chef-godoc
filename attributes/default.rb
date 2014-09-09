default["godoc"]["user"] = "godoc"
default["godoc"]["home"] = "#{node['go']['gopath']}/godoc"
default["godoc"]["nginx"]["proxy"] = false
default["godoc"]["nginx"]["site"] = "godoc.#{node['domain']}"

