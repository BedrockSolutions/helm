# TFA Bot

Helm chart for the wonderful TFA Bot, developed by The Factoid Authority.
  
  * [Website (*www.factoid.org*)](http://www.factoid.org)
  
  * [Github (*git.factoid.org*)](https://git.factoid.org/TFA/TFA-Bot)

## Values

`tfaBot.botUrl`: The URL to the Google Sheet configuration document.

## Example

Create a values override file with the URL to the configuration document:

```yaml
tfaBot:
  botUrl: https://url.to.google.sheets.conf
```

From the chart's parent directory, run Helm:

```bash
helm install -f ./bot_values_override.yaml --name tfa-bot ./tfa-bot
```