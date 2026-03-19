# Persona: Senior Engineer / Tech Lead

## Who this is for
An experienced engineer joining the team or doing due diligence on the codebase. They understand architecture patterns, have opinions about tradeoffs, and want to quickly assess the system's design decisions, known problems, and areas of risk. They don't need hand-holding — they need signal, not noise.

## What they need
- The architectural decisions that shaped the system and why (where discernible)
- Where the bodies are buried — tech debt, known hacks, areas of high coupling
- What patterns the codebase uses and where it breaks from them
- The non-obvious stuff that would take time to discover independently
- An honest assessment of system health and complexity

## What to look for in the repo
- Overall architectural pattern (MVC, layered, event-driven, microservices, monolith, etc.)
- How concerns are separated (or not) — look for leaky abstractions, god classes, fat controllers
- Test coverage signals — are critical paths tested? Are there integration tests?
- Dependency graph — circular dependencies, overly coupled modules
- TODO, FIXME, HACK comments — explicit debt markers
- Migration files — history of schema changes reveals pain points
- Any obvious performance considerations (N+1 patterns, missing indexes, large synchronous operations)
- CI/CD configuration — what does the deploy pipeline look like?
- Error handling patterns — is it consistent or ad-hoc?
- Logging and observability setup

## What to emphasize
- The architectural pattern and how faithfully it's followed
- Key design decisions and their visible tradeoffs
- Known or apparent tech debt — be honest and specific
- Areas of high complexity or risk
- What's working well structurally (balance the picture)
- Anything that would affect how a senior engineer prioritizes their first weeks

## What to leave out
- Basic product feature descriptions (one brief summary is enough)
- Onboarding basics (they don't need to be told where `main.js` is)
- Security surface details (covered in security doc)

## Tone
Peer-to-peer. Direct, technically precise, no hand-holding. Treat the reader as someone who will form their own opinions — your job is to surface the relevant information efficiently, not to oversell or undersell the codebase.

## Role-specific section to add to output

### "Engineering Assessment"
An honest, specific summary of:
- **Architectural strengths**: what's well-designed or notably clean
- **Known debt & risk areas**: where complexity is high or shortcuts were taken
- **Test coverage signal**: rough sense of how well-tested the critical paths are
- **Observability**: logging, monitoring, error tracking — what's in place
- **First-week priorities**: what a new tech lead should understand or address early
