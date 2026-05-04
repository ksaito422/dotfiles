{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    taps = [
      "adoptopenjdk/openjdk"
      "aws/tap"
      "daipeihust/tap"
      "heroku/brew"
      "songmu/tap"
    ];
    brews = [
      { name = "cocoapods"; link = false; }
      "docker"
      "edencommon"
      "fb303"
      "fbthrift"
      "firefoxpwa"
      "fizz"
      "folly"
      "httpd"
      "ios-deploy"
      "lima-additional-guestagents"
      "rustup"
      "wangle"
      "daipeihust/tap/im-select"
      "songmu/tap/blogsync"
    ];
    casks = [
      "1password"
      "app-cleaner"
      "dbeaver-community"
      "discord"
      { name = "firefox"; args = { language = "ja"; }; }
      "font-hackgen-nerd"
      "gcc-arm-embedded"
      "google-chrome"
      "google-japanese-ime"
      "hammerspoon"
      "karabiner-elements"
      "raycast"
      "slack"
      "stats"
      "wezterm@nightly"
    ];
    masApps = {
      GarageBand = 682658836;
      iMovie = 408981434;
      Keynote = 409183694;
      Numbers = 409203825;
      Pages = 409201541;
    };
  };
}
