# AGENTS.md — opencode_docker

## What this is
Docker image packaging opencode.ai CLI with a comprehensive set of development tools (Rust, Python, Node.js, Common Lisp, Docker-in-Docker, and many utilities) for use in OSC52-compatible terminals.

## Stack
- Docker (Debian base)
- Shell scripts (bash)
- Rust toolchain (via rustup)
- Python packages (pip)
- Common Lisp (SBCL, Quicklisp, SLIME/swank, Paredit)
- Agent tooling: `yq`, `duckdb`, `universal-ctags`, `tree-sitter-cli`, `chromium-driver`, `openssh-client`, `zstd`, `7zip`
- Python 3D/STL: `numpy`, `trimesh`, `numpy-stl`
- opencode.ai CLI

## Build
```bash
docker build -t myridia/opencode .
```

The base is pinned to `debian:trixie`. The OpenSCAD nightly repo is pinned to the
GWDG OBS mirror (`ftp.gwdg.de`): `download.opensuse.org` redirects to mirrors that
can be out of sync and fail apt with `File has unexpected size`. `yq` and DuckDB
are installed as release binaries because Debian 13 does not package them.

## Run
```bash
docker run -it --privileged myridia/opencode bash
# Inside container: opencode
```

## Structure
- `Dockerfile` — main image with dev tools, Rust, Python, Node.js, Common Lisp, Docker CLI
- `entrypoint.sh` — starts dockerd + bash
- `ask.sh` — task switch: metadata-driven menu + dispatch from `ask.d/`
- `ask.d/` — one script per task with `# id:` / `# group:` / `# desc:` headers
- `ask.d/lib.sh` — shared `IMAGE` and `NAME`
- `Makefile` — build shortcuts
- `proxy/` — proxychains/redsocks config
- `example/` — usage examples and configs
- `pages/public/img/` — logos and screenshots

## Conventions
- No comments in code unless asked; the `# id:` / `# group:` / `# desc:` headers in `ask.d/` are metadata and required.
- The menu is built from those headers: adding a task means one new file in `ask.d/`, no `ask.sh` edit.
- The user builds and runs the image through `./ask.sh`; the agent never runs it.
- Quicklisp lives in `/root/quicklisp` and is loaded by `/root/.sbclrc`; headless Lisp runs use `sbcl --script <file>`.
