## GitHub Actions for automatically creating Pull Request

This action will create Pull Request on any commit that creates new branch.
So whenever you push new branch to GitHub you will have
Pull Request created automatically. No need to click though UI anymore!

### Workflow

To include this action just add following code to your flow:

```
action "auto-pr" {
  uses = "repetitive/actions/auto-pr@master"
  secrets = ["GITHUB_TOKEN"]
}
```
