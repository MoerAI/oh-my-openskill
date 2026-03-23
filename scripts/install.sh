#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SOURCE_DIR="${REPO_ROOT}/skills"

PROJECT_PATHS=(
  ".opencode/skills"
  ".claude/skills"
  ".agents/skills"
)

GLOBAL_PATHS=(
  "$HOME/.config/opencode/skills"
  "$HOME/.config/claude/skills"
  "$HOME/.agents/skills"
)

print_usage() {
  cat <<'EOF'
Usage: scripts/install.sh [--project | --global]

Options:
  --project   Install project-level symlinks only
  --global    Install user-level symlinks only

Default behavior:
  Prompt for project, global, or both.
EOF
}

ensure_dir() {
  local dir="$1"
  mkdir -p "$dir"
}

link_skill() {
  local source="$1"
  local target_dir="$2"
  local name
  local dest
  name="$(basename "$source")"
  dest="${target_dir}/${name}"

  if [[ -L "$dest" ]]; then
    local current
    current="$(readlink "$dest")"
    if [[ "$current" == "$source" ]]; then
      printf 'skip: %s already linked\n' "$dest"
      return 0
    fi
    printf 'warn: %s points to %s (not replaced)\n' "$dest" "$current"
    return 0
  fi

  if [[ -e "$dest" ]]; then
    printf 'warn: %s exists and is not a symlink (not replaced)\n' "$dest"
    return 0
  fi

  ln -s "$source" "$dest"
  printf 'link: %s -> %s\n' "$dest" "$source"
}

install_to_paths() {
  local -n paths_ref=$1
  local found=0
  local path
  local skill

  shopt -s nullglob
  local items=("${SOURCE_DIR}"/*)
  shopt -u nullglob

  if [[ ${#items[@]} -eq 0 ]]; then
    printf 'warn: no skills found in %s\n' "$SOURCE_DIR"
    return 0
  fi

  for path in "${paths_ref[@]}"; do
    if [[ "$path" != /* ]]; then
      path="${REPO_ROOT}/${path}"
    fi
    ensure_dir "$path"
    for skill in "${items[@]}"; do
      link_skill "$skill" "$path"
      found=1
    done
  done

  if [[ $found -eq 1 ]]; then
    printf 'done: installed links for selected paths\n'
  fi
}

choose_mode_interactive() {
  printf 'Select installation scope:\n'
  printf '  1) project-level (.opencode, .claude, .agents)\n'
  printf '  2) user-level (~/.config/* and ~/.agents)\n'
  printf '  3) both\n'
  printf 'Enter choice [1/2/3]: '
  read -r choice

  case "$choice" in
    1) echo "project" ;;
    2) echo "global" ;;
    3) echo "both" ;;
    *)
      printf 'error: invalid choice\n' >&2
      exit 1
      ;;
  esac
}

main() {
  local mode=""

  case "${1:-}" in
    --project)
      mode="project"
      ;;
    --global)
      mode="global"
      ;;
    --help|-h)
      print_usage
      exit 0
      ;;
    "")
      mode="$(choose_mode_interactive)"
      ;;
    *)
      printf 'error: unknown option %s\n' "$1" >&2
      print_usage
      exit 1
      ;;
  esac

  case "$mode" in
    project)
      install_to_paths PROJECT_PATHS
      ;;
    global)
      install_to_paths GLOBAL_PATHS
      ;;
    both)
      install_to_paths PROJECT_PATHS
      install_to_paths GLOBAL_PATHS
      ;;
    *)
      printf 'error: unsupported mode %s\n' "$mode" >&2
      exit 1
      ;;
  esac
}

main "$@"
