### gomerge-action

Github action which utilizes the Gomerge CLI tool, also created by myself, to bulk merge and approve github pull requests.

Behind the scenes, Gomerge will determine the mergeability of a pull request by checking the following attributes:

- **CI Status** (success, pending, failure)
- **Mergeable State** (clean, blocked, dirty)
- **Pull Request State** (open, draft, closed)

If any of these metrics are not in a valid state, the pull request will not be approved/merged.

##### Usage & Examples

Below outlines a list of possible use cases if you wanted to automated your repositories approval/merge workflow.


```yaml

```
