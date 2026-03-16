# Travel Photo Gallery

A static travel photo gallery built with [Prosopopee](https://prosopopee.readthedocs.io/en/latest/), a static site generator modelled on exposure.co.

## Development environment

Uses [devenv](https://devenv.sh) with Python/uv. Enter the environment with `devenv shell`.

Key packages in the environment:
- `graphicsmagick` — image resizing
- `ffmpeg` — video transcoding

## Common commands

All commands must be run inside the devenv shell:

```bash
devenv shell -- prosopopee test     # validate settings.yaml files
devenv shell -- prosopopee build    # generate the static site into build/
devenv shell -- prosopopee preview  # serve build/ on http://localhost:9000
```

## Post-task workflow

After every task: run `prosopopee build`, then `prosopopee test`, and ensure `prosopopee preview` is running so the result is immediately viewable at http://localhost:9000.

## Project structure

```
settings.yaml        # root site config (title, theme)
<gallery>/           # one directory per gallery
  settings.yaml      # gallery metadata + sections
  *.JPG / *.MOV      # media files
build/               # generated output (gitignored)
```

## Gallery settings.yaml format

```yaml
title: Gallery Title
sub_title: subtitle
date: 2026-02-18
cover: COVER.JPG       # shown on the homepage

sections:
  - type: full-picture
    image: HERO.JPG

  - type: pictures-group
    images:
      - [IMG_A.JPG, IMG_B.JPG, IMG_C.JPG]   # row of 3
      - [IMG_D.JPG, IMG_E.JPG]               # row of 2
      - - name: VIDEO.MOV                    # video row
          type: video

  - type: text
    text: Some text, HTML <b>allowed</b>.
```

## Dependencies

`prosopopee` is installed from the GitHub master branch (not PyPI 1.1.5) because the PyPI release is incompatible with Jinja2 3.x and Python 3.13. The `path` package is a transitive dependency via prosopopee (no need to declare it explicitly).
