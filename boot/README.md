## GitHub Actions for Boot

This Action for [Boot](https://boot-clj.com/) enables arbitrary actions using Boot cli.

### Workflow

To include this action just add following code to your flow:

```
action "repetitive/actions/boot" {
  uses = "repetitive/actions/boot@master"
  agrs = "help"
}
```