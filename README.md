# packages
Monorepo of all package build recipes (PKGBUILD or ebuild files) and custom system profiles.

## Kernel package inputs

`linux-emperor/` contains the kernel packaging inputs for the mainline
7.4-rc3 base:

- `config/emperor.fragment`: reviewed x86_64 "balanced" hardening and
  responsiveness policy.
- `config/defconfig`: generated with `make savedefconfig`; commit it so CI can
  detect config drift.
- `patches/series`: ordered patch filenames applied with `-p1`. It is
  intentionally empty at launch.
- `patches/apply.sh`: applies `patches/series` to a clean kernel tree.
- `README.md`: config merge, PKGBUILD/ebuild wiring, and rebase workflow.

Released ISOs should build from a 7.4.y stable tag; keep `-rc` for bring-up.
