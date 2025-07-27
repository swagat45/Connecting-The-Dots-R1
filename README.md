# Round‑1A – Heading Detection

CPU‑only Docker image that converts every PDF in `/in` to a `<name>.json` outline in `/out`.

## Build & Run

```bash
docker build -t connectdots_r1 .
docker run -v $PWD/sample_docs:/in -v $PWD/out:/out connectdots_r1
```

Outputs:

```jsonc
{
  "title": "Graph Neural Networks for Drug Discovery",
  "outline": [
    { "level": "H1", "text": "Introduction",  "page": 1 },
    ...
  ]
}
```

*Image ≈ 820 MB, runtime <10 s for 100 pages.*
