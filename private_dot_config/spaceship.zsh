SPACESHIP_PROMPT_ORDER=(
  user           # Username section
  dir            # Current directory section
  host           # Hostname section
  git            # Git section (git_branch + git_status)
  package        # Package version
  node           # Node.js section
  bun            # Bun section
  ruby           # Ruby section
  elixir         # Elixir section
  golang         # Go section
  perl           # Perl section
  php            # PHP section
  rust           # Rust section
  erlang         # Erlang section
  exec_time      # Execution time
  line_sep       # Line break
  sudo           # Sudo indicator
  char           # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
  exit_code      # Exit code section
  time           # Time stamps section
  async          # Async jobs indicator
  jobs           # Background jobs indicator
)
SPACESHIP_TIME_SHOW=true
SPACESHIP_USER_SHOW=always
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_PROMPT_PREFIXES_SHOW=true
SPACESHIP_PROMPT_SUFFIXES_SHOW=true
SPACESHIP_DIR_TRUNC=0
