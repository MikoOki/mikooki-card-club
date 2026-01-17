# TCG Card Collection Website

This website displays user card collections from the TCG module.

## Setup Instructions

### 1. GitHub Repository Setup

1. Create a new GitHub repository (or use existing one)
2. Initialize git in this `web_export` directory:
   ```bash
   cd web_export
   git init
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
   git branch -M main
   ```

### 2. Update Image URLs

Edit `index.html` and update the `IMAGE_BASE_URL` constant to point to your GitHub repository's raw content URL:
```javascript
const IMAGE_BASE_URL = 'https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/';
```

### 3. GitHub Pages Setup

1. Go to your GitHub repository → Settings → Pages
2. Under "Source", select "Deploy from a branch"
3. Select branch: `main` (or your default branch)
4. Select folder: `/` (root) or `/web_export` if you want it in a subdirectory
5. Click Save

The site will automatically deploy when `public_inventory.json` is updated via the bot.
Your site will be available at: `https://YOUR_USERNAME.github.io/YOUR_REPO/`

## How It Works

1. **Bot exports data**: When packs are opened, the bot automatically:
   - Exports inventory to `public_inventory.json`
   - Commits and pushes to GitHub (if git is initialized)
   - Cloudflare Pages auto-deploys the update

2. **Website displays**: The website:
   - Loads `public_inventory.json` on page load
   - Shows user selector dropdown
   - Displays cards organized by pack
   - Shows rarity colors and shiny indicators

## Manual Export

To manually export data without pushing:
```python
from modules.twitch_tcg_module.tcg_web_exporter import get_exporter
exporter = get_exporter()
exporter.export_to_json()
```

## Manual Push

To manually push to GitHub:
```python
from modules.twitch_tcg_module.tcg_github_pusher import get_pusher
pusher = get_pusher()
pusher.push_updates()
```
