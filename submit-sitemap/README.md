## GitHub Actions for submiting sitemap.xml

Submit `sitemap.xml` to [Google Webmaster Tools](https://support.google.com/webmasters/answer/183669?hl=en).

### Workflow

To include this action just add following code to your flow:

```
action "repetitive/actions/submit-sitemap" {
  uses = "repetitive/actions/submit-sitemap@master"
  agrs = ["https://example.com/sitemap.xml"]
}
```