# Open-Cursor

A PowerShell function to open the [Cursor](https://cursor.com) editor from the terminal **and close the terminal window immediately**.

It behaves exactly like running:

```powershell
cursor .
```

…except:
- Your terminal closes right after launching Cursor
- You can pass a folder path or arguments just like the normal `cursor` command
- It still uses `cursor.cmd` internally, so CLI behavior is identical

---

## 🚀 Features
- **Same behavior as `cursor`** — uses the official `cursor.cmd` wrapper
- **Closes terminal automatically** after launching
- **Supports arguments** — open any folder or pass CLI flags
- **No lingering `cmd.exe` window**
- **Aliases for speed** — `cop` and `copen`

---

## 🏷 Name & Aliases

The main function is called `Open-Cursor` for clarity, but it comes with two aliases:

- **`cop`** — short for **C**ursor **Op**en (fastest to type)
- **`copen`** — matches the original name from early versions

You can use any of them:

```powershell
cop .
copen .
Open-Cursor .
```

They all do the same thing.

---

## 📦 Installation

### 1. Quick Install (Recommended)
Run this in PowerShell:

```powershell
irm https://raw.githubusercontent.com/<YourUsername>/Open-Cursor/main/install.ps1 | iex
```

This will:
- Download the `Open-Cursor` function
- Add it to your PowerShell profile (if not already there)
- Reload your profile automatically
- Let you use `cop`, `copen`, or `Open-Cursor` immediately

---

### 2. Manual Install
1. Download [`Open-Cursor.ps1`](./Open-Cursor.ps1) from this repo.
2. Open your PowerShell profile in Notepad:

   ```powershell
   notepad $PROFILE
   ```

3. Paste the contents of `Open-Cursor.ps1` into the file and save.
4. Reload your profile:

   ```powershell
   . $PROFILE
   ```

---

## 🛠 Usage

```powershell
# Open current folder in Cursor
cop

# Open a specific folder
cop C:\path\to\project

# Pass CLI arguments to Cursor
cop --version
```

You can replace `cop` with `copen` or `Open-Cursor` — they all work the same.

---

## ❓ How it Works
- Finds the `cursor.cmd` file in your PATH
- Runs it in a hidden `cmd.exe` process
- Closes your PowerShell window immediately

This ensures:
- You get the **exact same environment** as the normal `cursor` command
- No extra console windows remain open

---

## 🗑 Uninstall
1. Open your PowerShell profile:

   ```powershell
   notepad $PROFILE
   ```

2. Remove the `Open-Cursor` function and its aliases.
3. Save and reload your profile:

   ```powershell
   . $PROFILE
   ```

---

## 📄 License
MIT License — feel free to use, modify, and share.

---

## 🤷 Why?
Because I’m lazy… and a tiny bit weird.  
Typing `cop` is faster, and watching my terminal vanish after launching Cursor makes me happy.