## GitHub Actions for automatically creating Pull Requests

This action will create a Pull Request if a pushed commit creates a new branch.
So whenever you push a new branch to GitHub you will have the Pull Request created
automatically. No need to click though UI anymore!


### Workflow

To include this action just add following code to your flow:

```yaml
# .github/workflows/my-flow.yml
on: [push]

name: Create PR for new branches
jobs:
  auto-pull-request:
    runs-on: ubuntu-18.04
    steps:
    - uses: repetitive/actions/auto-pull-request@v1
      if: github.event.created && github.event.head_commit
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
