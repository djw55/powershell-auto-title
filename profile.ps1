# ============================================================
#  powershell-auto-title
#  Auto-title every PowerShell window/tab to:
#      "<current folder>" - <machine>
# ============================================================
#
# Works in Windows Terminal and the classic console, in admin and
# non-admin sessions, and in every tab. The prompt re-runs after each
# command, so the title tracks your current folder as you cd around.
#
# Install: save as your profile (or append to it):
#   Windows PowerShell 5.1:
#     C:\Users\<you>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#   PowerShell 7:
#     C:\Users\<you>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

# Machine label shown after the dash. Defaults to your computer name.
# Set it to any custom label to override, e.g.:
#   $TitleMachine = "MyPC"
$TitleMachine = [System.Net.Dns]::GetHostName()

function prompt {
    $loc = $executionContext.SessionState.Path.CurrentLocation
    $host.UI.RawUI.WindowTitle = '"{0}" - {1}' -f $loc, $TitleMachine
    "PS $loc$('>' * ($NestedPromptLevel + 1)) "
}
