# SSH Keys Setup

## Adding Your SSH Keys

After cloning this repository, you can add your SSH keys to this folder:

```bash
# Copy your SSH keys to this folder
cp ~/.ssh/id_ed25519 ./ssh-keys/
cp ~/.ssh/id_ed25519.pub ./ssh-keys/
```

**⚠️ IMPORTANT SECURITY NOTE:**
- SSH keys in this folder are **IGNORED by git** by default for security
- **NEVER commit private keys to a public repository**
- Only copy keys here for local setup convenience
- Consider using a private repository if you want to store keys

## Manual SSH Setup

If you have keys in this folder, you can set them up manually:

```bash
# Create .ssh directory with correct permissions
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Copy keys from this folder
cp ./ssh-keys/id_ed25519 ~/.ssh/
cp ./ssh-keys/id_ed25519.pub ~/.ssh/

# Set correct permissions
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub

# Start SSH agent and add key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

## Automatic Setup

The `install.sh` script will automatically detect and configure SSH keys if they exist in this folder.

## Generate New SSH Keys

If you don't have SSH keys yet:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Then add the public key to GitHub:
```bash
cat ~/.ssh/id_ed25519.pub
# Copy the output and add to GitHub → Settings → SSH and GPG keys
```
