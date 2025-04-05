# 📥 Android APK Auto Downloader

This project provides Bash scripts that can **automatically fetch and download the latest stable (non-beta) version of an Android app** from [APKMirror](https://www.apkmirror.com/).

## 🗂 Files

- `getVersion.sh` – Fetches the latest **non-beta** version of an app (default: Android category like Snapchat).
- `script.sh` – Downloads the APK using that version.

> 📝 Although the script defaults to Snapchat, **you can modify the URL to download any APK** if the correct link is provided.

---

## 🚀 Features

- ✅ Automatically detects and uses the latest **non-beta** version.
- 🔍 Parses HTML using [`pup`](https://github.com/ericchiang/pup).
- 📥 Downloads the APK directly as `snap.apk`.
- 🧰 Handles different architecture types (`universal`, `noarch`) when available.
- ❌ Skips beta versions automatically.
- 🌐 Works with **any app** on APKMirror — just update the link!

---

## 📦 Requirements

Make sure you have the following installed:

- `bash`
- `curl`
- `wget`
- [`pup`](https://github.com/ericchiang/pup) – for HTML parsing

### Install `pup`:

```bash
# Debian/Ubuntu
sudo apt install pup

# macOS (via Homebrew)
brew install pup
```

---

## 🔧 Usage

### Step 1: Make the scripts executable

```bash
chmod +x getVersion.sh script.sh
```

### Step 2: Run the main script

```bash
./script.sh
```

By default, it downloads the latest stable version of Snapchat, but you can **modify the URL** in both scripts to fetch APKs from other apps as well.

---

## 📜 Example Output

```bash
Found version: android-app-12-67-0-29
Downloading APK from: https://www.apkmirror.com/...
APK downloaded successfully as snap.apk
```

---

## 🧠 How It Works

- **`getVersion.sh`**:  
  Scrapes the APKMirror uploads page for a specific app (like Snapchat), filters out beta versions, and returns the latest stable version in a formatted string like `android-app-12-67-0-29`.

- **`script.sh`**:  
  Uses that version to locate the correct download page, finds the final download URL, and saves the APK as `snap.apk`.

---

## 🔄 Customizing for Any App

To use this with a different app:

1. Open both `getVersion.sh` and `script.sh`.
2. Replace this URL with your target app's upload page:
   ```bash
   https://www.apkmirror.com/uploads/?appcategory=Snapchat
   ```
   You can find other app categories by browsing [https://www.apkmirror.com](https://www.apkmirror.com).

---

## 🛑 Troubleshooting

- If you see `noapk`, `noversion`, or `error`, it might mean:
  - The version or APK wasn't found
  - The app doesn't have a universal or noarch version
  - APKMirror’s layout has changed and parsing failed

Add `set -x` at the top of your script for debugging purposes.

---

## 📬 Support

Found a bug or want to improve the script?  
Feel free to open an issue or submit a pull request!
