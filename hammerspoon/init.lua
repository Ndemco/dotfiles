-- Helper to launch or focus an app by name or bundle ID
local function focus(app)
  hs.application.launchOrFocus(app)
end

-- cmd + ctrl + H  → Kitty terminal
hs.hotkey.bind({"cmd", "ctrl"}, "H", function()
  focus("kitty")
end)

-- cmd + ctrl + J  → IntelliJ IDEA
hs.hotkey.bind({"cmd", "ctrl"}, "J", function()
  -- You can use the app name OR bundle ID:
  -- "IntelliJ IDEA" or "com.jetbrains.intellij"
  focus("IntelliJ IDEA")
end)

-- cmd + ctrl + K  → Firefox (Mozilla)
hs.hotkey.bind({"cmd", "ctrl"}, "K", function()
  -- For Firefox:
  -- Name: "Firefox"
  -- Bundle: "org.mozilla.firefox"
  focus("Firefox")
end)

