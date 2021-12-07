### gomerge-action

Github action which utilizes the [Gomerge CLI tool](https://github.com/Cian911/gomerge), also created by myself, to bulk merge and approve github pull requests.

Behind the scenes, Gomerge will determine the mergeability of a pull request by checking the following attributes:

- **CI Status** (success, pending, failure)
- **Mergeable State** (clean, blocked, dirty)
- **Pull Request State** (open, draft, closed)

If any of these metrics are not in a valid state, the pull request will not be approved/merged.

##### Usage & Examples

Below outlines a list of possible use cases if you wanted to automated your repositories approval/merge workflow.

You can also specify a list of labels in the following format `label1,label2...` and pass that as option like so:
```yaml
with:
  labels: label1,label2
```

This will filter all Pull Requests that only have the associated labels.

---

Run action once a day at midnight to approve all valid Pull Requests.
```yaml
on:
  schedule:
    - cron: '0 0 * * *'

jobs:
  approve-prs:
    runs-on: ubuntu-latest
    name: Approve valid PRs 
    steps:
      - name: Approve valid workflows
        uses: Cian911/gomerge-action@master
        with:
          repository: ${{ github.repository }}
          github_token: ${{ secrets.GITHUB_TOKEN }}
          labels: ""
          approve: "true"
```

Run action once a day at midnight to merge all valid Pull Requests.
```yaml
on:
  schedule:
    - cron: '0 0 * * *'

jobs:
  approve-prs:
    runs-on: ubuntu-latest
    name: Merge valid PRs 
    steps:
      - name: Approve valid workflows
        uses: Cian911/gomerge-action@master
        with:
          repository: ${{ github.repository }}
          github_token: ${{ secrets.GITHUB_TOKEN }}
          labels: ""
```
