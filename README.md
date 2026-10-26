# powershell-auto-title

Auto-title every PowerShell window and tab to show the current folder and
machine name:

```
"C:\Users\you\projects" - MyPC
```

The title updates automatically as you `cd` around, because it re-runs on
every prompt. Works in **Windows Terminal** and the classic console, in
**admin** and non-admin sessions, and in **every tab**.

## Why

By default, Windows Terminal names every PowerShell tab "Windows
PowerShell" (or "PowerShell"). With several tabs open you can't tell them
apart. This sets each tab's title to the folder you're in plus the machine
name, so you always know where a tab is running from.

## Install

Save `profile.ps1` as your PowerShell profile:

| Shell                  | Profile path                                                          |
| ---------------------- | --------------------------------------------------------------------- |
| Windows PowerShell 5.1 | `C:\Users\<you>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1` |
| PowerShell 7 (pwsh)    | `C:\Users\<you>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1` |

If your profile already exists, **append** the contents of `profile.ps1`
instead of overwriting it. If not, create the file (and its folder).

Then restart PowerShell (or run `. $PROFILE`) and open a tab.

## Customize the machine label

The title uses your computer name by default. To use a different label —
say, to pretty-case it — edit this line at the top of `profile.ps1`:

```powershell
$TitleMachine = "MyPC"
```

## How it works

PowerShell calls the `prompt` function after every command. This overrides
it to set the console window title (`$host.UI.RawUI.WindowTitle`) to the
current location plus the machine name, then returns the normal
`PS C:\...>` prompt unchanged.

Windows Terminal reads that window title as the tab title (unless a profile
sets `suppressApplicationTitle` to `true`, which is off by default).

## FAQ

- **Does it work in admin windows?** Yes — as long as you run PowerShell as
  your own user account. Elevation doesn't change where your profile lives.
- **Every tab?** Yes — each tab is its own PowerShell process and loads the
  same profile.
- **PowerShell 5.1 and 7?** Both. Only the profile path differs (see the
  table above); the snippet itself is identical.
- **Wrong casing?** If the auto-detected name shows all-caps, set
  `$TitleMachine` to the exact label you want and it will be used as-is.

## License

MIT — see [LICENSE](LICENSE).
