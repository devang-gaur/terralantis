# terralantis

```
docker build . -t terralantis

docker run -e AWS_ACCESS_KEY_ID=<value> -e AWS_SECRET_ACCESS_KEY=<value> -e AWS_REGION=<value>  -p 4141:4141 --user=atlantis -v <pwd>/data/:/etc/terrascan/ terralantis server --gh-user=<GH_USER> --gh-token=<GH_PersonalAccessToken> --repo-allowlist=<gh_repo> --gh-webhook-secret=<webhook-secret> -c /etc/terrascan/config.toml
```
