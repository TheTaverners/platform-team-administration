# Platform Team Administration

## Requirements

- 1Password (CLI & GUI)

## Processes

### Fetching secrets

After running `op signin` and selecting the right vault:

```shell
op environment read <env-id-copy-from-app> > .env
```

### Updating a secret

- Add a new entry in `.env_example`.
- Apply the same change in your local `.env`
- Go to 1Password GUI, in the right environment, click on "Import .env".

> [!NOTE]
> As of today, the 1Password CLI cannot do that. We must use the desktop app.

> [!WARNING]
> You MUST fill your `.env` file locally before importing it in 1Password.
> Otherwise, you will delete all other secrets.
