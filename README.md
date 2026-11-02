# Storo

[![license](https://img.shields.io/badge/license-AGPL%20V3-blue)](LICENSE)

**Storo** is a high-performance, S3-compatible object storage server — an independent community continuation of [MinIO](https://github.com/minio/minio), which is [no longer maintained](https://github.com/minio/minio). Storo carries the codebase forward under the same AGPLv3 license.

- **S3 API compatible** – works with existing S3 tools and SDKs
- **Erasure-coded** – standalone or distributed multi-node
- **Built for AI & analytics** – optimized for large-scale data pipelines

> [!IMPORTANT]
> Storo is not affiliated with MinIO Inc. "MinIO" and "AIStor" are trademarks of their respective owner. The original copyright notices and [CREDITS](CREDITS) are retained as required by AGPLv3.

## Install from source

Requires [Go](https://golang.org/doc/install) 1.24+.

```sh
go install github.com/Stainless888/Storo@latest
```

Or build a target platform manually:

```sh
env GOOS=linux GOARCH=arm64 go build -o storo
```

Start the server with `storo server PATH`, where `PATH` is any empty folder. Default root credentials are `minioadmin:minioadmin`. The embedded web console is at <http://127.0.0.1:9000> (pick a fixed console port with `--console-address :9001`).

Test with any S3 tool, e.g. the MinIO Client `mc` (fully compatible):

```sh
mc alias set local http://localhost:9000 minioadmin minioadmin
mc mb data && mc ls data
```

> [!NOTE]
> Configuration environment variables still use the historical `MINIO_` prefix. A `STORO_` alias layer will arrive as the project matures; existing deployments keep working.

## Quick facts

| | |
|---|---|
| Binary | `storo` |
| Module | `github.com/Stainless888/Storo` |
| Default ports | API + Console on `:9000` |
| S3 health check | `GET /minio/health/live` (kept for tooling compatibility) |

## Docker

Build from source first (`go build -o storo`), then adapt `Dockerfile` and `dockerscripts/docker-entrypoint.sh` to your needs. Pre-built images are not yet published — this is a fork in early days.

## License

- Source: [GNU AGPLv3](LICENSE) — original copyright by MinIO Inc. and contributors retained, modifications by Stainless888.
- Docs: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
- [License Compliance](COMPLIANCE.md)
