# GitHub Repository Setup for Card Images

## Repository Structure

You need to create a GitHub repository to host your card images. The website will load images from this repository using GitHub's raw content URLs.

### Required Repository Structure

```
your-repo/
├── packs/
│   ├── Himbo/
│   │   ├── Common/
│   │   │   ├── 1.png
│   │   │   ├── 2.png
│   │   │   └── ...
│   │   ├── Uncommon/
│   │   │   ├── 1.png
│   │   │   └── ...
│   │   ├── Rare/
│   │   ├── Epic/
│   │   ├── Legendary/
│   │   ├── pack_body.png
│   │   └── tear_top.png
│   └── [Other Pack Name]/
│       └── ...
```

### Steps to Set Up

1. **Create a new GitHub repository** (e.g., `tcg-card-images` or similar)

2. **Upload your card images** maintaining the folder structure:
   - Copy the `packs` folder from `modules/twitch_tcg_module/tcg_data/packs/`
   - Upload it to your GitHub repository
   - The structure should be: `packs/{pack_name}/{rarity}/{card_id}.png`

3. **Update the website HTML**:
   - Open `modules/twitch_tcg_module/web_export/index.html`
   - Find the line: `const IMAGE_BASE_URL = 'https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/';`
   - Replace with your actual repository URL:
     ```javascript
     const IMAGE_BASE_URL = 'https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/';
     ```
   - Example:
     ```javascript
     const IMAGE_BASE_URL = 'https://raw.githubusercontent.com/MikoOki/tcg-card-images/main/';
     ```

4. **Image URL Format**:
   - The website will construct URLs like:
     `https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/packs/Himbo/Common/1.png`

### Example Repository

If your repository is:
- **Username**: `MikoOki`
- **Repository**: `tcg-card-images`
- **Branch**: `main`

Then your `IMAGE_BASE_URL` should be:
```javascript
const IMAGE_BASE_URL = 'https://raw.githubusercontent.com/MikoOki/tcg-card-images/main/';
```

And a card image URL would be:
```
https://raw.githubusercontent.com/MikoOki/tcg-card-images/main/packs/Himbo/Common/1.png
```

### Notes

- The exporter automatically converts local Windows paths to relative paths (e.g., `packs/Himbo/Common/1.png`)
- Make sure your GitHub repository is public (or use a GitHub token if private)
- You can update images anytime by pushing to the repository
- The website will automatically use the latest images from GitHub
