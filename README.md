# godoc-cookbook

This cookbook installs Godoc, manages the http server process, and optionally proxies a path to the local port with nginx

## Supported Platforms

- Ubuntu 12.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['godoc']['nginx']['proxy']</tt></td>
    <td>Boolean</td>
    <td>whether to include nginx recipe to proxy the local server</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['godoc']['nginx']['path']</tt></td>
    <td>String</td>
    <td>The path that godoc should serve on</td>
    <td><tt>/docs/godoc</tt></td>
  </tr>
  <tr>
    <td><tt>['godoc']['nginx']['site']</tt></td>
    <td>String</td>
    <td>The server name to serve on</td>
    <td><tt>node['fqdn']</tt></td>
  </tr>
</table>

## Usage

### godoc::default
This will include the go cookbook, install godoc, and use runit to supervise the process.

### godoc::nginx
This will include the nginx opscode cookbook, and put the custom template in place.

Include `godoc` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[godoc::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Will Salt (<will@crowdsurge.com>)
