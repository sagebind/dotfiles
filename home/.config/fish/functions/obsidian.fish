function obsidian -d "Run Obsidian CLI"
  if type -fq obsidian
    obsidian $argv
  else if type -fq flatpak
    # Ensure Obsidian is running first.
    if flatpak ps | not grep -q md.obsidian.Obsidian
      niri msg action spawn -- flatpak run md.obsidian.Obsidian
      sleep 5
    end

    flatpak run --command=zypak-wrapper md.obsidian.Obsidian /app/obsidian $argv
  else
    return 1
  end
end
