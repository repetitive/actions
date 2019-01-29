## GitHub Actions for Lein

This Action for [Lein](https://leiningen.org/) enables arbitrary actions using Lein cli.

### Workflow

To include this action just add following code to your flow:

```
action "repetitive/actions/repl" {
  uses = "repetitive/actions/repl@master"
  agrs = "version"
}
```