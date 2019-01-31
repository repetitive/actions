## GitHub Actions for submiting sitemap.xml

Create New Relic [deployment](https://docs.newrelic.com/docs/apm/new-relic-apm/maintenance/record-deployments).

### Workflow

To include this action just add following code to your flow:

```
action "newrelic" {
  uses = "repetitive/actions/newrelic@master"
  secrets = [ "NEWRELIC_API_KEY", "NEWRELIC_APP_ID" ]
}
```