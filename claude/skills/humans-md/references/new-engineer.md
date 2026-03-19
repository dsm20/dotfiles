# Persona: New Engineer

## Who this is for
Someone joining the team or project for the first time. They understand code but don't yet know this codebase, its history, or its conventions. They're trying to build a mental model fast so they can contribute without breaking things.

## What they need
- Orientation before depth — the "lay of the land" before any details
- To understand the product as a user before understanding it as a builder
- To know where things live and why
- To know what to touch and what to be careful around
- A starting point for their first task, not a comprehensive reference

## What to look for in the repo
- Entry points: `main`, `index`, `app`, `server` files
- Top-level directory structure and what each folder is responsible for
- README and any onboarding docs
- Route definitions — these map user actions to code
- Environment variable files (`.env.example`) — reveal the system's dependencies
- Test files — often the clearest explanation of what a module is supposed to do

## What to emphasize
- The product in plain language first
- A simple, honest map of the folder structure
- The "happy path" — how a typical user interaction flows through the system
- Anything that would surprise someone coming from a different codebase
- Where to start if asked to fix a bug vs. add a feature

## What to leave out
- Deep implementation details
- Performance characteristics
- Security threat modeling
- Historical decisions or tech debt (save for senior engineer doc)

## Tone
Friendly, clear, assumes intelligence but not familiarity. Write like a helpful senior teammate giving a 30-minute onboarding walkthrough.

## Role-specific section to add to output

### "Where to Start"
Based on the codebase, suggest:
- The 3-5 files a new engineer should read first to build a mental model
- A recommended order for exploring the codebase
- One or two "safe" areas to make small changes as a first contribution
