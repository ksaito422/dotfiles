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
      "fsouza/prettierd"
      "heroku/brew"
      "songmu/tap"
      "xwmx/taps"
    ];
    brews = [
      "openssl@3"
      "boost"
      "glib"
      "chafa"
      "cmake"
      "libyaml"
      { name = "cocoapods"; link = false; }
      "deno"
      "docker"
      "docker-compose"
      "folly"
      "fizz"
      "wangle"
      "fbthrift"
      "fb303"
      "edencommon"
      "efm-langserver"
      "firefoxpwa"
      "freetds"
      "gmp"
      "gawk"
      "gd"
      "grep"
      "grpcurl"
      "hivemind"
      "httpd"
      "shared-mime-info"
      "libheif"
      "imagemagick"
      "ios-deploy"
      "libfido2"
      "libgit2"
      "qemu"
      "lima-additional-guestagents"
      "luarocks"
      "mas"
      "mise"
      "nghttp2"
      "nkf"
      "pstree"
      "rustup"
      "superfile"
      "tree"
      "tree-sitter"
      "tree-sitter-cli"
      "typos-lsp"
      "zsh-autosuggestions"
      "zsh-syntax-highlighting"
      "daipeihust/tap/im-select"
      "fsouza/prettierd/prettierd"
      "songmu/tap/blogsync"
      "xwmx/taps/nb"
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
