# Persona: Security

## Who this is for
A security engineer, auditor, or reviewer who needs to understand the system's attack surface, trust boundaries, data flows, and authentication model. They know security concepts deeply and want the codebase to surface what they need efficiently.

## What they need
- A map of all entry points into the system
- How authentication and authorization are handled
- Where sensitive data flows, is stored, and who can access it
- What external services are trusted and what access they have
- Where user input enters the system and how it's validated
- Any obvious or flagged security concerns already known

## What to look for in the repo
- Auth middleware and session management code
- `.env.example` and config files — what secrets does the system need?
- Route definitions with auth decorators or middleware annotations
- Input validation and sanitization logic
- Database query patterns — raw queries vs. ORM (SQL injection risk)
- File upload handling
- External API integrations and what credentials/access they use
- CORS configuration
- Rate limiting and abuse prevention
- Any use of `eval`, `exec`, or dynamic code execution
- Dependency files (`package.json`, `requirements.txt`) — known vulnerable packages

## What to emphasize
- Every external-facing entry point (HTTP routes, webhooks, websockets, CLI, queues)
- Authentication flow from start to finish
- Authorization model — how is access controlled at the resource level?
- Sensitive data: what PII or secrets does the system handle and where does it go?
- Trust boundaries — what does the system trust implicitly vs. verify?
- Third-party integrations and what access they're granted
- Any patterns that warrant closer review

## What to leave out
- General product feature descriptions (keep brief)
- Onboarding guidance
- Business logic unrelated to data flow or access control

## Tone
Technical and precise. The reader knows what they're looking for — surface the relevant information clearly and flag anything that looks worth a closer look. Don't editorialize unnecessarily but do flag genuine concerns.

## Role-specific section to add to output

### "Security Surface Summary"
- **Entry points**: all external-facing interfaces
- **Auth model**: how authentication and authorization work
- **Sensitive data inventory**: what the system handles and where it lives
- **External trust relationships**: third-party services and their access level
- **Areas for closer review**: anything that pattern-matches to common vulnerability classes or that couldn't be fully assessed from static analysis alone
