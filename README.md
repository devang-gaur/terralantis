# terralantis

```
docker build . -t terralantis

docker run -e AWS_ACCESS_KEY_ID=<value> -e AWS_SECRET_ACCESS_KEY=<value> -e AWS_REGION=<value>  -p 4141:4141 --user=atlantis -v <pwd>/data/:/etc/terrascan/ terralantis server --gh-user=<GH_USER> --gh-token=<GH_PersonalAccessToken> --repo-allowlist=<gh_repo> --gh-webhook-secret=<webhook-secret> -c /etc/terrascan/config.toml
```

You can use the container I created:

```
docker pull devanggaur7/terralantis
```

# Usage

Usage is the same as atlantis except for this -c flag, which you can use to pass the terrascan config.toml file.

Also, the default workflow.yaml file used is the `workflow.yaml` in this repo. You're allowed to override on your own by using the --repo-config flag.
To trigger the terrascan scan, make sure you include a step to execute `terrascan.sh` in your workflow file.