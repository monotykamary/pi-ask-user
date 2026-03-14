# Campaign: Check all project files

## Objective
Run a small TARGET-mode smoke test of the campaign feature by verifying every tracked project file listed in `campaign.files` is present and readable, then confirm the package still passes its existing `npm run check` validation.

## Mode
TARGET

## Metrics
- **Primary**: `files_checked` (count, higher is better)
- **Target**: `11` tracked project files checked successfully
- **Secondary**: package dry-run check passes via `./campaign.checks.sh`

## How to Run
`./campaign.sh` — prints one `CHECK ...` line per file and a final `METRIC files_checked=<count>` line.

## Files in Scope
- `.github/workflows/publish.yml` — npm publish workflow
- `.gitignore` — ignore rules
- `index.ts` — ask_user extension implementation
- `LICENSE` — package license
- `media/ask-user-demo.gif` — demo asset
- `media/ask-user-demo.mp4` — demo video
- `package-lock.json` — lockfile
- `package.json` — package metadata and scripts
- `README.md` — package documentation
- `skills/ask-user/references/ask-user-skill-extension-spec.md` — skill/tool interaction reference
- `skills/ask-user/SKILL.md` — bundled decision-gate skill

## Off Limits
- Existing project files are read-only for this smoke test.
- No product-code changes beyond campaign artifacts.

## Constraints
- Keep the campaign small and deterministic.
- Validate the full manifest in `campaign.files`.
- `npm run check` must pass.
- No new dependencies.

## What's Been Tried
- Run 1: Baseline completed successfully; `./campaign.sh` checked all 11 manifest files and `./campaign.checks.sh` passed `npm run check`.
