#!/usr/bin/env bash

set -e

# Default project name
PROJECT_NAME=${1:-chrome-extension}

mkdir -p "$PROJECT_NAME"

cd "$PROJECT_NAME"

# manifest.json
cat > manifest.json << 'EOF'
{
  "manifest_version": 3,
  "name": "Sample Chrome Extension",
  "version": "1.0",
  "description": "A basic Chrome extension template",
  "action": {
    "default_popup": "popup.html",
    "default_icon": {
      "16": "icon16.png",
      "48": "icon48.png",
      "128": "icon128.png"
    }
  },
  "content_scripts": [
    {
      "matches": ["<all_urls>"],
      "js": ["content.js"]
    }
  ],
  "background": {
    "service_worker": "background.js"
  },
  "permissions": []
}
EOF

# popup.html
cat > popup.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
  <title>Popup</title>
  <link rel="stylesheet" href="popup.css">
</head>
<body>
  <h1>Hello Chrome Extension!</h1>
  <button id="clickMe">Click me</button>

  <script src="popup.js"></script>
</body>
</html>
EOF

# popup.css
cat > popup.css << 'EOF'
body { font-family: Arial, sans-serif; padding: 10px; }
h1 { font-size: 16px; margin-bottom: 10px; }
button { padding: 5px 10px; }
EOF

# popup.js
cat > popup.js << 'EOF'
document.getElementById('clickMe').addEventListener('click', () => {
  alert('Button clicked!');
});
EOF

# content.js
cat > content.js << 'EOF'
// Content script example
console.log("Content script loaded");
EOF

# background.js
cat > background.js << 'EOF'
// Background service worker example
console.log("Background worker running");
EOF

# sample icons
for size in 16 48 128; do
  convert -size ${size}x${size} xc:blue "icon${size}.png" || touch "icon${size}.png"
done

echo "Chrome extension template created in $PROJECT_NAME"
