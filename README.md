# Platform Team Administration

## Requirements

- 1Password (CLI & GUI)
- Terraform >= 1.15.0

## Processes and Commands

### Activate Git hooks

```shell
# Ensure they're executable, then copy them in the right place
chmod +x .git-hooks/*
cp .git-hooks/* .git/hooks/*
```

### Fetching secrets

After running `op signin` and selecting the right vault:

```shell
op environment read <env-id-copy-from-app> > .env
```

### Updating a secret

- Add a new entry in `.env_example`.
- Apply the same change in your local `.env`.
- Go to 1Password GUI, in the right environment, click on "Import .env".

> [!NOTE]
> As of today, the 1Password CLI cannot do that. We must use the desktop app.

> [!WARNING]
> You MUST fill your `.env` file locally before importing it in 1Password.
>
> Otherwise, you will delete all other secrets.

### Updating Github Configuration

Before anything else:

```shell
# Put yourself in the right module
cd modules/github

# Init and Install dependencies
terraform init

# Do your changes

# Then, plan the changes and ensure everything's fine
terraform plan

# Then, apply the changes
terraform apply
```

#### Creating a new Github repository

Update repositories.tf following the existing configuration.

### Inviting a new member on Github

Add a new entry in `github_members.default` in `members.tf`.
