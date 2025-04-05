# 📥 Snapchat APK Auto Downloader

This project contains two Bash scripts to automatically **fetch and download the latest stable (non-beta) version of Snapchat** from [APKMirror](https://www.apkmirror.com/).

## 🗂 Files

- `getVersion.sh` – Fetches the latest **non-beta** version of Snapchat.
- `script.sh` – Downloads the latest Snapchat APK file using that version.

---

## 🚀 Features

- ✅ Automatically detects and uses the latest **non-beta** Snapchat version.
- 🔍 Parses HTML using [`pup`](https://github.com/ericchiang/pup).
- 📥 Downloads the APK directly as `snap.apk`.
- 🧰 Handles architecture types (`universal`, `noarch`) when present.
- ❌ Skips all beta versions automatically.

---

## 📦 Requirements

Make sure you have the following installed:

- `bash`
- `curl`
- `wget`
- [`pup`](https://github.com/ericchiang/pup) – for HTML parsing

### Install `pup` (if not already installed):

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

This will:

1. Automatically get the latest version using `getVersion.sh`
2. Download the corresponding APK
3. Save it as `snap.apk`

---

## 📜 Example Output

```bash
Found version: snapchat-12-67-0-29
Downloading APK from: https://www.apkmirror.com/...
APK downloaded successfully as snap.apk
```

---

## 🧠 How It Works

- **`getVersion.sh`**:  
  Scrapes the Snapchat uploads page on APKMirror, filters out any beta versions, and returns the latest stable version in a format like `snapchat-12-67-0-29`.

- **`script.sh`**:  
  Uses that version to construct the correct download page URL, navigates the site, and finds the direct download link to the APK.

---

## 🛑 Troubleshooting

- If you get `noapk`, `noversion`, or `error` messages, it usually means:
  - APKMirror updated its layout (HTML structure may have changed)
  - A version was not found
  - `pup` failed to parse some content

You can add `set -x` at the top of the script for debugging.

---

## 📬 Support

Found a bug or want to improve the script?  
Feel free to open an issue or submit a pull request!

---

Let me know if you want me to add badge icons, a sample screenshot, or even automate version-to-filename mapping!
