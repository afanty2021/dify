# AGENTS.md

## Project Overview

Dify is an open-source platform for developing LLM applications with an intuitive interface combining agentic AI workflows, RAG pipelines, agent capabilities, and model management.

**Current Version**: 1.11.3

The codebase is split into:

- **Backend API** (`/api`): Python Flask application organized with Domain-Driven Design
- **Frontend Web** (`/web`): Next.js 15 application using TypeScript and React 19 with Turbopack
- **Docker deployment** (`/docker`): Containerized deployment configurations

## Version Requirements

**Backend:**
- Python: `>=3.11,<3.13` (3.11 or 3.12 only)
- Package Manager: `uv` (replaced Poetry in v1.3.0)

**Frontend:**
- Node.js: `>=22.12.0`
- Package Manager: `pnpm@10.27.0+`
- Build Tool: Turbopack (Next.js native bundler)

## Backend Workflow

- **Package Management**: `uv` is used for dependency management (replaced Poetry in v1.3.0)
  - Install dependencies: `cd api && uv sync --dev`
  - Run commands: `uv run --project api <command>`

- **Setup** (using Makefile):
  ```bash
  make dev-setup      # Full dev environment setup
  make prepare-api    # API environment only (requires Docker middleware running)
  ```

- **Before submission**, all backend modifications must pass local checks:
  ```bash
  make lint           # ruff format + check + import linter
  make type-check     # basedpyright type checking
  make test           # pytest unit tests
  ```

- **Individual commands** (if not using Makefile):
  ```bash
  uv run --project api --dev ruff format ./api
  uv run --project api --dev ruff check --fix ./api
  uv run --directory api --dev basedpyright
  uv run --project api --dev dev/pytest/pytest_unit_tests.sh
  ```

- Integration tests are CI-only and are not expected to run in the local environment.

## Frontend Workflow

- **Development**:
  ```bash
  cd web
  pnpm dev            # Start dev server with Turbopack
  pnpm build          # Production build
  ```

- **Before submission**, all frontend modifications must pass local checks:
  ```bash
  pnpm lint:fix       # ESLint with auto-fix
  pnpm type-check:tsgo # TypeScript type checking with tsgo
  pnpm test           # Vitest unit tests
  ```

- **Additional useful commands**:
  ```bash
  pnpm type-check     # Standard TypeScript check
  pnpm test:coverage  # Run tests with coverage
  pnpm test:watch     # Watch mode for development
  pnpm i18n:check     # Check i18n completeness
  pnpm knip           # Find unused dependencies
  ```

- **Testing Framework**: Vitest (not Jest) - reference `web/testing/testing.md` for test generation guidelines

## Testing & Quality Practices

- **TDD Approach**: red → green → refactor
- **Backend Testing**:
  - Use `pytest` with Arrange-Act-Assert structure
  - Unit tests: `uv run --project api --dev dev/pytest/pytest_unit_tests.sh`
  - Integration tests: CI-only
- **Frontend Testing**:
  - Use `Vitest` (not Jest)
  - Reference `web/testing/testing.md` for canonical test generation guidelines
  - All tests must comply with the `frontend-testing` skill
- **Code Quality**:
  - Enforce strong typing; avoid `Any` (Python) or `any` (TypeScript)
  - Prefer explicit type annotations
  - Write self-documenting code; only add comments that explain intent

## Language Style

- **Python**:
  - Keep type hints on functions and attributes
  - Implement relevant special methods (e.g., `__repr__`, `__str__`)
  - Type checking with `basedpyright` (not mypy or standard pyright)
- **TypeScript**:
  - Use strict config
  - Rely on ESLint (`pnpm lint:fix`) + `pnpm type-check:tsgo`
  - Avoid `any` types (use `unknown` or proper types instead)

## General Practices

- Prefer editing existing files; add new documentation only when requested
- Inject dependencies through constructors and preserve clean architecture boundaries
- Handle errors with domain-specific exceptions at the correct layer
- Use `uv` for backend package management, `pnpm` for frontend

## Project Conventions

- **Backend Architecture**:
  - Domain-Driven Design (DDD) and Clean Architecture principles
  - Async work through Celery with Redis as the broker
  - Type checking with `basedpyright` for faster, more accurate analysis
- **Frontend Architecture**:
  - Next.js 15 with App Router
  - React 19 with server components
  - User-facing strings must use `web/i18n/en-US/`; avoid hardcoded text
- **Development Workflow**:
  - Use `make dev-setup` for initial environment setup
  - Docker middleware required for local development (PostgreSQL, Redis, Weaviate)
